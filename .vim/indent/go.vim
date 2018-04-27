" gofmtの代わりにgoimportsを動かす
let g:go_fmt_command = "goimports"

"" highlight
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1

" err をハイライト
autocmd FileType go :highlight goErr ctermfg=51
autocmd FileType go :match goErr /\<err\>/

" golangでのtabなどの設定
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
