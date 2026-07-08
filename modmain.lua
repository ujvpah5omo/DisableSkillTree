local _G = GLOBAL
local require = _G.require
local skilltreedefs = require "prefabs/skilltree_defs"

local disabled_skilltrees = {}
local disable_all_skilltrees = GetModConfigData("disable_all_skilltrees") == true

local function IsSkillTreeDisabled(characterprefab)
    local setting = GetModConfigData(characterprefab)

    if setting == "disable" then
        return true
    end

    if setting == "enable" then
        return false
    end

    return disable_all_skilltrees
end

for characterprefab in pairs(skilltreedefs.SKILLTREE_DEFS) do
    if IsSkillTreeDisabled(characterprefab) then
        disabled_skilltrees[characterprefab] = true
        skilltreedefs.SKILLTREE_DEFS[characterprefab] = nil
    end
end

AddComponentPostInit("skilltreeupdater", function(cmp)
    local old_AddSkillXP = cmp.AddSkillXP

    cmp.AddSkillXP = function(self, amount, prefab, fromrpc)
        if disabled_skilltrees[self.inst.prefab] then
            return
        end

        return old_AddSkillXP(self, amount, prefab, fromrpc)
    end
end)
