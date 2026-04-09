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