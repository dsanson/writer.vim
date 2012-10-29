writer.vim
==========

**writer.vim** is a plugin for distraction free writing in vim, in the
style of iA Writer and WriteRoom and their many clones. It provides a
function for switching into and back out of "writer mode": a fullscreen writing mode with a large font, increased line-spacing, no line numbers, etc.

Here is what it looks like in MacVim using the [solarized light](http://ethanschoonover.com/solarized) color theme: 

![image][]

Installation
------------

**pathogen**

    cd ~/.vim/bundle
    git clone git://github.com/dsanson/writer.vim

Usage
-----

Run `:WriterToggle` to turn "writer mode" on and off. 

If you want to map this to a shortcut key, put something like

    map <F4> :WriterToggle<CR>

in your .gvimrc.

Tips
----

By default, the font in "writer mode" is Menlo:h15. You can change this by setting `g:writer_guifont` in your .gvimrc.

If you are using MacVim on OS 10.7 or later, and want the fullscreen
background to match the window background, you need to turn of native
full-screen support in MacVim's preferences.

The plugin should work fine with any color theme. When switching between color themes, the fullscreen background color will not be automatically updated to the new window background color. Toggling out of and then back into "writer mode" should fix this.

Alternatives
------------

What makes for a good "writer mode" is subjective.

This is a fork of Honza Pokorny's [writer.vim][]. I've made some changes
to the logic, some changes to the default settings, and added some
additional settings that suit my needs.

You might also be interested in Lakshan Perera's
[distraction-free-writing-vim][], which has similar aims to writer.vim.


License
-------

BSD license.

  [writer.vim]: https://github.com/honza/writer.vim
  [distraction-free-writing-vim]: https://github.com/laktek/distraction-free-writing-vim
  [image]: https://github.com/dsanson/writer.vim/raw/master/public/screen.png
