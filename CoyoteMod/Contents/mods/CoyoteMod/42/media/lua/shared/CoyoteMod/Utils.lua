-- Created by albion

local CoyoteUtils = {}

CoyoteUtils.isCoyote = function(animal)
    local t = animal:getAnimalType()
    return t == "coyotemale" or t == "coyotefemale"
end

CoyoteUtils.isCoyotePup = function(animal)
    return animal:getAnimalType() == "coyotepup"
end

return CoyoteUtils

--[[
local COYOTE_TYPES = {
	["coyotemale"] = true,
	["coyotefemale"] = true,
	["coyotepup"] = true
} 

local CoyoteUtils = {}

CoyoteUtils.isCoyote = function(animal)
	return COYOTE_TYPES[animal:getAnimalType()] or false
end

return CoyoteUtils
--]]