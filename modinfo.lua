version = "1.0.3"
name = ChooseTranslationTable({"Disable skill trees", ["zh"] = "禁用技能树", ["zht"] = "禁用技能树"})
description = ChooseTranslationTable({"You can also disable individual skill tree", ["zh"] = "顾名思义", ["zht"] = "顾名思义"})
author = "ziwbi"
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
all_clients_require_mod = false
client_only_mod = false
dst_compatible = true
server_filter_tags = {}

local config_strings = 
{
    skilltree   = {en = "Disable specific skill tree",    zh = "禁用特定的技能树"},
    wathgrithr  = {en = "Disable Wigfird's skill tree",   zh = "禁用薇格弗德的技能树"},
    willow      = {en = "Disable Willow's skill tree",    zh = "禁用薇洛的技能树"},
    wilson      = {en = "Disable Wilson's skill tree",    zh = "禁用威尔逊的技能树"},
    wolfgang    = {en = "Disable Wolfgang's skill tree",  zh = "禁用沃尔夫冈的技能树"},
    woodie      = {en = "Disable Woodie's skill tree",    zh = "禁用伍迪的技能树"},
    wormwood    = {en = "Disable Wormwood's skill tree",  zh = "禁用沃姆伍德的技能树"},
    wurt        = {en = "Disable Wurt's skill tree",      zh = "禁用沃特的技能树"},
    winona      = {en = "Disable Winona's skill tree",    zh = "禁用薇诺娜的技能树"},
    wendy       = {en = "Disable Wendy's skill tree",     zh = "禁用温蒂的技能树"},
    walter      = {en = "Disable Walter's skill tree",    zh = "禁用沃尔特的技能树"},
    wortox      = {en = "Disable Wortox's skill tree",    zh = "禁用沃拓克斯的技能树"},
    yes         = {en = "Yes", zh = "是"},
    no          = {en = "No", zh = "否"}
}

local function GetTranslation(tbl)
    return ChooseTranslationTable({tbl.en, zh = tbl.zh, zht = tbl.zh})
end

local function make_title(title)
    return {
        label = GetTranslation(config_strings[title]),
        name = "",
        hover = "",
        options = {{description = "", data = 0}},
        default = 0
    }
end

local function make_option(character)
    return {
        name = character,
        label =  GetTranslation(config_strings[character]),
        options = 
        {
            {description = GetTranslation(config_strings.yes), data = true },
            {description = GetTranslation(config_strings.no), data = false},
        },
        default = true    
    }
end


configuration_options = 
{
    make_title("skilltree"),
    make_option("wathgrithr"),
    make_option("willow"),
    make_option("wilson"),
    make_option("wolfgang"),
    make_option("woodie"),
    make_option("wormwood"),
    make_option("wurt"),
    make_option("winona"),
    make_option("wendy"),
    make_option("walter"),
    make_option("wortox"),
}
