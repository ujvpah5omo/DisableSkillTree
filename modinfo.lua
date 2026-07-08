version = "1.2.0"
name = ChooseTranslationTable({
    "Disable skill trees",
    ["zh"] = "Disable skill trees",
    ["zht"] = "Disable skill trees",
})
description = ChooseTranslationTable({
    "Disable all skill trees by default, with per-character overrides",
    ["zh"] = "Disable all skill trees by default, with per-character overrides",
    ["zht"] = "Disable all skill trees by default, with per-character overrides",
})
author = "Codex"
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
all_clients_require_mod = true
client_only_mod = false
dst_compatible = true
server_filter_tags = {}

local strings =
{
    title = {
        en = "Disable character skill trees",
        zh = "Disable character skill trees",
        zht = "Disable character skill trees",
    },
    disable_all = {
        en = "Disable all skill trees by default",
        zh = "Disable all skill trees by default",
        zht = "Disable all skill trees by default",
    },
    override_title = {
        en = "Per-character overrides",
        zh = "Per-character overrides",
        zht = "Per-character overrides",
    },
    use_default = {
        en = "Use default",
        zh = "Use default",
        zht = "Use default",
    },
    disabled = {
        en = "Disabled",
        zh = "Disabled",
        zht = "Disabled",
    },
    enabled = {
        en = "Enabled",
        zh = "Enabled",
        zht = "Enabled",
    },
    yes = {
        en = "Yes",
        zh = "Yes",
        zht = "Yes",
    },
    no = {
        en = "No",
        zh = "No",
        zht = "No",
    },
}

local characters =
{
    {name = "walter",     en = "Walter",     zh = "Walter",     zht = "Walter"},
    {name = "wathgrithr", en = "Wigfrid",    zh = "Wigfrid",    zht = "Wigfrid"},
    {name = "wendy",      en = "Wendy",      zh = "Wendy",      zht = "Wendy"},
    {name = "willow",     en = "Willow",     zh = "Willow",     zht = "Willow"},
    {name = "wilson",     en = "Wilson",     zh = "Wilson",     zht = "Wilson"},
    {name = "winona",     en = "Winona",     zh = "Winona",     zht = "Winona"},
    {name = "wolfgang",   en = "Wolfgang",   zh = "Wolfgang",   zht = "Wolfgang"},
    {name = "woodie",     en = "Woodie",     zh = "Woodie",     zht = "Woodie"},
    {name = "wormwood",   en = "Wormwood",   zh = "Wormwood",   zht = "Wormwood"},
    {name = "wortox",     en = "Wortox",     zh = "Wortox",     zht = "Wortox"},
    {name = "wurt",       en = "Wurt",       zh = "Wurt",       zht = "Wurt"},
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
        hover = "",
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
        hover = "",
        options =
        {
            {description = Translate(strings.use_default), data = "default"},
            {description = Translate(strings.disabled), data = "disable"},
            {description = Translate(strings.enabled), data = "enable"},
        },
        default = "default",
    }
end
