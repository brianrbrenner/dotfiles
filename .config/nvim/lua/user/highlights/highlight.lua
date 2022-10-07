local C = require "user.highlights.palette"

-- Miscellaneous
local highlights = {
  TermCursor = { fg = C.cursor_fg, bg = C.cursor_bg },
  Substitute = { fg = C.fg, bg = C.terminal_black },
  Search = { fg = C.blue, bg = C.terminal_black },
  IncSearch = { fg = C.fg, bg = C.terminal_black },
  FocusedSymbol = { fg = C.blue, bg = C.none },
  WinSeparator = { fg = C.dark5 },
  FloatBorder = { fg = C.dark3, bg = C.none },
  NormalFloat = { fg = C.fg, bg = C.bg_float },
  Keyword = { fg = C.cursor_bg },
  MsgArea = { bg = C.none },
  Normal = { fg = C.fg, bg = C.bg_float },
  NormalNC = { fg = C.fg, bg = C.bg_float },
  SignColumn = { fg = C.fg, bg = C.bg_float },
  MatchParen = { bold = false, fg = C.yellow },
  Special = { fg = C.dark5 },

  -- Treesitter
  TSString = { fg = C.green },
  TSVariable = { fg = C.fg },
  TSURI = { fg = C.yellow, underline = true },
  TSUnderline = { fg = C.fg, underline = true },
  TSNone = { fg = C.none },
  TSAttribute = { fg = C.blue },
  TSBoolean = { fg = C.const_orange },
  TSCharacter = { fg = C.green },
  TSComment = { fg = C.comment },
  TSConditional = { fg = C.purple },
  TSConstant = { fg = C.const_orange },
  TSConstBuiltin = { fg = C.const_orange },
  TSConstMacro = { fg = C.yellow },
  TSConstructor = { fg = C.dark5 },
  TSException = { fg = C.yellow },
  TSField = { fg = C.green1 },
  TSFloat = { fg = C.fg },
  TSFunction = { fg = C.blue },
  TSFuncBuiltin = { fg = C.blue },
  TSFuncMacro = { fg = C.blue },
  TSInclude = { fg = C.blue },
  TSKeyword = { fg = C.purple },
  TSKeywordFunction = { fg = C.purple },
  TSKeywordOperator = { fg = C.none },
  TSKeywordReturn = { fg = C.purple },
  TSLabel = { fg = C.none },
  TSMethod = { fg = C.purple },
  TSNamespace = { fg = C.yellow },
  TSNumber = { fg = C.yellow },
  TSParameter = { fg = C.fg },
  TSParameterReference = { fg = C.fg },
  TSProperty = { fg = C.yellow },
  TSPunctDelimiter = { fg = C.none },
  TSPunctBracket = { fg = C.dark5 },
  -- TSPunctSpecial = { fg = C.none },
  TSRepeat = { fg = C.purple },
  TSStringRegex = { fg = C.green },
  TSStringEscape = { fg = C.green },
  -- TSStringSpecial = { fg = C.yellow },
  TSSymbol = { fg = C.fg_dark },
  TSText = { fg = C.fg },
  TSStrike = { fg = C.fg },
  TSTitle = { fg = C.fg },
  TSLiteral = { fg = C.green },
  TSMath = { fg = C.yellow },
  TSTextReference = { fg = C.fg },
  TSEnvirontment = { fg = C.fg_gutter },
  TSEnvironmentName = { fg = C.fg },
  TSNote = { fg = C.bg_dark, bg = C.fg_dark },
  TSWarning = { fg = C.fg, bg = C.orange },
  TSDanger = { fg = C.red },
  TSType = { fg = C.yellow },
  TSTypeBuiltin = { fg = C.yellow },
  TSVariableBuiltin = { fg = C.blue },

  -- Indent Blankline
  IndentBlanklineContextChar = { fg = C.fg_dark },

  -- NvimTree
  NvimTreeRootFolder = { fg = "#7aa2f7", bold = false },
  NvimTreeGitDeleted = { fg = C.red },
  NvimTreeSpecialFile = { underline = true },
  NvimTreeIndentMarker = { fg = C.terminal_black },
  NvimTreeSymlink = { fg = C.yellow },
  NvimTreeFolderIcon = { fg = C.fg_dark },
  NvimTreeFolderName = { fg = C.fg },
  NvimTreeOpenedFolderName = { fg = C.fg_dark },
  NvimTreeEmptyFolderName = { fg = C.fg_dark },

  -- WhichKey
  WhichKeyBorder = { fg = C.dark3, bg = C.none },
  WhichKeyFloat = { link = "NormalFloat" },

  -- BufferLine
  BufferLineIndicatorSelected = { fg = C.blue },
  BufferLineFill = { bg = C.bg_float },
  BufferLineBufferVisible = { fg = C.fg },
  BufferLineBufferSelected = { fg = C.fg },
  BufferLineCloseButton = { fg = C.fg },
  BufferLineCloseButtonVisible = { fg = C.fg },

  -- Telescope
  TelescopeSelection = { fg = C.blue, bg = C.none },
  TelescopeNormal = { fg = C.dark5, bg = C.none },
  TelescopeMultiSelection = { bg = C.none },
  TelescopePreviewLine = { bg = C.none },
  TelescopePromptBorder = { fg = C.terminal_black, bg = C.none },
  TelescopePromptPrefix = { fg = C.blue, bg = C.none },
  TelescopePreviewBorder = { fg = C.terminal_black, bg = C.none },
  TelescopeResultsBorder = { fg = C.terminal_black, bg = C.none },
  TelescopeTitle = { fg = C.dark5 },

  -- Alpha
  AlphaButton = { link = "Keyword" },
  AlphaHeader = { fg = C.dark3 },
  AlphaFooter = { fg = C.fg },

  -- Git
  GitSignsChange = { fg = C.blue },
  GitSignsDelete = { fg = C.red },
  GitSignsAdd = { fg = C.green },

  -- LSP
  LspSagaSignatureHelpBorder = { fg = C.dark5 },
  LspSagaDefPreviewBorder = { fg = C.dark5 },
  LspSagaRenameBorder = { fg = C.dark5 },

  DiagnosticError = { fg = C.red },
  DiagnosticInfo = { fg = C.blue },
  DiagnosticWarn = { fg = C.yellow },
  DiagnosticHint = { fg = C.yellow },

  DiagnosticVirtualTextError = { fg = C.red, bg = C.virtual_err },
  DiagnosticVirtualTextInfo = { fg = C.blue, bg = C.virtual_info },
  DiagnosticVirtualTextWarn = { fg = C.yellow, bg = C.virtual_warn },
  DiagnosticVirtualTextHint = { fg = C.yellow, bg = C.virtual_hint },

  DiagnosticFloatingError = { link = "DiagnosticError" },
  DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
  DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
  DiagnosticFloatingHint = { link = "DiagnosticHint" },

  DiagnosticSignError = { link = "DiagnosticError" },
  DiagnosticSignInfo = { link = "DiagnosticInfo" },
  DiagnosticSignWarn = { link = "DiagnosticWarn" },
  DiagnosticSignHint = { link = "DiagnosticHint" },

  CmpDocumentationBorder = { fg = C.terminal_black },
  CmpCompletionBorder = { fg = C.terminal_black },
  CmpCursorLine = { link = "Visual" },

  CmpItemKindFolder = { fg = C.blue },
  CmpItemKindFile = { fg = C.green },

  CmpItemKindEnumMember = { fg = C.purple },
  CmpItemKindFunction = { fg = C.purple },
  CmpItemKindMethod = { fg = C.purple },
  CmpItemKindStruct = { fg = C.purple },
  CmpItemKindEnum = { fg = C.purple },

  CmpItemKindConstructor = { fg = C.yellow },
  CmpItemKindInterface = { fg = C.yellow },
  CmpItemKindReference = { fg = C.yellow },
  CmpItemKindConstant = { fg = C.yellow },
  CmpItemKindProperty = { fg = C.yellow },
  CmpItemKindModule = { fg = C.yellow },
  CmpItemKindClass = { fg = C.yellow },
  CmpItemKindField = { fg = C.yellow },
  CmpItemKindEvent = { fg = C.yellow },

  CmpItemKindTypeParameter = { fg = C.fg_dark },
  CmpItemKindVariable = { fg = C.fg_dark },
  CmpItemKindOperator = { fg = C.blue },
  CmpItemKindSnippet = { fg = C.blue },
  CmpItemKindKeyword = { fg = C.blue },
  CmpItemKindText = { fg = C.fg_dark },
  CmpItemKindUnit = { fg = C.fg_dark },
  CmpItemKindValue = { fg = C.blue },
}

set_highlights(highlights)
