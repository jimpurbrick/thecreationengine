Title: Load Balancing Stateful Services With Nginx
Date: 2012-07-30 05:49
Tags: loadbalancing, nginx, state, web
Slug: load-balancing-stateful-services-nginx

The [EVE online](http://eveonline.com) network architecture uses stateful proxy servers which manage sessions for players connected to the cluster via the EVE client. The client sends requests to the proxy which are forwarded on to sol servers maintaining the game state and the sols send notifications to the proxy which are sent on to the client.

In developing the [CREST API](http://wiki.eveonline.com/en/wiki/CREST_Documentation) we extended the EVE proxies to talk HTTP, then added [nginx](http://wiki.nginx.org/Main) reverse proxies to the service to provide SSL termination and caching while shielding the EVE proxies from potentially malicious requests.

So, how does nginx know which EVE proxy to send a request to? In the first instance, it just guesses. We set up a set of proxies and use [proxy_pass](http://wiki.nginx.org/HttpProxyModule#proxy_pass) to have nginx just pick one.

    :::nginx
    upstream eveproxies {
        # List all eveproxies
    }

    location / {
        proxy_pass http://eveproxies;
    }

The proxy can then use the CCP cluster's RPC machinery to find the character's session. If nginx has been lucky the request is processed and the response sent back to nginx and from there to the player. If no session exists for the character on any proxy a new session is created and then the request processed as above. If the character session is on a different node the proxy returns an [X-accel](http://wiki.nginx.org/X-accel) response to a location which extracts the correct proxy URI from the path and resends the request.

    :::nginx
    location ~* ^/internal_redirect/(.*) {
        internal;
        proxy_pass http://$1$is_args$args;
    }

The performance of this approach can be greatly improved by caching the mapping of authorization headers to proxies, which can be done using a dict and a small piece of [lua](http://wiki.nginx.org/HttpLuaModule).

    :::nginx
    lua_shared_dict tokenToProxy 10m;

    location / {

       content_by_lua '
            -- make subrequest and capture response
            local response = ngx.location.capture("/proxy_request", {
                method = GetRequestMethod(ngx.var.request_method),
                body = ngx.req.get_body_data()})

            -- forward HTTP headers from response
            for k,v in pairs(response.header) do
                    ngx.header[k] = v
            end

            -- forward status and body from response
            ngx.status = response.status
            ngx.print(response.body)

            -- cache backend for next request
            ngx.shared.tokenToProxy:set(ngx.var.http_authorization,
                response.header["X-Backend"])
        ';
    }
 
    location /proxy_request {
 
        internal;
        set $crestProxy "http://eveproxies";
    
        rewrite_by_lua '
            ngx.var.crestProxy = ngx.shared.tokenToProxy:get(
                ngx.var.http_authorization)
        ';
    
        proxy_pass $crestProxy$request_uri;
    }

In a configuration with multiple loadbalancers we potentially have to pay the price of one proxy redirection per nginx process. This could potentially be improved by using a shared cache for the authorization to proxy mapping or by using ip affinity to map all requests from a client to a single nginx box, but in practice where the number of requests from a client is much larger than the number of loadbalancers, this improvement is likely to be negligible.

This mechanism ensures that most HTTP requests go straight to the correct proxy without the load balancers having to maintain any state. A new load balancer can be added to the cluster just be being told the addresses of the eve proxies and will quickly start routing requests to the correct location.