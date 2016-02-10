local redis = require "resty.redis"
local client = redis:new()
client:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), tonumber(os.getenv("REDIS_PORT_6379_TCP_PORT")))

local args = ngx.req.get_uri_args()
local key, field = args.key, args.field

local result, err = client:hmget(key, field)
ngx.say(result)