local module = {}
module.__index = module

local gc_references = {
	['trove'] = script.Trove,
	['janitor'] = script.Janitor,
	['maid'] = script.Maid}

local gc_name = '_gccleaner'

function module.new(cleanerName : string, isOnBasedClass : boolean) : module
	cleanerName = cleanerName or 'Trove';
	if isOnBasedClass then
		return module.BasedCreate(cleanerName);
	end
	if not gc_references[string.lower(cleanerName)] then
		return;
	end
	
	return module.CreateClass(cleanerName);
end

function module.CreateClass(cleanerName : string) : module
	local object = {}
	object.__index = object

	function object.new(...)
		local self = setmetatable({},object)

		return self:_initGC(cleanerName) or self:Constructor(...) or self:Init() or self;
	end

	function object:Constructor(...) end
	function object:Init() end

	function object:_initGC(name : string) : {}
		local moduleRef = gc_references[string.lower(name)]
		local module = require(moduleRef)

		self[gc_name] = module.new()
	end
	
	return object;
end

function module.BasedCreate(cleanerName : string) : module
	local object = setmetatable({},module)	
	object.__index = object

	function object.new(...) : object
		local self = setmetatable({},object)

		return self:_initGC(cleanerName) or self:Constructor(...) or self:Init() or self;
	end

	return object;
end
function module:_initGC(name : name) : nil
	local moduleRef = gc_references[string.lower(name)]
	local module = require(moduleRef)
	
	self[gc_name] = module.new()
end

function module:Destroy()
	self[gc_name]:Destroy()
end

function module:Init() end
function module:Constructor() end

return module;
