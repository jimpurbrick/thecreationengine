Title: Introspecting Python Decorators
Date: 2011-08-25 17:05
Tags: decorators, django, introspection, python, web
Slug: introspecting-python-decorators

Over the last couple of years I've found myself using python decorators to annotate handlers for web requests more and more, both when using [Django](https://www.djangoproject.com/) and with micro-frameworks like [mnml](http://morethanseven.net/2009/05/28/another-glue-python-framework-mnml.html) and [newf](https://github.com/luckythetourist/newf).

Where the same functionality is required for all handlers, or the required functionality can be determined from standard request or response headers, using [WSGI](http://www.wsgi.org/wsgi/Middleware_and_Utilities) or [Django](https://docs.djangoproject.com/en/dev/topics/http/middleware/) middleware is fine, but where the required functionality is varies based on the handler its much cleaner to use a parameterised decorator than poluting the environment or response objects just to control the middleware. Functionality can be added to a framework as a suite of decorators and plugged together in an [aspect oriented](http://en.wikipedia.org/wiki/Aspect-oriented_programming) way like lego to easily build up sophisticated behaviours.

Unlike other mechanisms for implementing macros, templating or aspect orientation that introduce a new language, python decorators are pure syntactic sugar that under the hood are simply rewritten as python expressions:

    :::python
    @requires_oauth_scope("email")
    def notify_friends(request):
        pass

Is simply shorthand for:

    def notify_friends(request):
        pass

    notify_friends = requires_oauth_scope("email")(notify_friends)

This simplicity is powerful as it allows decorators to also be used as normal functions, for example to build up higher level decorators that bundle common decorator configurations, but it also means that decorators potentially interact badly with another powerful Python feature: introspection.

In the above example the undecorated notify_friends function has the __name__ "notify_friends", but the decorated function has the __name__ "requires_oauth_scope". When decorators are used extensively, this can seriously impact the usefulness of introspection for debugging or generating documentation.

Decorating your decorators with the [functools](http://docs.python.org/library/functools.html) @wraps decorator, which copies the __name__ of the wrapped function over to the wrapping function solves this introspection problem, but introduces another: the decorators now become invisible to introspection. In the example above the __name__ of the decorated function would now be "notify_friends" as in the undecorated case, but we wouldn't know that the function had been decorated or not.

A potential solution to this new problem is to store the details about the decoration in another attribute that can be inspected at runtime. In addition to copying over the __name__ attribute, functools.wraps also copies over the target __dict__ by default, allowing it to be used to store information about the decoration and be correctly copied over when decorators are chained:

    :::python
    from functools import wraps

    def requires_oauth_scope(scope):

        def decorator(target):

            target.__dict__["my_project_requires_oauth_scope"] = scope

            @wraps(target)
            def wrapper(*args, **kwargs):
                # return target(*args, **kwargs) or FORBIDDEN if token does not have required scope
        
            return wrapper
        return decorator

By constructing decorators in this way we get the benefits of python decorators and more declarative C# style attributes that are visible to introspection.