local lush = require('lush')
local hsl = lush.hsl
local greyzen = require('lush_theme.greyzen')
local base_colors = require('lush_theme.colors')

local colors = {
    green        = tostring(base_colors.green),
    red        = tostring(base_colors.red),
    yellow       = tostring(base_colors.yellow),
    medium_blue  = tostring(greyzen.LineNr.fg),
    dark_blue  = tostring(greyzen.LineNr.fg.darken(12)),
    bg = tostring(greyzen.Normal.bg),
    fg = tostring(greyzen.Normal.fg),
    gray         = '#a89984',
    darkgray     = '#3c3836',
}
return {
    normal = {
        a = { bg = colors.medium_blue, fg = colors.bg },
        b = { bg = colors.dark_blue, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.medium_blue }
    },
    insert = {
        a = { bg = colors.green, fg = colors.bg },
        b = { bg = colors.dark_blue, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.medium_blue }
    },
    visual = {
        a = { bg = colors.yellow, fg = colors.bg },
        b = { bg = colors.dark_blue, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.medium_blue }
    },
    replace = {
        a = { bg = colors.red, fg = colors.bg },
        b = { bg = colors.dark_blue, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.medium_blue }
    },
    command = {
        a = { bg = colors.green, fg = colors.bg },
        b = { bg = colors.dark_blue, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.medium_blue }
    },
    inactive = {
        a = { bg = colors.darkgray, fg = colors.gray },
        b = { bg = colors.dark_blue, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.medium_blue }
    }
}
