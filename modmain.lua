local _G = GLOBAL
local require = _G.require
local skilltreedefs = require "prefabs/skilltree_defs"

local disabled_skilltrees = {}

for characterprefab in pairs(skilltreedefs.SKILLTREE_DEFS) do
    if GetModConfigData(characterprefab) == true then
        disabled_skilltrees[characterprefab] = true
        skilltreedefs.SKILLTREE_DEFS[characterprefab] = nil
    end
end

AddComponentPostInit("skilltreeupdater", function(cmp)
    if disabled_skilltrees[cmp.inst.prefab] then
        -- Disabled skill trees should not gain XP or trigger point updates.
        cmp.AddSkillXP = function()
        end
    end
end)
