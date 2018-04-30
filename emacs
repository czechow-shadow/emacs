
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("8453c6ba2504874309bdfcda0a69236814cefb860a528eb978b5489422cb1791" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" default)))
 '(fci-rule-color "#383838")
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(projectile-tags-command "find src app -type f | grep hs$ | xargs hasktags -e")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t)))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(vc-directory-exclusion-list
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".stack-work"))))


(defun which-linux-distro ()
  "from lsb_release"
  (interactive)
  (replace-regexp-in-string
    "\n$" "" (downcase (shell-command-to-string "lsb_release -si"))))


;; Ubuntu
;;(custom-set-face
;; '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 164 :width normal)))))

;;(let ((csf '(:foundry "unknown" :slant normal :weight normal :width normal)))
;;  (when (equal (which-linux-distro) "debian")
;;    (custom-set-faces
;;      '(default ((t (append (:family "DejaVu Sans Mono" :height 143) csf)))))))



(cond
  ((equal (which-linux-distro) "debian")
    (custom-set-faces
      '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 143 :width normal))))))
  ((equal (which-linux-distro) "ubuntu")
    (custom-set-faces
      '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 164 :width normal)))))))



(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
;; (package-refresh-contents)

;; Configure paths to downloaded packages
(let ((default-directory (concat user-emacs-directory "elpa")))
  (normal-top-level-add-subdirs-to-load-path))

;; Haskell & intero configuration
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

;; Set flycheck action on file save
(setq flycheck-check-syntax-automatically '(save new-line))

;; Helm mode
(require 'helm)
(require 'helm-config)

;; Set helm search
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(helm-mode)

(defun my-goto-tag ()
  (interactive)
  (let (mytok (thing-at-point 'word))
    (message "Tag is %s" mytok)
    (or (intero-goto-definition) (helm-etags-select mytok))))

;; FIXME: make some of those local
(global-set-key (kbd "M-.") 'my-goto-tag)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'intero-goto-definition)

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(helm-mode)

(require 'projectile)
(projectile-mode)

(require 'helm-projectile)
(helm-projectile-on)

(global-set-key (kbd "C-x f") 'helm-projectile-find-file)

(require 'helm-swoop)

;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/skip-to-previous-like-this)


(require 'undo-tree)
(global-undo-tree-mode)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; Add haskell snippets
(require 'haskell-snippets)

;; Markdown mode
(require 'markdown-mode)

;; Misc

;; Do not query about tags reloading
(setq tags-revert-without-query t)

(defun my-haskell-regenerate-tags ()
  (when (eq major-mode 'haskell-mode)
    (projectile-regenerate-tags)))

(add-hook 'after-save-hook #'my-haskell-regenerate-tags)


(setq backup-directory-alist '(("." . "~/.saves")))
