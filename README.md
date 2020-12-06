# Emacs Haskell development configuration (lsp and dante+nix) with evil mode

## Installing environment
Install new configuration into $HOME directory.  If you already have
emacs config there (.emacs and .emacs.d), use `./install.sh --force`
(previous config will be backed up) or delete config manually.

```
cd /path/to/your/config-dir # create it if necessary

git clone https://github.com/czechow-shadow/emacs-config.git
cd emacs-config

./install.sh
```

Emacs is ready and can be run with the  ```emacs``` command

## Compatibility
Tested with emacs 26.3
