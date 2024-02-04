local M = {
    "mrquantumcodes/bufferchad.nvim",
    event = "VeryLazy",
    config = function()
        require("bufferchad").setup({
            mapping = "q",
            mark_mapping = "<leader>bm",
            order = "LAST_USED_UP", -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
            style = "default", -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
            close_mapping = "q", -- only for the default style window. 
        })
    end,
}
return M
