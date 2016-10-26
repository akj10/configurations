" Vim syntax file
" Language:	Viva
" Maintainer:	Jesse Guss <jguss@nvidia.com>
" Last Update:	Sept 25 2009

" Somebody started this file and put it on a wiki.  I found it and beefed
" it up a lot by adding the Perl syntax, new Verilog and Viva keywords, 
" ::plugin recognition, and some other minor improvements.  I'd like to 
" thank the original author, but I can't find that old wiki any more.  
"
" I recommend using this with the torte.vim color file that I modified
" to add more color possibilities.
"
" If you'd like to improve this file in any way, go for it.  
"   -- Jesse

" Remove any old syntax stuff hanging around
syn clear
set iskeyword=@,48-57,_,192-255,+,-,?


" A bunch of useful Verilog keywords
syn keyword verilogStatement   disable assign deassign force release
syn keyword verilogStatement   parameter function endfunction
syn keyword verilogStatement   always initial module endmodule or
syn keyword verilogStatement   task endtask
syn keyword verilogStatement   input output inout reg wire
syn keyword verilogStatement   posedge negedge wait
syn keyword verilogStatement   buf pullup pull0 pull1 pulldown
syn keyword verilogStatement   tri0 tri1 tri trireg
syn keyword verilogStatement   wand wor triand trior
syn keyword verilogStatement   defparam
syn keyword verilogStatement   integer real
syn keyword verilogStatement   time

syn keyword verilogLabel       begin end fork join
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogTodo contained TODO
syn keyword verilogTodo contained HACK
syn keyword verilogTodo contained FIXME

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo
syn match   verilogComment "//.*" oneline contains=verilogTodo

syn match   verilogGlobal "`[a-zA-Z0-9_]\+"
syn match   verilogGlobal "#[a-zA-Z0-9_]\+\>"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"
syn match   verilogGlobal "${[a-zA-Z0-9_]\+}"
syn match   verilogGlobal "@[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+  end=+"+ contains=verilogGlobal

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

" Viva preprocessor directives
syn match   vivaDirective "&Always"
syn match   vivaDirective "&BlastDn"
syn match   vivaDirective "&BlastUp"
syn match   vivaDirective "&BundleDn"
syn match   vivaDirective "&BundleUp"
syn match   vivaDirective "&Catenate"
syn match   vivaDirective "&Clock"
syn match   vivaDirective "&Connect"
syn match   vivaDirective "&Dangles"
syn match   vivaDirective "&Depend"
syn match   vivaDirective "&End"
syn match   vivaDirective "&EndModule"
syn match   vivaDirective "&Force"
syn match   vivaDirective "&Forget"
syn match   vivaDirective "&FsmBeg"
syn match   vivaDirective "&FsmDefBeg"
syn match   vivaDirective "&FsmDefEnd"
syn match   vivaDirective "&FsmEnd"
syn match   vivaDirective "&Instance"
syn match   vivaDirective "&Leda"
syn match   vivaDirective "&Module"
syn match   vivaDirective "&Ports"
syn match   vivaDirective "&Regs"
syn match   vivaDirective "&Require"
syn match   vivaDirective "&Reset"
syn match   vivaDirective "&RstVal"
syn match   vivaDirective "&Shell"
syn match   vivaDirective "&SynOff"
syn match   vivaDirective "&Vector"
syn match   vivaDirective "&Verilint"
syn match   vivaDirective "&Viva"
syn match   vivaDirective "&Wires"

" Viva plugin directives
syn match   vivaPlugin "::[a-zA-Z0-9_]\+\>"

" Viva perl keywords
syn region  perlRegion start="&PerlBeg;" end="&PerlEnd;" contains=perlKeyword,perlComment,perlGlobal,verilogStatement,verilogLabel,verilogConditional,verilogRepeat,verilogGlobal,verilogConstant,verilogNumber,perlString,verilogDirective,vivaDirective
syn match   perlRegion "&Perl .*;" oneline contains=perlKeyword,perlGlobal,verilogGlobal

syn region  perlString  contained start=+"+ skip=+\\"+ end=+"+ contains=verilogGlobal,perlGlobal

syn keyword perlKeyword contained my
syn keyword perlKeyword contained if elsif
syn keyword perlKeyword contained pop push shift unshift splice split reverse
syn keyword perlKeyword contained for foreach do while until unless last
syn keyword perlKeyword contained print printf vprint vprintl vprinti vprintf
syn keyword perlKeyword contained keys values
syn keyword perlKeyword contained abs sqrt
syn keyword perlKeyword contained open close
syn keyword perlKeyword contained chomp
syn keyword perlKeyword contained grep
syn keyword perlKeyword contained eval

syn match   perlGlobal  contained "%[{]\?[a-zA-Z0-9_]\+\>[}]\?"

syn match   perlComment contained "#.*" oneline contains=verilogTodo

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

if !exists("did_verilog_syntax_inits")
  let did_verilog_syntax_inits = 1
 " The default methods for highlighting.  Can be overridden later

  hi link verilogCharacter       Character
  hi link verilogConditional     Conditional
  hi link verilogRepeat          Repeat
  hi link verilogString          String
  hi link verilogTodo            Todo
  hi link verilogComment         Comment
  hi link verilogConstant        Constant
  hi link verilogLabel           Label
  hi link verilogNumber          Number
  hi link verilogOperator        Special
  hi link verilogStatement       Statement
  hi link verilogGlobal          Function
  hi link verilogDirective       SpecialComment

  hi link vivaDirective          PreProc
  hi link vivaPlugin             Type

  hi link perlKeyword            Statement
  hi link perlGlobal             Function
  hi link perlComment            Comment
  hi link perlRegion             Special2
  hi link perlString             String
endif

let b:current_syntax = "verilog"

" vim: ts=8
