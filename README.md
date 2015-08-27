# dotfiles

These are my dotfiles - that is, my configuration files for most Unix things
that matter.

In order to link the actual `whatever` files that live under my home directory
to these files, I use [GNU Stow][] as inspired by [Using GNU Stow to manage
your dotfiles][blogpost].

To install these files:

```sh
cd ~
git clone git@github.com:cndreisbach/dotfiles.git
cd dotfiles
stow default
stow <other directories you may want to install>
```

## Other utilities

I expect the following to be installed:

* [direnv](http://direnv.net/)
* [fasd](https://github.com/clvv/fasd)

[GNU Stow]: https://www.gnu.org/software/stow/
[blogpost]: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html