return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",       -- Options: "storm", "night", "moon", "day"
            transparent = false,   -- true for terminal background
        })
    vim.cmd("colorscheme tokyonight")
    end,
}

