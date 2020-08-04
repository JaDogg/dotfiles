" --------------------------------------------
" --------------------------------------------
" Bhathiya's .vimrc/_vimrc
" --------------------------------------------
" --------------------------------------------

" We don't need old stuff 
set nocompatible
" Enable mouse
set mouse=a
" Enable line numbers
set number
" Set tabstop to size 4
set tabstop=4
" Do autoindent
set autoindent
" ensure that I can read this - සිංහ
set encoding=utf-8
scriptencoding utf-8
set fileformats=unix,mac,dos
set termencoding=utf-8
" Use git for backing things up
set nobackup noswapfile
" Ensure that we are showing tabs and spaces
set listchars=tab:\|\ ,trail:.,extends:\#,nbsp:.
" press \r to turn on relative numbers
:nmap <leader>r :RN<cr>
" press \t in normal mode to toggle list
:nmap <leader>t :set invlist<cr>
" press \n to toggle nerd tree
:nmap <leader>n :NERDTreeToggle<CR>
" press \s to toggle ctrlp
:nmap <leader>s :CtrlPMixed<CR>
" Enable NEO Compplete at startup
let g:neocomplete#enable_at_startup=1
" ----------
" --- GUI Specific ----
if has("gui_running")
	colorscheme desert
	if has("win32")
		set renderoptions=type:directx
	endif
	set guifont=Fira_Code:h12
endif
" --- Prefer RipGrep --
" use :grep WhatEver
if executable('rg')
	let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	let g:ctrlp_use_caching = 0
	set grepprg=rg\ --vimgrep
	set grepformat^=%f:%l:%c:%m
endif
" -- Open Quick Fix Window for :grep --
augroup autoquickfix
	autocmd!
	autocmd QuickFixCmdPost [^l]* cwindow
	autocmd QuickFixCmdPost    l* lwindow
augroup END
" --- Running Custom Shell Commands ---
" Taken From - https://vim.fandom.com/wiki/Display_output_of_shell_commands_in_new_window
" Usage :shell ls -ltrah
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
ca shell Shell


syntax enable " colours
set backspace=indent,eol,start  " more powerful backspacing
set spell

" Search down in to subfolders
" set path+=**
" Display all matching files for tab complete
set wildmenu
filetype plugin on
" Java auto complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" ----------------- Auto complete and Nav-------
"  windows: https://github.com/universal-ctags/ctags-win32/releases
command! MakeTags !ctags -R .

" Toggle highlight search
let hlstate=0
nmap <leader>h :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>:echo "toggled visibility for hlsearch"<cr>

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Enable Airline fonts
let g:airline_powerline_fonts = 1

" ------------------------------------------------------------------------
"                            Cheat Sheet
" ------------------------------------------------------------------------

" use Control+] to jump to tag
" g Control+] to jump to fuzzy tag
" Control+t to go back in tag stack
" Control+n - basic auto complete
" Control+x Control+f - auto complete file names
" Control+x Control+n - just this file
" Control+x s - spell complete
"
" ----------------- Guide  --------------------- 
" ---
" :find <name>
"  - find a file
" :ls
"  - list all buffers
" :b
"  - go to buffer, we can use tab completion here as well
"
