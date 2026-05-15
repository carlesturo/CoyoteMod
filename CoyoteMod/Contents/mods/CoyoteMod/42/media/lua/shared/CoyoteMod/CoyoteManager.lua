-- Created by albion

---REQUIREMENTS
local CoyoteUtils = require("CoyoteMod/Utils")

---@namespace CoyoteMod


---Used to manage coyotes presence in the world, whenever they are loaded / unloaded.
local CoyoteManager = {
    ---Table holding all the available coyotes in the player cell.
    ---@type IsoAnimal[]
    coyotes = table.newarray(),

    ---@type table<IsoAnimal, true?>
    _detected_coyotes = {},
}

function CoyoteManager.removeCoyote(coyote, i)
    if i then
        table.remove(CoyoteManager.coyotes, i)
    else
        for i = #CoyoteManager.coyotes, 1, -1 do
            if CoyoteManager.coyotes[i] == coyote then
                table.remove(CoyoteManager.coyotes, i)
                break
            end
        end
    end
    CoyoteManager._detected_coyotes[coyote] = nil
end

function CoyoteManager.releaseRemovedCoyotes()
    for i = #CoyoteManager.coyotes, 1, -1 do
        local coyote = CoyoteManager.coyotes[i]
        if not coyote:isExistInTheWorld() or coyote:isDead() then
            CoyoteManager.removeCoyote(coyote, i)
        end
    end
end


---@param coyote IsoAnimal
local function initialiseCoyote(coyote)
    coyote:setVariable("isCoyote", true)
    coyote:setVariable("isCoyotePup", CoyoteUtils.isCoyotePup(coyote))

	coyote:getModData()['animalSize'] = coyote:getAnimalSize()
end


---Detect newly created coyotes by parsing the moving objects array list of the player cell 

local UPDATE_RATE = 8
local TICK_AMOUNT = 0
local CAN_GET_ANIMALS = getCore():getGameVersion():isGreaterThanOrEqualTo(GameVersion.new(42, 16, ".0"))

CoyoteManager.retrieveNewCoyotes = function()
    -- retrieve IsoMovingObjects
    local animals = CAN_GET_ANIMALS and getCell():getAnimals() or getCell():getObjectList()

    -- check UPDATE_RATE-th IsoMovingObjects per tick
    local size = animals:size()
    local update_rate = UPDATE_RATE < size and UPDATE_RATE or size
    if update_rate == 0 then return end

    -- update to next tick amount offset to parse next selection of the list
    TICK_AMOUNT = TICK_AMOUNT < update_rate - 1 and TICK_AMOUNT + 1 or 0

    -- iterate every update_rate-th entries
    for i = TICK_AMOUNT, size - 1, update_rate do repeat
        local animal = animals:get(i)

        -- pre 42.16 used getObjectList which contains all IsoObjects, so we need to check if it's an IsoAnimal before proceeding
        if not CAN_GET_ANIMALS and not instanceof(animal, "IsoAnimal") then break end

        -- verify is a coyote and not already checked and not dead
        if (CoyoteUtils.isCoyote(animal) or CoyoteUtils.isCoyotePup(animal))
            and not CoyoteManager._detected_coyotes[animal] then
            
            -- initialise coyote
            initialiseCoyote(animal)

            -- add to detected coyotes
            CoyoteManager.coyotes[#CoyoteManager.coyotes + 1] = animal
            CoyoteManager._detected_coyotes[animal] = true
        end
    until true end
end

---Sends
function CoyoteManager.update()
    CoyoteManager.retrieveNewCoyotes()
    CoyoteManager.releaseRemovedCoyotes()
end

Events.OnTick.Add(CoyoteManager.update)

return CoyoteManager




-----REQUIREMENTS
--local CoyoteUtils = require("CoyoteMod/Utils")
--local Event = require("HorseMod/Event")
--local AnimationVariable = require('HorseMod/definitions/AnimationVariable')
--
-----@namespace CoyoteMod
--
--
----- A system is a module to process behavior or logic for coyotes.
-----@class System
--local __System = {}
--
-----@param coyotes IsoAnimal[]
-----@param delta number
--function __System:update(coyotes, delta) end
--
-----Used to manage coyotes presence in the world, whenever they are loaded / unloaded.
--local CoyoteManager = {
--    ---Table holding all the available coyotes in the player cell.
--    ---@type IsoAnimal[]
--    coyotes = table.newarray(),
--
--    ---@type table<IsoAnimal, true?>
--    _detected_coyotes = {},
--
--    ---Systems for coyotes that are triggered for them every ticks.
--    ---@type System[]
--    systems = table.newarray(),
--}
--
-----Triggers when a coyote gets loaded in.
--CoyoteManager.onCoyoteAdded = Event.new--[[@<IsoAnimal>]]()
--
-----Triggers when a coyote gets unloaded.
--CoyoteManager.onCoyoteRemoved = Event.new--[[@<IsoAnimal>]]()
--
-----Triggers before a coyote manager update.
--CoyoteManager.preUpdate = Event.new()
--
--function CoyoteManager.removeCoyote(coyote, i)
--    if i then
--        table.remove(CoyoteManager.coyotes, i)
--    else
--        for i = #CoyoteManager.coyotes, 1, -1 do
--            if CoyoteManager.coyotes[i] == coyote then
--                table.remove(CoyoteManager.coyotes, i)
--                break
--            end
--        end
--    end
--    CoyoteManager.onCoyoteRemoved:trigger(coyote)
--    CoyoteManager._detected_coyotes[coyote] = nil
--end
--
--function CoyoteManager.releaseRemovedCoyotes()
--    for i = #CoyoteManager.coyotes, 1, -1 do
--        local coyote = CoyoteManager.coyotes[i]
--        if not coyote:isExistInTheWorld() or coyote:isDead() then
--            CoyoteManager.removeCoyote(coyote, i)
--        end
--    end
--end
--
--
-----@param coyote IsoAnimal
--local function initialiseCoyote(coyote)
--    coyote:setVariable("isCoyote", true)
--
--    local speed = horse:getUsedGene("speed"):getCurrentValue()
--    horse:setVariable(AnimationVariable.GENE_SPEED, speed)
--    local strength = horse:getUsedGene("strength"):getCurrentValue()
--    horse:setVariable(AnimationVariable.GENE_STRENGTH, strength)
--    local stamina = horse:getUsedGene("stamina"):getCurrentValue()
--    horse:setVariable(AnimationVariable.GENE_STAMINA, stamina)
--    local carry = horse:getUsedGene("carryWeight"):getCurrentValue()
--    horse:setVariable(AnimationVariable.GENE_CARRYWEIGHT, carry)
--
--    -- this is used to make sure the animal gets its size properly set
--    -- on the new IsoAnimal instance created when attaching to a butcher hook
--    -- which is done in ButcheringUtil.createAnimalForHook
--    -- and in Java side when reloading the area/save
--    coyote:getModData()['animalSize'] = coyote:getAnimalSize()
--end
--
-----Utility function to find a coyote by its animal ID.
-----@param animalID number
-----@return IsoAnimal?
--CoyoteManager.findCoyoteByID = function(animalID)
--    local coyotes = CoyoteManager.coyotes
--    for i = 1, #coyotes do
--        local coyote = coyotes[i]
--        if coyote:getAnimalID() == animalID then
--            return coyote
--        end
--    end
--    return nil
--end
--
--
-----Detect newly created coyotes by parsing the moving objects array list of the player cell 
--
--local UPDATE_RATE = 8
--local TICK_AMOUNT = 0
--local CAN_GET_ANIMALS = getCore():getGameVersion():isGreaterThanOrEqualTo(GameVersion.new(42, 16, ".0"))
--
-----Retrieve newly loaded coyotes in the world.
-----@TODO find a better method of doing this, less costly
--CoyoteManager.retrieveNewCoyotes = function()
--    -- retrieve IsoMovingObjects
--    local animals = CAN_GET_ANIMALS and getCell():getAnimals() or getCell():getObjectList()
--
--    -- check UPDATE_RATE-th IsoMovingObjects per tick
--    local size = animals:size()
--    local update_rate = UPDATE_RATE < size and UPDATE_RATE or size
--    if update_rate == 0 then return end
--
--    -- update to next tick amount offset to parse next selection of the list
--    TICK_AMOUNT = TICK_AMOUNT < update_rate - 1 and TICK_AMOUNT + 1 or 0
--
--    -- iterate every update_rate-th entries
--    for i = TICK_AMOUNT, size - 1, update_rate do repeat
--        local animal = animals:get(i)
--
--        -- pre 42.16 used getObjectList which contains all IsoObjects, so we need to check if it's an IsoAnimal before proceeding
--        if not CAN_GET_ANIMALS and not instanceof(animal, "IsoAnimal") then break end
--
--        -- verify is a coyote and not already checked and not dead
--        if CoyoteUtils.isCoyote(animal) 
--            and not CoyoteManager._detected_coyotes[animal] then
--            
--            -- initialise coyote
--            initialiseCoyote(animal)
--            
--            -- trigger coyote init event
--            CoyoteManager.onCoyoteAdded:trigger(animal)
--
--            -- add to detected coyotes
--            CoyoteManager.coyotes[#CoyoteManager.coyotes + 1] = animal
--            CoyoteManager._detected_coyotes[animal] = true
--        end
--    until true end
--end
--
---- Events.OnTick.Add(CoyoteManager.retrieveNewCoyotes)
--
-----Sends
--function CoyoteManager.update()
--    CoyoteManager.retrieveNewCoyotes()
--    CoyoteManager.releaseRemovedCoyotes()
--
--    CoyoteManager.preUpdate:trigger()
--
--    local delta = GameTime.getInstance():getTimeDelta()
--    for i = 1, #CoyoteManager.systems do
--        CoyoteManager.systems[i]:update(CoyoteManager.coyotes, delta)
--    end
--end
--
--Events.OnTick.Add(CoyoteManager.update)
--
--
--return CoyoteManager