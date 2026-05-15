local CoyoteUtils = require("CoyoteMod/Utils")

local old_setAnimalAvatar = ISButcherHookUI.setAnimalAvatar

function ISButcherHookUI:setAnimalAvatar(newModData, newCorpse)
    old_setAnimalAvatar(self, newModData, newCorpse)

    if not self.avatarPanel or not self.animal3D then return end
    if not CoyoteUtils.isCoyote(self.animal3D) then return end

    self.avatarPanel:setVariable("isCoyote", true)
    self.avatarPanel:setVariable("isCoyotePup", CoyoteUtils.isCoyotePup(self.animal3D))
end