writer.vim
==========

**writer.vim** is a plugin to help you write prose in vim. It will give you a
bigger font, change it to Monaco, set the text widths to 3 alphabets (75
characters), increase the linespacing, turn off line numbers and the status
bar.

Inspired by the amazing `IA Writer`_ for Mac/iPad.

.. image:: https://github.com/dsanson/writer.vim/raw/master/public/screen.png

David's Fork
------------

This is a fork of writer.vim. I've made some changes to the logic and added 
more settings to provide what, by my lights, is a pleasant distraction free
vim writing environment.

I really like the basic concept of this plugin: provide a set of opinionated
settings, and package them up in a toggle function. So often, these settings
get spread out into one's .vimrc and .gvimrc files, making it hard to try
out new settings, and making it hard for new users to get something nice
without a lot of tweaking.

Installation
------------

**pathogen**

::

    cd ~/.vim/bundle
    git clone git://github.com/dsanson/writer.vim

Usage
-----

Run ``:WriterToggle`` to toggle the writing settings.

**Note**: ~~the plugin doesn't work in terminal vim. Please use MacVim, gVim and
the like.~~ [In this fork, I've tried to separate out the gui-only settings from
the settings that should work from the console as well. So this should work okay
in terminal vim -- David]

Contributing and feedback
-------------------------

All feedback and contributions are most welcome. This is my first vim plugin,
so be nice :).

License
-------

BSD license.

.. _IA Writer: http://www.iawriter.com/
