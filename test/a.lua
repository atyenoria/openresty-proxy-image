local redis = require "resty.redis"
local client = redis:new()
local ok, err = client:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))

local balance, err = client:lrange("server", 0, -1)
-- print(balance)
local num = tonumber(client:get("index"))
-- print(num)
-- print(type(num))
local target = balance[num]
-- print(target)
-- print(type(target))
if table.getn(balance) - 1 < tonumber(num) then
num = 0
end
client:set("index",num + 1)






