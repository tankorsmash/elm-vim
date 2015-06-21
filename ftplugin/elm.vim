" plugin for Elm (http://elm-lang.org/)

if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

" Make the given file, or the current file if none is given.
function! ElmMake(...)
	if a:0 == 0
		echo system("elm-make ". expand("%"))
	else
		echo system("elm-make ". a:1)
	endif
endfunction

" Plug mappings
nnoremap <silent> <Plug>(elm-make) :<C-u>call ElmMake()<CR>
nnoremap <silent> <Plug>(elm-make-main) :<C-u>call ElmMake("Main.elm")<CR>

" Commands
command -buffer ElmMakeMain call ElmMake("Main.elm")
command -buffer -nargs=? -complete=file ElmMake call ElmMake(<f-args>)
