Title: Adding Vary Header Support To Nginx
Date: 2012-10-14 17:12
Tags: devops, nginx, operations, programming, web, web services
Slug: adding-vary-header-support-nginx

Although Nginx supports proxy caching it doesn't provide support for the [HTTP Vary](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.44) header out of the box. This is a problem if you want to use Nginx to proxy different versions of the same URI which Vary on [Content-Language](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.12) or proxy different representations of a RESTful resource specified via the  [Accept](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1) header.

Fortunately it's relatively easy to add support for the Vary header using the [Nginx Lua](http://wiki.nginx.org/HttpLuaModule) module and a small amount of Lua, which is much easier than building and maintaining a 3rd party module and doesn't greatly impact performance.

First, we define a dictionary in the nginx config which will store a mapping from URIs to Vary headers:

    :::nginx
    lua_shared_dict uriToVary 10m;

Next we define the default location in the nginx config.

    :::nginx
    location / {

        # make subrequest to /proxy_request, then store response headers
        content_by_lua '
            local vary = require("vary")
            local response = vary.ProxyRequest()
        ';
    }

This will use the lua ProxyRequest function to make a subrequest to /proxy_request then store the Vary header in the response in the dictionary.

    :::lua
    function ProxyRequest()

        -- make subrequest and capture response
        local response = ngx.location.capture("/proxy_request", {
            method = GetRequestMethod(ngx.var.request_method), body = ngx.req.get_body_data()})

        -- forward HTTP headers from response
        for k,v in pairs(response.header) do
            ngx.header[k] = v
        end

        ngx.shared.uriToVary:set(ngx.var.request_uri, response.header["Vary"])

        -- forward status and body from response
        ngx.status = response.status
        ngx.print(response.body)
    
        return response

    end

Finally, we define the /proxy_request location.

    :::nginx
    location /proxy_request {
        internal;

        # set defaults
        set $noCache 1;
        set $cacheBypass 1;
        set $cacheKey nil;

        # rewrite using stored data
        rewrite_by_lua '
            local vary = require("vary")
            vary.RewriteCache()
        ';

        # proxy request
        proxy_cache_bypass $cacheBypass;
        proxy_no_cache $noCache;
        proxy_cache_key $cacheKey;
        proxy_cache API_CACHE;
        proxy_pass $proxy$request_uri;
    }

This will use the lua RewriteCache function to combine the uri with the vary headers to generate the final cache key used by the proxy_cache module.

    :::lua
    function RewriteCache()

        local varyOn = ngx.shared.uriToVary:get(ngx.var.request_uri)
        local cacheKey = nil

        -- if vary unknown for this uri, bypass cache and do not cache
        if varyOn == nil then
            return
        end

        cacheKey = ngx.var.request_uri .. GenerateCacheKey(varyOn, ngx.req.get_headers())
        ngx.var.noCache = 0
        ngx.var.cacheKey = cacheKey
        ngx.var.cacheBypass = 0
    
    end

    function GenerateCacheKey(varyOnStr, requestHeaders)

        local cacheKey = ""
        for part in string.gmatch(varyOnStr, "([^,%s+]+)") do

            if requestHeaders[part] then
                cacheKey = cacheKey .. ":" .. requestHeaders[part]
            end

        end

        return cacheKey

    end

The first time a URI is requested the cache will be bypassed, but the Vary header from the response will be stored in the shared dictionary. The second time the URI is requested the cache key will be generated from the URI and the appropriate request headers specified in the vary header and the response will be cached. When the URI is subsequently requested with the same set of headers it will be served from the cache.

Note that when the shared dictionary is full it will evict old entries using an LRU scheme. Nginx will generate "ngx_slab_alloc() failed" errors when this occurs, but these can [safely be ignored](https://github.com/chaoslawful/lua-nginx-module/issues/163).

Thanks to [@jonastryggvi](https://twitter.com/jonastryggvi) for working with me on the Vary support and [@CCPGames](https://twitter.com/CCPGames) for allowing me to blog about it.