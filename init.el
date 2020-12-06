(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(package-initialize)

;; Make sure the elpa directory exists.
(let ((elpa-d (concat user-emacs-directory "elpa")))
  (unless (file-exists-p elpa-d)
    (make-directory elpa-d t)))


(package-refresh-contents)

(package-install 'undo-tree)
(package-install 'ace-window)
(package-install 'move-text)
(package-install 'beacon)
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'helm-swoop)
(package-install 'expand-region)
(package-install 'yasnippet)
(package-install 'haskell-snippets)
(package-install 'markdown-mode)
(package-install 'yaml-mode)

(package-install 'smart-mode-line)
(package-install 'smart-mode-line-powerline-theme)

(package-install 'ag)
(package-install 'helm-ag)
(package-install 'evil)
;; (package-install 'evil-mc) ;; this one comes from git

(package-install 'magit)
(package-install 'evil-magit)
(package-install 'flycheck-inline)
(package-install 'flycheck-pos-tip) ;; just to show off
(package-install 'diff-hl)
(package-install 'hl-todo)

;; Needed by lsp config
(package-install 'use-package)

;; dante dependencies
(package-install 'cl-lib)
(package-install 'dash)
(package-install 'f)
(package-install 'flycheck)
(package-install 'haskell-mode)
(package-install 's)
(package-install 'xref)
(package-install 'lcr)

;; Intero dependencies
;; FIXME: obsolete intero
(package-install 'company)


;; Make sure we stop emacs instances
(kill-emacs)
;;; init.el ends here
