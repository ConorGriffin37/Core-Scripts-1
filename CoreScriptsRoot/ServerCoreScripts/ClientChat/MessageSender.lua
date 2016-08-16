local source = [[
local module = {}
--////////////////////////////// Include
--//////////////////////////////////////
local modulesFolder = script.Parent
local ClassMaker = require(modulesFolder:WaitForChild("ClassMaker"))

--////////////////////////////// Methods
--//////////////////////////////////////
local methods = {}

function methods:SendMessage(message, toChannel)
	self.SayMessageRequest:FireServer(message, toChannel)
end

function methods:RegisterSayMessageEvent(event)
	rawset(self, "SayMessageRequest", event)
end

--///////////////////////// Constructors
--//////////////////////////////////////
ClassMaker.RegisterClassType("MessageSender", methods)

function module.new()
	local obj = {}
	obj.SayMessageRequest = nil

	ClassMaker.MakeClass("MessageSender", obj)
	
	return obj
end

return module.new()
]]

local generated = Instance.new("ModuleScript")
generated.Name = "Generated"
generated.Source = source
generated.Parent = script