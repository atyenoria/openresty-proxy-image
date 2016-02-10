    local cjson = require "cjson"
    local ok, err = red:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))
    local res, err = red:mget("h1234", "h5678")
    if res then
        print("res: ", cjson.encode(res))
    end
    local cjson = require "cjson"
    local res, err = red:mget("h1234", "h5678")
    if res then
        print("res: ", cjson.encode(res))
    end