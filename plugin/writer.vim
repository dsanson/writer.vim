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
		endif
		if has('gui_macvim')
			let w:fullscreen = &fullscreen
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
		if has('gui')
			if exists('g:writer_guifont')
			    exe ":set guifont=" . g:writer_guifont
		    else
			    set guifont=Monaco:h15
			endif
		    set linespace=5
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
	    if has('gui_macvim')
			set fullscreen
		endif
		let w:writer_on = 1
	else
		" Apply saved settings
		if has('gui')
		    exe ":set guifont=" . w:savedfont
		    exe ":set linespace=" . w:spacing
		endif
		if has('gui_macvim') && (w:fullscreen == 0)
			set nofullscreen
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
