return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        
        lualine.setup({
            options = {
                icons_enabled = true,
                --theme = "horizon",
                theme = "powerline_dark",
                --theme = "tokyonight",
                section_separators = { left = "󰚉", right = "󰚉" },
                component_separators = "|", -- { left = "<", right = ">" },
                globalstatus = true,   -- one statusline across all windows
            },

            sections = {
                lualine_a = {'mode'},
                lualine_b = { { 'branch', icon = ""}, { 'diff' }, { 'diagnostics' } },
                lualine_c = {'filename'},
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
                -- lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
        })
    end,
}
