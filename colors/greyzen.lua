-- You probably always want to set this in your vim file
vim.opt.background = 'dark'
vim.g.colors_name = 'greyzen'

-- By setting our module to nil, we clear lua's cache,
-- which means the require ahead will *always* occur.
--
-- This isn't strictly required but it can be a useful trick if you are
-- incrementally editing your config a lot and want to be sure your themes
-- changes are being picked up without restarting neovim.
--
-- Note if you're working in on your theme and have :Lushify'd the buffer,
-- your changes will be applied with our without the following line.
--
-- The performance impact of this call can be measured in the hundreds of
-- *nanoseconds* and such could be considered "production safe".
package.loaded['lush_theme.greyzen'] = nil

-- include our theme file and pass it to lush to apply
require('lush')(require('lush_theme.greyzen'))
require('lualine').setup { options = { theme = 'greyzen' } }

-- Toggle line number color between normal and bg (for making them invisible)
function LineNumberColors()
    local theme_colors = require('lush_theme.greyzen')
    local current_ln_fg = vim.api.nvim_get_hl_by_name('LineNr', true).fg
    if current_ln_fg == theme_colors.LineNr.fg then
        vim.api.nvim_set_hl(0, 'LineNr', { fg=theme_colors.Normal.bg })
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg=theme_colors.Normal.bg })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg=theme_colors.Normal.bg })
    else
        vim.api.nvim_set_hl(0, 'LineNr', { fg=theme_colors.LineNr.fg })
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg=theme_colors.LineNrAbove.fg })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg=theme_colors.LineNrBelow.fg })
    end
end
