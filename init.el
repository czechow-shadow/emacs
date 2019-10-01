(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-check-signature nil) ;; needed here, otherwise undo-tree will not install

(package-initialize)

;; Make sure the elpa directory exists.
(let ((elpa-d (concat user-emacs-directory "elpa")))
  (unless (file-exists-p elpa-d)
    (make-directory elpa-d t)))


(package-refresh-contents)

;; Intero comes as git clone
;(package-install 'intero)

(package-install 'undo-tree)
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'helm-swoop)
(package-install 'multiple-cursors)
(package-install 'expand-region)
(package-install 'yasnippet)
(package-install 'haskell-snippets)
(package-install 'markdown-mode)

(package-install 'smart-mode-line)
(package-install 'smart-mode-line-powerline-theme)

(package-install 'ag)
(package-install 'helm-ag)
(package-install 'evil)
(package-install 'evil)

;; dante dependencies
(package-install 'cl-lib)
(package-install 'dash)
(package-install 'f)
(package-install 'flycheck)
(package-install 'haskell-mode)
(package-install 's)
(package-install 'xref)
(package-install 'lcr)


;; Make sure we stop emacs instances
(kill-emacs)
