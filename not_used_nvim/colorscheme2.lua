return{
    { 
        "catppuccin/nvim", 
        enabled = true,
        name = "catppuccin", 
        priority = 5000,
        
        config = function()
            require("catppuccin").setup({
                custom_highlights = {
                    LineNr = { fg = "#FFD306" },  -- Sets the line number color to yellow
                    Normal = { bg = "#1E1E1E", fg = "#FFFFFF" }, -- Dark gray background for normal mode
                    Comment = { fg = "#6A9955" },  -- Green comments in italic
                    String = { fg = "#00CACA" },  -- Orange strings
                }, 
            })

            -- load the colorscheme here
            vim.cmd([[colorscheme catppuccin]])
        end,
    }
}
