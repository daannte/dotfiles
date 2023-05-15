vim.cmd([[
  augroup user_colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight CursorLine ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE guifg=LightGray
    autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight CursorLineNr ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight Visual ctermbg=Gray guibg=Gray ctermfg=White guifg=White
  augroup END

  colorscheme ayu-dark
]])
