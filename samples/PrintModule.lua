local module = require(script.Parent.Parent.SimpleClass).new()

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

function module:SayHello(userName : string) : nil
	local text = (userName and self.HelloMessage .. ' ' .. userName .. '!') or self.HelloMessage .. '!'
	
	self._print(text)
end

function module:SayGoodbye(userName : string?) : nil
	local userName = tostring(userName)
	local text = (userName and self.GoodbyeMessage .. ' ' .. userName .. '!') or self.HelloMessage .. '!'
	
	self._print(text)
end

function module:Say(text : string) : nil
	self._print(text)
end

return module
