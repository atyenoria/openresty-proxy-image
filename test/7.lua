 local cjson = require "cjson"
    local redis = require "resty.redis"

    local red = redis:new()
    local red2 = redis:new()

    red:set_timeout(1000) -- 1 sec
    red2:set_timeout(1000) -- 1 sec

    local ok, err = red:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))
    if not ok then
        ngx.say("1: failed to connect: ", err)
        return
    end

    ok, err = red2:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))
    if not ok then
        ngx.say("2: failed to connect: ", err)
        return
    end

    local res, err = red:subscribe("dog")
    if not res then
        ngx.say("1: failed to subscribe: ", err)
        return
    end

    ngx.say("1: subscribe: ", cjson.encode(res))

    res, err = red2:publish("dog", "Hello")
    if not res then
        ngx.say("2: failed to publish: ", err)
        return
    end

    ngx.say("2: publish: ", cjson.encode(res))

    res, err = red:read_reply()
    if not res then
        ngx.say("1: failed to read reply: ", err)
        return
    end

    ngx.say("1: receive: ", cjson.encode(res))

    red:close()
    red2:close()