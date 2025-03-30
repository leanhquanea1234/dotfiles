return {
    "folke/which-key.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    keys = {
        {
            "<leader>`",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function()
        local wk = require("which-key")
        -- local webIcon = require'nvim-web-devicons'
        wk.add({
            { "<leader>f", group = "Telescope", icon = "󰈞" },
            { "<leader>J", group = "Java", icon = "" },
            { "<leader>c", group = "Code manipulation" },
            { "<leader>d", group = "Debugger" },
            { "<leader>w", group = "Window split" },
            { "<leader>?", desc = "Cheatsheet", icon = "" },
            { "<leader>x", icon = "" },
            { "<leader>/", desc = "Comment", icon = "" },
            { "<leader>r", icon = "" },
        })
    end,
}
