require("nvchad.autocmds")
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = "*.cpp",
    callback = function()
        local filepath = vim.fn.expand("%:p")
        if filepath:match("leetcode") then
            local lines = vim.api.nvim_buf_get_lines(0, 0, 5, false)
            local has_include = false
            for _, line in ipairs(lines) do
                if line:match("#include") then
                    has_include = true
                    break
                end
            end
            if not has_include then
                vim.api.nvim_buf_set_lines(0, 0, 0, false, {
                    "#include <bits/stdc++.h>",
                    "using namespace std;",
                    "",
                })
            end
        end
    end,
})
