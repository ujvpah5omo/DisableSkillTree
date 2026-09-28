version = "1.2.1"
version_compatible = "1.2.0"
name = ChooseTranslationTable({
    "Disable Skill Trees",
    ["zh"] = "禁用技能树",
    ["zht"] = "禁用技能樹",
})
description = ChooseTranslationTable({
    "Disable character skill trees. You can disable all skill trees by default, then override individual characters.",
    ["zh"] = "禁用角色技能树。可以默认禁用全部技能树，也可以为单个角色单独覆盖设置。",
    ["zht"] = "禁用角色技能樹。可以預設禁用全部技能樹，也可以為單個角色單獨覆蓋設定。",
})
author = "Codex"
forumthread = "https://steamcommunity.com/sharedfiles/filedetails/?id=3754239826"
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
all_clients_require_mod = true
client_only_mod = false
server_only_mod = false
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
hamlet_compatible = false
server_filter_tags = {"skill tree", "character", "configurable"}

local strings =
{
    title = {
        en = "General",
        zh = "通用设置",
        zht = "通用設定",
    },
    disable_all = {
        en = "Disable all skill trees by default",
        zh = "默认禁用全部技能树",
        zht = "預設禁用全部技能樹",
    },
    disable_all_hover = {
        en = "When enabled, every character skill tree is disabled unless that character is set to Enabled below.",
        zh = "开启后，所有角色技能树都会被禁用；下面单独设置为“启用”的角色除外。",
        zht = "開啟後，所有角色技能樹都會被禁用；下面單獨設定為「啟用」的角色除外。",
    },
    override_title = {
        en = "Per-character overrides",
        zh = "单角色覆盖设置",
        zht = "單角色覆蓋設定",
    },
    use_default = {
        en = "Use default",
        zh = "跟随默认",
        zht = "跟隨預設",
    },
    disabled = {
        en = "Disabled",
        zh = "禁用",
        zht = "禁用",
    },
    enabled = {
        en = "Enabled",
        zh = "启用",
        zht = "啟用",
    },
    yes = {
        en = "Yes",
        zh = "是",
        zht = "是",
    },
    no = {
        en = "No",
        zh = "否",
        zht = "否",
    },
    character_hover = {
        en = "Use default follows the global option. Disabled always disables this character. Enabled always keeps this character's skill tree.",
        zh = "“跟随默认”会使用全局设置；“禁用”始终禁用该角色；“启用”始终保留该角色技能树。",
        zht = "「跟隨預設」會使用全域設定；「禁用」始終禁用該角色；「啟用」始終保留該角色技能樹。",
    },
}

local characters =
{
    {name = "walter",     en = "Walter",     zh = "沃尔特",   zht = "沃爾特"},
    {name = "wathgrithr", en = "Wigfrid",    zh = "薇格弗德", zht = "薇格弗德"},
    {name = "wendy",      en = "Wendy",      zh = "温蒂",     zht = "溫蒂"},
    {name = "willow",     en = "Willow",     zh = "薇洛",     zht = "薇洛"},
    {name = "wilson",     en = "Wilson",     zh = "威尔逊",   zht = "威爾森"},
    {name = "winona",     en = "Winona",     zh = "薇诺娜",   zht = "薇諾娜"},
    {name = "wolfgang",   en = "Wolfgang",   zh = "沃尔夫冈", zht = "沃爾夫岡"},
    {name = "woodie",     en = "Woodie",     zh = "伍迪",     zht = "伍迪"},
    {name = "wormwood",   en = "Wormwood",   zh = "沃姆伍德", zht = "沃姆伍德"},
    {name = "wortox",     en = "Wortox",     zh = "沃拓克斯", zht = "沃拓克斯"},
    {name = "wurt",       en = "Wurt",       zh = "沃特",     zht = "沃特"},
    {name = "wx78",       en = "WX-78",      zh = "WX-78",      zht = "WX-78"},
}

local function Translate(value)
    return ChooseTranslationTable({
        value.en,
        zh = value.zh,
        zht = value.zht,
    })
end

configuration_options =
{
    {
        name = "",
        label = Translate(strings.title),
        hover = "",
        options = {{description = "", data = false}},
        default = false,
    },
    {
        name = "disable_all_skilltrees",
        label = Translate(strings.disable_all),
        hover = Translate(strings.disable_all_hover),
        options =
        {
            {description = Translate(strings.yes), data = true},
            {description = Translate(strings.no), data = false},
        },
        default = true,
    },
    {
        name = "",
        label = Translate(strings.override_title),
        hover = "",
        options = {{description = "", data = false}},
        default = false,
    },
}

for i = 1, #characters do
    local character = characters[i]
    configuration_options[#configuration_options + 1] =
    {
        name = character.name,
        label = Translate(character),
        hover = Translate(strings.character_hover),
        options =
        {
            {description = Translate(strings.use_default), data = "default"},
            {description = Translate(strings.disabled), data = "disable"},
            {description = Translate(strings.enabled), data = "enable"},
        },
        default = "default",
    }
end
