    local redis = require "resty.redis"
    local red = redis:new()

    red:set_timeout(1000) -- 1 sec

    local ok, err = red:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))
    if not ok then
        ngx.say("failed to connect: ", err)
        return
    end

    local res, err = red:auth("foobared")
    if not res then
        ngx.say("failed to authenticate: ", err)
        return
    end