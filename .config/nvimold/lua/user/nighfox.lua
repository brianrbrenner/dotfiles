local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox", -- change the colorscheme to use nightfox
  transparent = "true",
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "bold" -- styles can be a comma separated list
  },
  inverse = {
    match_paren = false, -- inverse the highlighting of match_parens
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    --bg_alt = "#000000",
    bg = "#232426"
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
