(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

;; First make sure the directory exists.
;; If not create it
(let ((elpa-d (concat user-emacs-directory "elpa")))
  (unless (file-exists-p elpa-d)
    (make-directory elpa-d t)))

;; Configure paths to downloaded packages
(let ((default-directory (concat user-emacs-directory "elpa")))
  (normal-top-level-add-subdirs-to-load-path))

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

;; Make sure we stop any emacs instances
(kill-emacs)
