return{
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    enabled = true,
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            -- highlight = { enable = true }, -- will cause problem in highlighting
            -- enable indentation
            indent = { enable = true },
             -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "make",
                "c",
                "cpp",
                "python",
                "java",
            },
        })
    end,
}
