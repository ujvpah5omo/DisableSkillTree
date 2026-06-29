local _G = GLOBAL
local require = _G.require
local skilltreedefs = require "prefabs/skilltree_defs"

for characterprefab, skills in pairs(skilltreedefs.SKILLTREE_DEFS) do
    if GetModConfigData(characterprefab) then
        skilltreedefs.SKILLTREE_DEFS[characterprefab] = nil
    end
end

AddComponentPostInit("skilltreeupdater", function(cmp)
    local old_fn = cmp.AddSkillXP
    local function new_fn(amount, prefab, fromrpc)
        _G.TheSkillTree.ignorexp = true -- disable notifications
        old_fn(amount, prefab, fromrpc)
    end
    cmp.AddSkillXP = new_fn
end)
