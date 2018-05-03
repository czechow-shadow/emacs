(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

;; Make sure the elpa directory exists.
(let ((elpa-d (concat user-emacs-directory "elpa")))
  (unless (file-exists-p elpa-d)
    (make-directory elpa-d t)))


(package-refresh-contents)

(package-install 'intero)
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'helm-swoop)
(package-install 'multiple-cursors)
(package-install 'expand-region)
(package-install 'undo-tree)
(package-install 'yasnippet)
(package-install 'haskell-snippets)
(package-install 'markdown-mode)

(package-install 'smart-mode-line)
(package-install 'smart-mode-line-powerline-theme)

;; This one renders an error during installation. But it seems to work fine.
(package-install 'workgroups2)

;; Make sure we stop emacs instances
(kill-emacs)
