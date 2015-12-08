# Vim Tutorial

## Important Things:  Starting, Quitting, Modes

* Start Vim by typing `vim`, not `vi`.
    * Some installations have separate binaries for each (eg., OpenBSD).
    * `vi` is the legacy, POSIX-standard program, `vim` is the new, not
      always compatible program

* Quit Vim in _Normal mode_ by typing `<Esc>:q!<CR>`
    * Vim uses lots of mnemonics for its commands:  `:q` is short for
      `:quit`.

* Access Vim's built-in help system by typing `<Esc>:help<CR>`

* So what's _Normal mode_?  What are _modes_?
    * Vim is a _modal_ editor, meaning it does different things based on
      which _mode_ you have it in.
    * There are many modes:
        * **Normal** mode: used for navigation and text manipulation.
          The default mode. Hit <Esc> to get back to it.
        * **Insert** mode: used for inserting new text into a buffer.
          Enter this mode by typing `<i>` in Normal mode (or `<I>`, or
          `<o>`, or `<O>`, or...).
        * **Visual** mode: used for manipulating text selections.
        * **Select** mode: same as visual, but more GUI-oriented.
        * **Command** mode: used for entering editor commands, like
          `:q` to quit.
        * `ex` mode:  line-oriented mode.  Run screaming.


## Writing Our First Document

* Three steps:
    * Start Vim
    * Hit `<i>` to enter Insert mode
    * Start typing

* When done typing, hit `<Esc>` to go back to Normal mode, then `:saveas
  doc.txt` to save the file. (Shortcut:  `:sav <filename>`)

* Hit `<i>` to add more text, then hit `<Esc>:w` to **w**rite the
  current file to disk.

* Congratulations, you've used Vim to write a document!


## Moving Around

* Sure, you can use arrow keys, PageUp, PageDown, etc. with Vim.

* What if those don't work?
    * Mac's Terminal.app remaps PageUp/PageDown to scroll through the
      windows's scrollback buffer instead of passing it through.
    * If you find yourself with a real `vi` (like OpenBSD's `nvi`), it
      may not understand arrow keys

* Solution:  use `hjkl` instead!
    * In Normal/Command mode
    * `<h>` moves the cursor one character **left** (think: `h` is the
      left-most character)
    * `<l>` moves the cursor one character **right** (think: `l` is the
      right-most character)
    * `<j>` moves the cursor one character **down** (think: `j` hangs
      below the line)
    * `<k>` moves the cursor one character **up** (think: `k` ascends
      above the line)

* What about paging up/down?
    * Use `<C-d>`/`<C-u>` to page **d**own/**u**p

* Why use `hjkl` and `<C-d>`/`<C-u>` instead of arrow and page keys if
  they work?
    * Your fingers _never leave home row_

* Do I _have_ to use these weird keys?
    * No!  Do what works for **you**, not for anyone else.


## Advanced Movement

* `<w>` moves one _word_ **f**orwards
* `<b>` moves one _word_ **b**ackwards
* `<^>` moves to the first non-whitespace character at the _beginning_
  of a line
* `<0>` moves to the _beginning_ of a line, too (think: column **zero**)
* `<$>` moves to the _end_ of a line (think: regular expressions)
* `<G>` moves to the _last_ line of a document (think: **G**oto. No, it
  doesn't make sense in this context.  More later.)
* `<gg>` moves to the _first_ line of a document
    * _Note_: this is a Vim command, and will not work in `vi`. Use `:0`
      instead.
* `:[line]<CR>` moves the cursor to the line number specified.  For
  instance, `:16<CR>` would move the cursor to line 16 of the current
  buffer.

## More Advanced Movement

* `<e>` moves one _word_ forwards, and places the cursor at the **e**nd
  of the word
* Most movement commands can take a _count_ prefix.  Examples:
    * `<2w>` moves two words forwards
    * `<4j>` moves four lines down
    * `<12G>` goto the twelfth line from the top of the document (I told
      you to wait for it.)
    * `<3h>` moves three characters backwards
* The `z` command can be useful to move the viewport around (in Normal
  mode)
    * `<z<CR>>` moves the current line to the top of the screen
    * `<z.>` moves the current line to the middle of the screen
    * `<z->` moves the current line to the bottom of the screen


## Text Manipulation

* Let's talk about adding things.
    * As seen before, `<i>` enters Insert mode and lets you start typing
      exactly where the cursor is located
    * `<I>` will place the cursor at the first non-space character on a
      line, then put you in Insert mode.
    * `<a>` will let you **a**ppend text.  It places the cursor one
      character to the right, then places you in Insert mode.
    * `<A>` **a**ppends text to the end of a line.
    * `<o>` **o**pens a new text line below the current line.
    * `<O>` **o**pens a new text line above the current line.

* Let's talk about deleting things.
    * Type the sentence, "The quick brown brown fox jumped over the lazy
      ddog."
    * See how you misspelled "dog"?
        * In Normal mode, use `<h>` to move backwards until your cursor
          is resting on the extra "d"
        * Hit `<x>` to delete the character under the cursor
    * Oops, you wrote "brown" twice!
        * Method 1:  still in Insert mode, arrow-key your way back to
          the second "brown" and hit `<BS>` (Backspace) to delete it
        * Method 2:
            * Hit `<Esc>` to go back to Normal mode
            * Use `<b>` to moves backwards by words until your cursor is
              at the beginning of the second "brown"
            * Type `<dw>` to **d**elete the **w**ord at the cursor.
    * Most movement commands also accept a modifier (the `d` in the
      previous example).  Other modifiers include:
        * `<c>` **c**hanges the following [character/word/etc.] by
          deleting it, then putting Vim into Insert mode so you can
          start typing
    * You know what, that sentence is terrible.  Just delete the entire
      line.
        * Use `<dd>` to delete a line.


## Searching

* To find the next occurrence of a text pattern, in Normal mode type
  `/pattern<CR>`
    * Example:  To find the next occurrence of the word "Normal" in this
      document, I'd type `<Esc>/Normal<CR>`
        * Note that _pattern_ can be a regular expression!

* The above is an example of a _forwards_ search.  To perform a
    _backwards_ search, use `?pattern<CR>` instead.

* To find the next occurrence of the same pattern, use `n`.
    * Note that using `n` when doing a backwards search will find the
      next occurrence _earlier_ in the document.

* To find the previous occurrence of the same pattern, use `N`.

* To find the next occurrence of the word underneath the cursor, in
  Normal mode hit `<*>`

* Similarly, to find the previous occurrence of the word underneath the
  cursor, use `<#>`


## Replacing

* There are many ways to replace text using Vim.  The following are only
  a couple of the most useful methods.  You should be in Normal mode
  (hit `<Esc>` to get there from Insert mode) for all of these.
    * To replace all occurrences of the word "cat" with "dog" _in a
      document_, type `:%s/cat/dog/`
    * To replace all occurrences of the word "cat with "dog" _on the
      current line_, type `:s/cat/dog/g`.  (Note the absence of the
      percentage sign!)
    * To replace the _next_ occurrence of the word "cat" with "dog" in
      the document, type `:s/cat/dog/`.  (Note the absence of the `g` at
      the end!)
        * You can use `<n>` to search for the next occurrence of _cat_,
          and then use `<&>` to replace it with _dog_.

## Selecting, Copying & Pasting

* Vim calls "copying" text "yanking".
* To yank text, first you have to highlight it.
    * Navigate to the start of your selection, then press `<v>` (this
      enters **V**isual mode)
    * Using the movement keys, navigate to the end of the selection
    * Hit `<y>` to **y**ank the text into Vim's clipboard.
* To paste text, place your cursor where you'd like the yanked text to
  appear and hit `<p>` to **p**aste it.  Note:  the yanked text will be
  placed _after_ the cursor.  Use `<P>` to paste yanked text _before_
  the cursor.
* If you want to select entire lines, use `<V>` instead of `<v>`.
* BIG NOTE:  the `<y>` and `<Y>` commands **do not work** in regular
  `vi`!


## Miscellaneous

* Show line numbers by typing `:set number` in Normal mode.  Turn them
  off again by typing `:set nonumber`.
* To get help on any Vim command, type `:help command`.  For example:
    * `:help number`
    * `:help w` (to get help on the movement command)
    * `:help :w` (to get help on the `:write` command)
    * `:help vimtutor` (a very useful built-in tutorial!)
* Fun tutorials:
    * [OpenVim][] - an interactive Vim tutorial
      (http://www.openvim.com/tutorial.html)
    * [Vim Adventures][] - "Learning Vim while playing a
      game" (http://vim-adventures.com)


## What Else Can Vim Do?

* A lot!
    * Custom keybindings
    * Syntax highlighting
    * Auto-indenting
    * Keyword completion
    * Custom color schemes
    * "Vimscript"
    * Plugins
    * Spell-checking
    * Built-in `make` support
    * Built-in `ctags` support
    * It's not emacs!

* See [my .vimrc][] (http://code.crosse.org/dotfiles/src/master/.vimrc)
  for a fully-annotated example of a `.vimrc` configuration file that
  includes many of the above features.


[OpenVim]: http://www.openvim.com/tutorial.html
[Vim Adventures]: http://vim-adventures.com
[my .vimrc]: http://code.crosse.org/dotfiles/src/master/.vimrc
