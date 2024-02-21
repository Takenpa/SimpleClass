local module = {}
module.__index = module

local gc_name = '_gccleaner'

local trove = require(script.Trove)

function module.new() : module
	local class = {}
	class.__index = class

	function class.new(...)
		local self = setmetatable({},class)

		return self:Constructor(...) or self;
	end

	function class:Constructor(...) end
	class.extend = module.extend
	
	return class;
end

function module:extend()
	local super = self
	
	local object = setmetatable({},{__index = super})
	object.__index = object
	
	function object.new(...)
		local self = setmetatable({},object)
		
		return self:Constructor(...) or self;
	end
	
	function object:SuConstructor(...)
		super.Constructor(self,...)
	end
	
	function object:Constructor(...)
		self:SuConstructor(...)
		
		--other
	end
	
	return object;
end

return module;
