local module = {}
module.__index = module

local trove = require(script.Trove)

function module.new()
	local object = setmetatable({},module)	
	object.__index = object
	
	function object.new(...)
		local self = setmetatable({},object)
		
		return self:Constructor(...) or self:Init() or self;
	end
	
	return object:_init() or object;
end


function module:_init()
	self._trove = trove.new()
end


function module:Destroy()
	self._trove:Destroy()
end

function module:Init()
end
function module:Constructor()
end

return module;
