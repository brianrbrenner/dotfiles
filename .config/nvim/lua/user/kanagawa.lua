-- Default options:
require('kanagawa').setup({
    undercurl = false,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "bold",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords 
    transparent = true,        -- do not set background color
    colors = {
        bg = "#232426"
    },
    overrides = {},
})

vim.cmd[[
hi! Normal guibg=NONE ctermbg=NONE
colorscheme kanagawa
]]

