" Vim plugin for writing prose
" Last Change:	2011-08-02
" Maintainer:	Honza Pokorny <me@honza.ca>
" License:	BSD license

if exists("w:loaded_writer")
    finish
endif

let w:loaded_writer = 1
let w:writer_on = 0

let w:save_cpo = &cpo
set cpo&vim

function! w:Toggle()
	if (w:writer_on == 0)
		" Save current settings
		if has('gui')
		    let w:savedfont = &guifont
		    let w:spacing = &linespace
			let w:guioptions = &guioptions
		endif
		if has('gui_macvim')
			let w:fullscreen = &fullscreen
			let w:fuoptions = &fuoptions
		endif
		let w:numbers = &number
		let w:relative = &relativenumber
		let w:cursor = &cursorline
		let w:width = &textwidth
		let w:status = &laststatus
		let w:formatoptions = &formatoptions
		let w:linebreak = &linebreak
		let w:display = &display
		let w:backspace = &backspace
		let w:joinspace = &joinspaces
		let w:columns = &columns
		let w:lines = &lines
		" Apply writer settings

		if has('gui_macvim')
			" There is a strange interaction between this and
			" setting linespace below. The result is a window
			" that is about a line short at the top of the
			" screen. Setting lines=9999 manually fixes
			" the problem, but that setting has no effect
			" from within the plugin.
			set fuoptions+=maxvert
			set fuoptions-=maxhorz
			set fullscreen
		endif

	    if has('gui')
			if exists('g:writer_guifont')
				" set your preferred font by setting
				" g:writer_guifont in your gvimrc.
			    exe ":set guifont=" . g:writer_guifont
		    else
			    set guifont=Monaco:h15
			endif
		    set linespace=5
			set guioptions-=T "disable toolbar
			set guioptions-=r "disable right scrollbar
			set guioptions-=L "disable left scrollbar
		endif


		set nonumber
		set norelativenumber
		set nocursorline
		set textwidth=0
		set laststatus=0
		set formatoptions=1
		set linebreak
		set display=lastline
		set backspace=indent,eol,start
		set columns=80
		set lines=9999
	   	let w:writer_on = 1
	else
		" Apply saved settings
		if has('gui')
		    exe ":set guifont=" . escape(w:savedfont, ' ')
		    exe ":set linespace=" . w:spacing
			exe ":set guioptions=" . w:guioptions
		endif
		if has('gui_macvim') 
			if (w:fullscreen == 0)
			    set nofullscreen
			endif
			exe ":set fuoptions=" . w:fuoptions
		endif
		exe ":set textwidth=" . w:width
		exe ":set laststatus=" . w:status
		exe ":set display=" . w:display
		exe ":set formatoptions=" . w:formatoptions
		exe ":set backspace=" . w:backspace
		if (w:numbers == 1)
			set number
		endif
		if (w:relative == 1)
			set relativenumber
		endif
		if (w:cursor == 1)
			set cursorline
		endif
		if (w:joinspace == 1)
			set joinspaces
		endif
		if (w:linebreak == 0)
			set nolinebreak
		endif
		let w:writer_on = 0
	endif
endfunction

if !exists(":WriterToggle")
    command -nargs=0 WriterToggle :call w:Toggle()
endif

let &cpo = w:save_cpo
