" Vim syntax file for Flowa
" Language: Flowa
" Maintainer: Flowa Team
" Latest Revision: December 2024

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword flowaKeyword if else while for return break continue try catch throw switch case default
syn keyword flowaDeclaration let const var function func class new this super extends static async await import export from as
syn keyword flowaConstant true false null undefined

" Comments
syn region flowaLineComment start="//" end="$" contains=@Spell
syn region flowaBlockComment start="/\*" end="\*/" contains=@Spell

" Strings
syn region flowaString start=+"+ skip=+\\\\\|\\"\+ end=+"+
syn region flowaString start=+'+ skip=+\\\\\|\\'\+ end=+'+
syn region flowaTemplate start=+`+ skip=+\\\\\|\\`\+ end=+`+ contains=flowaTemplateExpr
syn region flowaTemplateExpr start=+\${+ end=+}+ contained contains=ALL

" Numbers
syn match flowaNumber "\<\d\+\(\.\d\+\)\?\([eE][+-]\?\d\+\)\?\>"
syn match flowaHexNumber "\<0[xX][0-9a-fA-F]\+\>"
syn match flowaBinaryNumber "\<0[bB][01]\+\>"
syn match flowaOctalNumber "\<0[oO][0-7]\+\>"

" Functions
syn match flowaFunction "\<[a-zA-Z_$][a-zA-Z0-9_$]*\>\s*("he=e-1
syn keyword flowaBuiltin print println assert test len push pop keys values typeof parseInt parseFloat isNaN isFinite

" Modules
syn keyword flowaModule http sqlite json auth jwt mail log fs os env cron

" Operators
syn match flowaOperator "+\|-\|*\|/\|%\|++\|--"
syn match flowaOperator "==\|!=\|===\|!==\|<\|>\|<=\|>="
syn match flowaOperator "&&\|||\|!"
syn match flowaOperator "=\|+=\|-=\|*=\|/=\|%="
syn match flowaOperator "&\||\|\^\|~\|<<\|>>\|>>>"

" Highlighting
hi def link flowaKeyword Keyword
hi def link flowaDeclaration StorageClass
hi def link flowaConstant Constant
hi def link flowaLineComment Comment
hi def link flowaBlockComment Comment
hi def link flowaString String
hi def link flowaTemplate String
hi def link flowaTemplateExpr Special
hi def link flowaNumber Number
hi def link flowaHexNumber Number
hi def link flowaBinaryNumber Number
hi def link flowaOctalNumber Number
hi def link flowaFunction Function
hi def link flowaBuiltin Function
hi def link flowaModule Type
hi def link flowaOperator Operator

let b:current_syntax = "flowa"
