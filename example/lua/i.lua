local redis = require "resty.redis"
local client = redis:new()
local ok, err = client:connect(os.getenv("REDIS_PORT_6379_TCP_ADDR"), os.getenv("REDIS_PORT_6379_TCP_PORT"))


client:del("server")
balance = {"192.168.99.101","192.168.99.102"}
for i = 1, table.getn(balance) do
client:lpush("server", balance[i])
end

client:set("machine 1",0)
client:set("machine 2",0)
client:set("machine 3",0)
client:set("index",1)

print("redis load balancer key initialization")