local lush = require('lush')
local hsl = lush.hsl
local greyzen = require('lush_theme.greyzen')

local colors = {
    mid_red = hsl(0, 70, 70),
    warm_red = hsl(15, 70, 70),
    orange = hsl(30, 70, 70),
    warm_yellow = hsl(45, 70, 70),
    mid_yellow = hsl(60, 70, 70),
    cool_yellow = hsl(75, 70, 70),
    yellow_green = hsl(90, 70, 70),
    warm_green = hsl(105, 70, 70),
    mid_green = hsl(120, 70, 70),
    cool_green = hsl(135, 70, 70),
    green_cyan = hsl(170, 70, 70),
    warm_cyan = hsl(165, 70, 70),
    mid_cyan = hsl(180, 70, 70),
    cool_cyan = hsl(195, 70, 70),
    blue_cyan = hsl(210, 70, 70),
    cool_blue = hsl(225, 70, 70),
    mid_blue = hsl(240, 70, 70),
    warm_blue = hsl(255, 70, 70),
    violet = hsl(270, 70, 70),
    cool_magenta = hsl(285, 70, 70),
    mid_magenta = hsl(300, 70, 70),
    warm_magenta = hsl(315, 70, 70),
    red_magenta = hsl(330, 70, 70),
    cool_red = hsl(345, 70, 70),
}

local chosen_colors = {
    green        = tostring(colors.cool_green),
    red        = tostring(colors.cool_red),
    yellow       = tostring(colors.mid_yellow),
    dark_blue  = tostring(greyzen.Normal.bg),
    bg = tostring(greyzen.Normal.bg),
    fg = tostring(greyzen.Normal.fg),
    gray         = '#a89984',
    darkgray     = '#3c3836',
}
return {
    normal = {
        a = { bg = chosen_colors.fg, fg = chosen_colors.bg },
        b = { bg = chosen_colors.dark_blue, fg = chosen_colors.fg },
        c = { bg = chosen_colors.bg, fg = chosen_colors.fg }
    },
    insert = {
        a = { bg = chosen_colors.green, fg = chosen_colors.bg },
        b = { bg = chosen_colors.dark_blue, fg = chosen_colors.fg },
        c = { bg = chosen_colors.bg, fg = chosen_colors.fg }
    },
    visual = {
        a = { bg = chosen_colors.yellow, fg = chosen_colors.bg },
        b = { bg = chosen_colors.dark_blue, fg = chosen_colors.fg },
        c = { bg = chosen_colors.bg, fg = chosen_colors.fg }
    },
    replace = {
        a = { bg = chosen_colors.red, fg = chosen_colors.bg },
        b = { bg = chosen_colors.dark_blue, fg = chosen_colors.fg },
        c = { bg = chosen_colors.bg, fg = chosen_colors.fg }
    },
    command = {
        a = { bg = chosen_colors.green, fg = chosen_colors.bg },
        b = { bg = chosen_colors.dark_blue, fg = chosen_colors.fg },
        c = { bg = chosen_colors.bg, fg = chosen_colors.fg }
    },
    inactive = {
        a = { bg = chosen_colors.darkgray, fg = chosen_colors.gray },
        b = { bg = chosen_colors.dark_blue, fg = chosen_colors.fg },
        c = { bg = chosen_colors.bg, fg = chosen_colors.fg }
    }
}
