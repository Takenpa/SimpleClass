local simpleClassPath -- path to module
local module = require(simpleClassPath).new()

function module:Constructor(messages : {}) : nil
	local defaultMessages = {
		['HelloMessage'] = 'Hello',
		['GoodbyeMessage'] = 'Goodbye'}
	
	local messages = messages or {}
	
	for index,value in pairs(defaultMessages) do
		self[index] = messages[index] or value
	end
end

function module:Init()
	self._print = print
end

function module:SayHello(userName : string?) : nil
	self:SayMessage(self.HelloMessage,userName)
end

function module:SayGoodbye(userName : string?) : nil
	self:SayMessage(self.GoodbyeMessage,userName)
end

function module:SayMessage(message : string,userName : string?) : nil
	local text
	
	if userName then
		text = self:MakeText(message,tostring(userName))
	else
		text = (message .. '!')
	end
	
	self:Say(text)
end

function module:MakeText(mainText, userName : string)
	return (mainText .. ', ' .. userName .. '!');
end

function module:Say(text : string) : nil
	self._print(text)
end

return module
