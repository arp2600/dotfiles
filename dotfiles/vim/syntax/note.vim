" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Kevin Lauder
" Latest Revision: 26 April 2008

if exists("b:current_syntax")
	finish
endif

syn region mycomment start='%%%' end='%%%'
syn region myreferences start='\[' end='\]'

hi def link mycomment Comment
hi def link myreferences Constant
