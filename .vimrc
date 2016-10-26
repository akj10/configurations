" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text
set mouse=a

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" My own personalisations
set number
set autoindent
set nocompatible
set hlsearch
set ic
set ruler
set backspace=indent,eol,start

filetype plugin on
       source ~/.vim/plugin/matchit.vim 
"if version > 570 
"       source ~/.vim/syntax/viva.vim 
"endif
"syntax on
"
"if exists("did_load_filetypes")
"  finish
"endif
"augroup filetypedetect
"  au! BufRead,BufNewFile *.sv    setfiletype SV
"  au! BufRead,BufNewFile *.svi   setfiletype SV
"augroup END

"au BufRead,BufNewFile *.svx    setfiletype viva
"au BufRead,BufNewFile *.svix   setfiletype viva
"au BufRead,BufNewFile *.sv     setfiletype SV
"au BufRead,BufNewFile *.svi    setfiletype SV
  
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif
au BufNewFile,BufRead *.svx,*.svix set ft=viva
au BufNewFile,BufRead *.sm set ft=c

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  "   highlight Normal guibg=grey90
  "   highlight Cursor guibg=magenta guifg=NONE
  "   highlight lCursor guibg=Cyan guifg=NONE
  "   highlight NonText guibg=grey80
  "   highlight Constant gui=NONE guibg=grey95
  "   highlight Special gui=NONE guibg=grey95
  " highlight Normal guibg=Black guifg=green
  " highlight Cursor guibg=white guifg=NONE
  " highlight lCursor guibg=orange guifg=NONE
  " highlight NonText guibg=Black
  " highlight Constant gui=NONE guibg=grey95
  " highlight Special gui=NONE guibg=grey95
    if has("gui_running") 
       " any code here affects gvim but not console vim 
       colorscheme koehler
       set autochdir
    else 
       " any code here affects console vim but not gvim 
    endif 
   " Jump to search word as you type
   set incsearch

   " Settings for match-it plugin
   if exists('loaded_matchit')
   let b:match_ignorecase=0
   let b:match_words=
     \ '\<begin\>:\<end\>,' .
     \ '\<if\>:\<else\>,' .
     \ '\<module\>:\<endmodule\>,' .
     \ '\<class\>:\<endclass\>,' .
     \ '\<program\>:\<endprogram\>,' .
     \ '\<clocking\>:\<endclocking\>,' .
     \ '\<property\>:\<endproperty\>,' .
     \ '\<sequence\>:\<endsequence\>,' .
     \ '\<package\>:\<endpackage\>,' .
     \ '\<covergroup\>:\<endgroup\>,' .
     \ '\<primitive\>:\<endprimitive\>,' .
     \ '\<specify\>:\<endspecify\>,' .
     \ '\<generate\>:\<endgenerate\>,' .
     \ '\<interface\>:\<endinterface\>,' .
     \ '\<function\>:\<endfunction\>,' .
     \ '\<task\>:\<endtask\>,' .
     \ '\<\&PerlBeg\>:\<\&PerlEnd\>,' .
     \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
     \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
     \ '`ifdef\>:`else\>:`endif\>,'
   endif
endif
