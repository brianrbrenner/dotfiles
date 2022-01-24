-- Default options:
require('kanagawa').setup({
    undercurl = false,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "bold",
    keywordStyle = "NONE",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "bold",
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

