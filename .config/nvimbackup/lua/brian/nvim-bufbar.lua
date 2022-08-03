require('bufbar').setup ({
  theme = 'kanagawabones',         -- the theme in 'lua/bufbar/themes' to use
  show_tabs = false,         -- show tabs
  show_bufname = 'all',      -- show full buffer name ('current', 'visible' or 'all')
  show_flags = true,         -- show buffer flags
  show_alternate = false,    -- show alternate buffer
  modifier = ':t',           -- the name modifier
  term_modifier = ':t',      -- the name modifier for terminal buffers
  separator = '',           -- the buffer separator
})
