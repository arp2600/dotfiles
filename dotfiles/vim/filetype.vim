if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	"Override filetypes or certain files
	autocmd! BufNewFile,BufRead *.frag setfiletype glsl
	autocmd! BufNewFile,BufRead *.vert setfiletype glsl
augroup END
