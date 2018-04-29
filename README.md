# Emacs tips and tricks

## Launching emacs with alternative config will make some packages malfunction, so it is not a viable option :-(
```$ emacs -q -l ~/path/to/alt/emacs/dir/init.el```

## Installing environment onto a new box/account
```
git clone https://github.com/czechow-shadow/emacs.git emacs-config
cd emacs-config
emacs --batch -q -l init.el && cp .emacs ~/.emacs
```

Emacs is ready anc can be run with the  ``` emacs``` command

