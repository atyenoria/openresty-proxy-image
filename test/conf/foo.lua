module("foo", package.seeall)

local bar = require "bar"

ngx.say("bar loaded")

function say (var)
    bar.say(var)
end