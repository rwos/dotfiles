let g:colors_name = "rwos-subtle"

""" user interface

hi VertSplit ctermbg=black ctermfg=black
hi LineNr ctermfg=darkgrey

hi Cursor ctermfg=white ctermbg=black cterm=NONE
hi CursorLineNr ctermfg=yellow ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=bold
hi Visual ctermfg=black ctermbg=lightgrey cterm=NONE

hi ColorColumn ctermbg=darkgrey

hi StatusLine ctermbg=black ctermfg=grey cterm=underline,bold
hi StatusLineNC ctermbg=black ctermfg=darkgrey cterm=underline

hi PmenuSel ctermfg=black ctermbg=yellow cterm=underline
hi Pmenu    ctermfg=black ctermbg=white cterm=none

hi Error      ctermfg=red ctermbg=NONE cterm=undercurl
hi SpellBad   ctermfg=red ctermbg=NONE cterm=undercurl
hi ErrorMsg   ctermfg=black ctermbg=red cterm=NONE
hi WarningMsg ctermfg=black ctermbg=red cterm=NONE

""" general text

hi Normal ctermfg=white ctermbg=NONE cterm=NONE
hi NonText ctermfg=black ctermbg=black cterm=NONE

hi MatchParen ctermfg=yellow ctermbg=black cterm=bold,underline
hi Todo ctermbg=black ctermbg=yellow cterm=NONE

""" programming stuff

hi Comment ctermfg=lightgrey ctermbg=NONE cterm=NONE

hi Constant ctermfg=NONE ctermbg=NONE cterm=underline
hi String ctermfg=NONE ctermbg=NONE cterm=italic
hi Character ctermfg=NONE ctermbg=NONE cterm=NONE
hi Number ctermfg=NONE ctermbg=NONE cterm=NONE
hi Float ctermfg=NONE ctermbg=NONE cterm=NONE
hi Boolean ctermfg=NONE ctermbg=NONE cterm=NONE

hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
hi Statement ctermfg=NONE ctermbg=NONE cterm=bold
hi Operator ctermfg=NONE ctermbg=NONE cterm=NONE
hi Function ctermfg=NONE ctermbg=NONE cterm=NONE
hi StorageClass ctermfg=lightgrey ctermbg=NONE cterm=NONE
hi Exception ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreProc ctermfg=lightgrey ctermbg=NONE cterm=NONE
hi Keyword ctermfg=NONE ctermbg=NONE cterm=underline
hi Type ctermfg=lightgrey ctermbg=NONE cterm=NONE
hi Special ctermfg=lightgrey ctermbg=NONE cterm=NONE
hi SpecialChar ctermfg=lightgrey ctermbg=NONE cterm=NONE

""" diff

hi DiffAdd cterm=NONE ctermbg=lightgreen ctermfg=black
hi DiffChange cterm=NONE ctermbg=lightblue ctermfg=black
hi DiffText cterm=NONE ctermbg=lightgray ctermfg=black
hi DiffDelete cterm=NONE ctermbg=lightred ctermfg=black

