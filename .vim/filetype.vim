augroup filetypedetect
	au BufRead, BufNewFile *.rb *.erb *.haml *.slim setfiletype ruby
	au BufRead, BufNewFile *.go setfiletype go
augroup END
