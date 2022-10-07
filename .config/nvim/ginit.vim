if exists(":GuiTabline")
  GuiTabline 0
endif
if exists(":GuiPopupmenu")
  GuiPopupmenu 0
endif

if exists(":GuiLinespace")
  GuiLinespace 1
end

if exists(":GuiFont")
  GuiFont! JetBrainsMono NF:h11
endif

if exists(":GuiWindowOpacity")
  GuiWindowOpacity 1.0
endif

nnoremap <silent><F11> :call GuiWindowFullScreen(1)<CR>
nnoremap <silent><F10> :call GuiWindowFullScreen(0)<CR>
