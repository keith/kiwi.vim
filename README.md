# kiwi.vim

Syntax highlighting for the [Kiwi](https://github.com/allending/Kiwi)
Objective-C test framework.

## Installation

### With [Vundle](https://github.com/gmarik/vundle)

Add:

```
Bundle 'Keithbsmiley/kiwi.vim'
```

To your `.vimrc` and run `BundleInstall` from within vim or `vim
+BundleInstall +qall` from the command line

### With [Pathogen](https://github.com/tpope/vim-pathogen)

```
cd ~/.vim/bundle
git clone https://github.com/Keithbsmiley/kiwi.vim.git
```

### Setup

You can set the syntax for a file manually with `set syntax=kiwi` I
recommend you do this in your `.vimrc` detecting your typical test
filename.

```
autocmd BufNewFile,BufRead *Spec.m setlocal syntax=kiwi foldmethod=syntax
```

This changes the `syntax` to `kiwi` whenever a file named `*Spec.m` is
read or written (written sets the syntax correctly for newly created
files) You may also have to set the default `filetype` to Objective-C. I
use something like:

```
autocmd BufNewFile,BufRead *.h,*.m,*.pch setlocal filetype=objc
```

You can also install
[cocoa.vim](https://github.com/msanders/cocoa.vim/) which adds some
Objective-C highlighting features (automatically used by kiwi.vim if
it's accessible).

### Known issues

If you find any other issues or have any recommendations on how to solve
these let me know via issues/pull requests
