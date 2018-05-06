augroup filetypedetect
	au BufRead, BufNewFile *.rb *.erb *.haml *.slim setfiletype ruby
	au BufRead, BufNewFile *.go setfiletype go
	au BufRead, BufNewFile *.sql setfiletype sql
augroup END
