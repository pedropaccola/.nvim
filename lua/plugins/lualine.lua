local M = {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = "",
            section_separators = "",
            extensions = { "lazy" },
        },
    },
}
return M
