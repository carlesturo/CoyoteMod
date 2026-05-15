--[[
local VIEW_RADIUS = 10
local COS_FOV = math.cos(math.rad(90)) -- 180º total

local function IsPredator(a)
    return a and a.getAnimalType and a:getAnimalType() == "coyotemale"
end

local function normalize(x, y)
    local l = math.sqrt(x*x + y*y)
    if l == 0 then return 0, 0 end
    return x/l, y/l
end

local lastPos = {}

local function getForward(entity)
    local id = tostring(entity)

    local x = entity:getX()
    local y = entity:getY()

    local prev = lastPos[id]

    if not prev then
        lastPos[id] = {x = x, y = y}
        return 0, 1
    end

    local dx = x - prev.x
    local dy = y - prev.y

    lastPos[id].x = x
    lastPos[id].y = y

    local len = math.sqrt(dx*dx + dy*dy)
    if len == 0 then
        return 0, 1
    end

    return dx / len, dy / len
end

local scared = {}

Events.OnTick.Add(function()
    local cell = getCell()
    if not cell then return end

    local animals = cell:getAnimals()
    if not animals then return end

    for i = 0, animals:size() - 1 do
        local a = animals:get(i)

        if a and not IsPredator(a) then

            local ax, ay = a:getX(), a:getY()
            local fx, fy = getForward(a)

            for j = 0, animals:size() - 1 do
                local coyote = animals:get(j)

                if IsPredator(coyote) then

                    local dx = coyote:getX() - ax
                    local dy = coyote:getY() - ay

                    local distSq = dx*dx + dy*dy
                    if distSq < VIEW_RADIUS * VIEW_RADIUS then

                        local tx, ty = normalize(dx, dy)
                        local dot = fx * tx + fy * ty

                        if dot > COS_FOV then
                            if scared[a] ~= coyote then
                                scared[a] = coyote

                                local beh = a:getBehavior()
                                if beh then
                                    beh:forceFleeFromChr(coyote)
                                    a:spotted(coyote, true, 0)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
--]]

--[[
local FOV_ANGLE = math.rad(70)      -- mig con (140º total)
local COS_FOV = math.cos(FOV_ANGLE)
local VIEW_DISTANCE = 10

local function IsPredator(animal)
    return animal and animal.getAnimalType and animal:getAnimalType() == "coyotemale"
end

local function normalize(x, y)
    local len = math.sqrt(x*x + y*y)
    if len == 0 then return 0, 0 end
    return x / len, y / len
end

local lastPos = {}

local function getForwardVector(entity)
    local id = tostring(entity)

    local x = entity:getX()
    local y = entity:getY()

    local prev = lastPos[id]

    if not prev then
        lastPos[id] = {x = x, y = y}
        return 0, 1 -- default forward
    end

    local dx = x - prev.x
    local dy = y - prev.y

    lastPos[id].x = x
    lastPos[id].y = y

    local len = math.sqrt(dx*dx + dy*dy)
    if len == 0 then
        return 0, 1
    end

    return dx / len, dy / len
end

local scared = {}

local function applyFlee(animal, coyote)
    local beh = animal:getBehavior()
    if beh then
        beh:forceFleeFromChr(coyote)
        beh:setBlockMovement(false)
        animal:spotted(coyote, true, 0)
    end
end

Events.OnTick.Add(function()
    local animals = getCell():getAnimals()
    if not animals then return end

    for i = 0, animals:size() - 1 do
        local coyote = animals:get(i)

        if IsPredator(coyote) then

            local cx, cy = coyote:getX(), coyote:getY()
            local fx, fy = getForwardVector(coyote)

            for j = 0, animals:size() - 1 do
                local a = animals:get(j)

                if a ~= coyote and not IsPredator(a) then

                    local dx = a:getX() - cx
                    local dy = a:getY() - cy

                    local distSq = dx*dx + dy*dy
                    if distSq < VIEW_DISTANCE * VIEW_DISTANCE then

                        -- normalitza direcció cap a target
                        local tx, ty = normalize(dx, dy)

                        -- producte escalar (cos angle)
                        local dot = fx * tx + fy * ty

                        -- dins del FOV?
                        if dot > COS_FOV then

                            -- evitar spam cada tick
                            if scared[a] ~= coyote then
                                scared[a] = coyote
                                applyFlee(a, coyote)
                            end
                        else
                            -- si surt del FOV, reset
                            if scared[a] == coyote then
                                scared[a] = nil
                            end
                        end
                    end
                end
            end
        end
    end
end)
--]]

--[[
local function IsPredator(animal)
    return animal and animal.getAnimalType and animal:getAnimalType() == "coyotemale"
end

local function makeAfraid(animal, predator)
    if animal and animal.getBehavior then
        local beh = animal:getBehavior()
        if beh then
            beh:forceFleeFromChr(predator)
        end
    end
end

local scaredAnimals = {}

Events.OnTick.Add(function()
    local animals = getCell():getAnimals()

    for i = 0, animals:size() - 1 do
        local predator = animals:get(i)

        if IsPredator(predator) then
            local px, py = predator:getX(), predator:getY()
            local radius = 8

            for j = 0, animals:size() - 1 do
                local a = animals:get(j)

                if a ~= predator then
                    local dx = a:getX() - px
                    local dy = a:getY() - py
                    local dist = dx*dx + dy*dy

                    if dist < radius * radius then
                        -- només activar una vegada
                        if scaredAnimals[a] ~= predator then
                            scaredAnimals[a] = predator
                            makeAfraid(a, predator)
                        end
                    else
                        -- si s'allunya, deixa de ser “forçat”
                        if scaredAnimals[a] == predator then
                            scaredAnimals[a] = nil
                        end
                    end
                end
            end
        end
    end
end)
--]]
--[[
local STRESS_RADIUS = 12
local FLEE_RADIUS = 6

local function IsPredator(animal)
    return animal and animal.getAnimalType and animal:getAnimalType() == "coyotemale"
end

local function applyCoyoteEffect(animal, coyote, dist)
    if animal.changeStress then
        local intensity = math.max(0, 1 - (dist / STRESS_RADIUS))
        animal:changeStress(0.0005 * intensity)
    end

    if dist < FLEE_RADIUS then
        local beh = animal:getBehavior()
        if beh then
            beh:forceFleeFromChr(coyote)
        end
    end
end

Events.OnTick.Add(function()
    local animals = getCell():getAnimals()
    if not animals then return end

    for i = 0, animals:size() - 1 do
        local predator = animals:get(i)

        if IsPredator(predator) then

            local px, py = predator:getX(), predator:getY()

            for j = 0, animals:size() - 1 do
                local a = animals:get(j)

                if a ~= predator then
                    if not IsPredator(a) then
                        local dx = a:getX() - px
                        local dy = a:getY() - py
                        local dist = math.sqrt(dx*dx + dy*dy)

                        if dist < STRESS_RADIUS then
                            applyCoyoteEffect(a, predator, dist)
                        end
                    end
                end
            end
        end
    end
end)
--]]

--[[
local function IsPredator(animal)
    return animal and animal.getAnimalType and animal:getAnimalType() == "coyotemale"
end

local function applyCoyoteStress(animal, predator, dist)
    if not animal or not animal.changeStress then return end

    local intensity = math.max(0, 1 - (dist / 8))

    local baseStress = 0.0005

    animal:changeStress(baseStress * intensity)
end

Events.OnTick.Add(function()
    local animals = getCell():getAnimals()
    if not animals then return end

    for i = 0, animals:size() - 1 do
        local predator = animals:get(i)

        if IsPredator(predator) then

            local px, py = predator:getX(), predator:getY()
            local radius = 8

            for j = 0, animals:size() - 1 do
                local a = animals:get(j)

                if a ~= predator then
                    local dx = a:getX() - px
                    local dy = a:getY() - py
                    local dist = math.sqrt(dx*dx + dy*dy)

                    if dist < radius then
                        applyCoyoteStress(a, predator, dist)
                    end
                end
            end
        end
    end
end)
--]]

--[[
local function makeAfraid(animal, predator)
    if animal and animal.getBehavior then
        local beh = animal:getBehavior()

        if beh then
            beh:forceFleeFromChr(predator)
            beh:setBlockMovement(false)

            -- opcional: simular “alerta”
            animal:spotted(predator, true, 0)
        end
    end
end

Events.OnTick.Add(function()
    local animals = getCell():getAnimals()

    for i = 0, animals:size() - 1 do
        local predator = animals:get(i)

        if IsPredator(predator) then
            local px, py = predator:getX(), predator:getY()
            local radius = 8

            for j = 0, animals:size() - 1 do
                local a = animals:get(j)

                if a ~= predator then
                    local dx = a:getX() - px
                    local dy = a:getY() - py
                    local dist = math.sqrt(dx*dx + dy*dy)

                    if dist < radius then
                        makeAfraid(a, predator)
                    end
                end
            end
        end
    end
end)
--]]

--[[
local function IsPredator(animal)
    return animal and animal.getAnimalType and animal:getAnimalType() == "coyotemale"
end

Events.OnTick.Add(function()
    local cell = getCell()
    local animals = cell:getAnimals()

    for i=0, animals:size()-1 do
        local coyote = animals:get(i)

        if IsPredator(coyote) then

            local sq = coyote:getSquare()
            if sq then

                local list = sq:getAnimals()

                for j=0, list:size()-1 do
                    local a = list:get(j)

                    if a ~= coyote then
                        a:spotted(coyote, true, 0)
                        a:getBehavior():forceFleeFromChr(coyote)
                    end
                end
            end
        end
    end
end)
--]]