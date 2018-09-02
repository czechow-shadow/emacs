# Emacs Haskell development configuration with evil mode

## Installing environment
Wipe out previous emacs configuration
```
rm -fr ~/.emacs ~/.emacs.d
```

Install new configuration
```
git clone https://github.com/czechow-shadow/emacs-config.git
cd emacs-config
emacs --batch -q -l init.el && cp emacs ~/.emacs && cp -r custom ~/.emacs.d/
```

Emacs is ready and can be run with the  ```emacs``` command
