writer.vim
==========

**writer.vim** is a plugin for distraction free writing in vim, in the
style of iA Writer and WriteRoom and their many clones. It provides a
function for switching into and back out of a fullscreen writing mode
with a large font, increased line-spacing, no line numbers, etc.

Here is what it looks like:

![image][]

The color theme in this screenshot is [solarized light](http://ethanschoonover.com/solarized). The plugin should work fine with any plugin.

Installation
------------

**pathogen**

    cd ~/.vim/bundle
    git clone git://github.com/dsanson/writer.vim

Usage
-----

Run `:WriterToggle` to turn distraction free mode on or off. 

If you want to map this to a shortcut key, put something like

    map <F4> :WriterToggle<CR>

in your .vimrc or .gvimrc.

Tips
----

If you are using MacVim on OS 10.7 or later, and want the fullscreen
background to match the window background, you need to turn of native
full-screen support in MacVim's preferences.

Alternatives
------------

This is a fork of Honza Pokorny's [writer.vim][]. I've made some changes
to the logic, some changes to the default settings, and added some
additional settings.

You might also consider Lakshan Perera's
[distraction-free-writing-vim][], which has similar aims.


License
-------

BSD license.

  [writer.vim]: https://github.com/honza/writer.vim
  [distraction-free-writing-vim]: https://github.com/laktek/distraction-free-writing-vim
  [image]: https://github.com/dsanson/writer.vim/raw/master/public/screen.png
