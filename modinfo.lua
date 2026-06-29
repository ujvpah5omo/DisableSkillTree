version = "1.1.2"
name = ChooseTranslationTable({
    "Disable skill trees",
    ["zh"] = "Disable skill trees",
    ["zht"] = "Disable skill trees",
})
description = ChooseTranslationTable({
    "Choose which character skill trees to disable",
    ["zh"] = "Choose which character skill trees to disable",
    ["zht"] = "Choose which character skill trees to disable",
})
author = "ziwbi"
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
}

for _, character in ipairs(characters) do
    configuration_options[#configuration_options + 1] =
    {
        name = character.name,
        label = Translate(character),
        hover = "",
        options =
        {
            {description = Translate(strings.yes), data = true},
            {description = Translate(strings.no), data = false},
        },
        default = true,
    }
end
