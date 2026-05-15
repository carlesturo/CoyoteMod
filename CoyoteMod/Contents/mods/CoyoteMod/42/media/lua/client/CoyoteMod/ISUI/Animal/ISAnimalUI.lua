local CoyoteUtils = require("CoyoteMod/Utils")

-- Hook ISAnimalUI to setup our animation when it's a coyote

local old_create = ISAnimalUI.create

local function setCoyoteAvatarVariables(avatar)
    if not avatar or not avatar.setVariable or not avatar.animal then return end
    if not CoyoteUtils.isCoyote(avatar.animal) then return end
    avatar:setVariable("isCoyote", true)
    avatar:setVariable("isCoyotePup", CoyoteUtils.isCoyotePup(avatar.animal))
end

---@diagnostic disable-next-line: duplicate-set-field
ISAnimalUI.create = function(self)
    old_create(self)
    if CoyoteUtils.isCoyote(self.animal) then
		self.avatarPanel:setVariable("isCoyote", true)
		self.avatarPanel:setVariable("isCoyotePup", CoyoteUtils.isCoyotePup(self.animal))
    end
end

local old_vehicleCreate = ISVehicleAnimalUI.create

---@diagnostic disable-next-line: duplicate-set-field
function ISVehicleAnimalUI:create(reset)
    old_vehicleCreate(self, reset)
    for _, animalPanel in ipairs(self.scrollPanel.avatars) do
        setCoyoteAvatarVariables(animalPanel.avatar)
    end
end