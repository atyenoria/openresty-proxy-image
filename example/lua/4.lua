local cjson = require "cjson"
    local redis = require "resty.redis"
    local red = redis:new()

    red:set_timeout(1000) -- 1 sec

    local ok, err = red:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))
    if not ok then
        ngx.say("failed to connect: ", err)
        return
    end

    local ok, err = red:multi()
    if not ok then
        ngx.say("failed to run multi: ", err)
        return
    end
    ngx.say("multi ans: ", cjson.encode(ok))

    local ans, err = red:set("a", "abc")
    if not ans then
        ngx.say("failed to run sort: ", err)
        return
    end
    ngx.say("set ans: ", cjson.encode(ans))

    local ans, err = red:lpop("a")
    if not ans then
        ngx.say("failed to run sort: ", err)
        return
    end
    ngx.say("set ans: ", cjson.encode(ans))

    ans, err = red:exec()
    ngx.say("exec ans: ", cjson.encode(ans))

    red:close()