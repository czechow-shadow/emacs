(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

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
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8453c6ba2504874309bdfcda0a69236814cefb860a528eb978b5489422cb1791" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" default)))
 '(dante-debug (quote (inputs outputs responses command-line)))
 '(dante-methods
   (quote
    (nix impure-nix new-build nix-ghci bare-cabal bare-ghci)))
 '(dante-tap-type-time 1)
 '(fci-rule-color "#383838")
 '(helm-mode t)
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/useful.org")))
 '(package-selected-packages
   (quote
    (yaml-mode gnu-elpa-keyring-update evil-mc move-text beacon ace-window hl-todo diff-hl magit evil-magit flycheck-inline dante lcr f evil helm-ag ag smart-mode-line-powerline-theme smart-mode-line undo-tree multiple-cursors markdown-mode helm-swoop helm-projectile haskell-snippets expand-region)))
 '(projectile-git-submodule-command nil)
 '(safe-local-variable-values
   (quote
    ((projectile-tags-command . "find src app -type f | grep hs$ | xargs hasktags -e"))))
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
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".stack-work")))
 '(whitespace-style
   (quote
    (face trailing tabs spaces lines newline indentation space-after-tab space-before-tab space-mark tab-mark))))


(defun which-linux-distro ()
  "Detect by /etc/os-release"
  (interactive)
  (replace-regexp-in-string
    "\n$" "" (downcase (shell-command-to-string "cat /etc/os-release | sed 's/\"//g' | awk -F '=' '/^ID=/ {print $2}'"))))


;; Font setup
(cond
  ((equal (which-linux-distro) "debian")
    (setq my-default-font-height 100
          my-font-family "DejaVu Sans Mono"
          my-large-font-height 143))
  ((equal (which-linux-distro) "ubuntu")
    (setq my-default-font-height 120
          my-font-family "Ubuntu Mono"
          my-large-font-height 164))
  ((equal (which-linux-distro) "rhel")
    (setq my-default-font-height 94
          my-font-family "DejaVu Sans Mono"
          my-large-font-height 143))
  (t ;; fallback
    (setq my-default-font-height 94
          my-font-family "DejaVu Sans Mono"
          my-large-font-height 143))
  )

;; (custom-set-faces
;;  `(default ((t (:family ,my-font-family
;;                 :foundry "unknown"
;;                 :slant normal
;;                 :weight normal
;;                 :height ,my-default-font-height
;;                 :width normal))))
;;  '(helm-etags-file ((t (:foreground "violet" :underline t))))
;;  '(helm-ff-file ((t (:foreground "violet")))))

(set-face-attribute 'default nil :font "DejaVu Sans Mono")
(set-face-attribute 'mode-line nil :font "DejaVu Sans Mono")

;; Do not display tooltips with default gtk look
 (setq x-gtk-use-system-tooltips nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Configure paths to downloaded packages
(let ((default-directory (concat user-emacs-directory "elpa")))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory (concat user-emacs-directory "custom")))
  (normal-top-level-add-subdirs-to-load-path))

;; Smart-mode-line
(require 'smart-mode-line)
(require 'smart-mode-line-powerline-theme)
(setq sml/theme 'powerline)
(sml/setup)


;; Org mode
(global-set-key (kbd "C-c m") 'org-tags-view)


;; Haskell & intero configuration
;; (package-install 'intero)
;; (require 'intero)


(require 'flycheck)
;; Set flycheck action on file save
(setq flycheck-check-syntax-automatically '(save))

;; Do not show error in minibuffer if flycheck buffer is shown
(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

;; Helm mode
(require 'helm)
(require 'helm-config)

;; Set helm search
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(helm-mode)
;; Make Helm open in the currently open window
(add-to-list 'display-buffer-alist '("*Help*" display-buffer-same-window))


;; ;; If intero goto definition fails, use tags file
;; (defun my-intero-goto-tag ()
;;   (interactive)
;;   (let ((tok (thing-at-point 'word)))
;;     (or (intero-goto-definition) (helm-etags-select tok))))


;; (defun my-intero-mode-config ()
;;   "For use in 'intero-mode-hook'."
;;   (define-key intero-mode-map (kbd "M-.") 'my-intero-goto-tag)
;;   (define-key intero-mode-map (kbd "M-i") 'helm-swoop)
;;   (define-key intero-mode-map (kbd "M-I") 'intero-goto-definition)
;;   (define-key intero-mode-map (kbd "M-*") 'pop-tag-mark)
;;   )

;; (add-hook 'intero-mode-hook 'my-intero-mode-config)

;; ;; Make TAB invoke completion action in intero-repl mode
;; (defun my-intero-repl-mode-config ()
;;   "For use in 'intero-repl-mode-hook'."
;;   (define-key intero-repl-mode-map (kbd "TAB") 'complete-symbol)
;;   (define-key intero-repl-mode-map (kbd "<C-return>") 'find-file-at-point)
;;   )

;; (add-hook 'intero-repl-mode-hook 'my-intero-repl-mode-config)


(require 'projectile)
(projectile-mode)

;; ;; Make safe variable for all searched directories
;; (put 'projectile-tags-command 'safe-local-variable
;;      (lambda (cmd)
;;        (string-match-p "^find\\(\s+[^\s|]+\\)+\s+\|\s+grep\s+hs\$\s+\|\s+xargs\s+hasktags\s+-e$"
;; 		       cmd)))

(put 'projectile-ghcid-command 'safe-local-variable (lambda (_) t))
(put 'dante-repl-command-line 'safe-local-variable (lambda (_) t))
(put 'projectile-tags-command 'safe-local-variable (lambda (_) t))

(put 'pcz-dispatch-ide 'safe-local-variable (lambda (_) t))
(put 'pcz-dispatch-ide-engine 'safe-local-variable (lambda (_) t))


(require 'helm-projectile)
(helm-projectile-on)

(global-set-key (kbd "C-x f") 'helm-projectile-find-file)

(require 'helm-swoop)

;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Evil multiple cursors
(require 'evil-mc)
(global-evil-mc-mode  1)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; Add haskell snippets
(require 'haskell-snippets)

;; Markdown mode
(require 'markdown-mode)


;; Ace-window
(require 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Move-text
(require 'move-text)
;; Keybindings activated in evil section

;; ===========================================================================
;;                                     Misc
;; ===========================================================================

;; Error navigation
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

;; Cycle through buffers (windows)
;;(global-set-key (kbd "C-S-o") 'other-window)

;; Show previously shown buffer
(global-set-key (kbd "C-S-o") 'mode-line-other-buffer)


;; Do not query about tags reloading
(setq tags-revert-without-query t)

;; Shorten answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Do not query about following symlinks
(setq vc-follow-symlinks t)

;; Replace highlighted text on typing
(delete-selection-mode 1)


(defun my-haskell-regenerate-tags ()
  (when (eq major-mode 'haskell-mode)
    (projectile-regenerate-tags)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook #'my-haskell-regenerate-tags)

(setq backup-directory-alist '(("." . "~/.saves")))


;; Setup larger fonts for Haskell and Org modes
(defun my-buffer-face-mode-code ()
  "Set font to a hivariable width (proportional) fonts in current buffer"
  (interactive)
  ;; (setq buffer-face-mode-face `(:height ,my-large-font-height))
  ;; (buffer-face-mode)
  )

;;(add-hook 'haskell-mode-hook 'my-buffer-face-mode-code)
;;(add-hook 'org-mode-hook 'my-buffer-face-mode-code)

(setq my-small-font-height 94)

(defun pcz-buffer-face ()
  (interactive)
  (setq buffer-face-mode-face `(:height ,my-small-font-height))
  (buffer-face-mode)
  )

(add-hook 'ghcid-mode-hook 'pcz-buffer-face)

(evil-mode 1)

;; Change some of evil-mode's defaults
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "C-.") nil)
  (define-key evil-normal-state-map (kbd "M-.") nil)
  (define-key evil-normal-state-map (kbd "C-p") 'helm-etags-select)
  (define-key evil-normal-state-map (kbd "C-n") 'helm-projectile-ag)
  ;; magit
  (define-key evil-normal-state-map (kbd "M-RET") 'magit-status)
  (define-key evil-normal-state-map (kbd "<C-return>") 'lsp-execute-code-action)
  ;; move-text
  (define-key evil-visual-state-map "J" (concat ":m '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K" (concat ":m '<-2" (kbd "RET") "gv=gv"))
  ;; evil-mc
  (define-key evil-normal-state-map (kbd "C->") 'evil-mc-make-and-goto-next-match)
  (define-key evil-normal-state-map (kbd "C-<") 'evil-mc-make-and-goto-prev-match)

  (define-key evil-normal-state-map (kbd "M-C->") 'evil-mc-skip-and-goto-next-match)
  (define-key evil-normal-state-map (kbd "M-C-<") 'evil-mc-skip-and-goto-prev-match)

  (define-key evil-normal-state-map "grm" 'evil-mc-make-all-cursors)
  (define-key evil-normal-state-map "grq" 'evil-mc-undo-all-cursors)
  )

(global-set-key (kbd "C-x C-s") 'save-buffer-always)
(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(evil-define-operator evil-write-always (beg end type file-or-append &optional bang)
  "Hack around emacs's save-buffer - we want to save buffer always"
  :motion nil
  :move-point nil
  :type line
  :repeat nil
  (interactive "<R><fsh><!>")
  (set-buffer-modified-p t)
  (evil-write beg end type file-or-append bang))

(evil-ex-define-cmd "w[rite]" 'evil-write-always)

; Highlight TODO/FIXME/etc
(require 'hl-todo)
(global-hl-todo-mode)

;; Track your cursor
(require 'beacon)
(beacon-mode 1) ;; Turn on globally

; magit mode
(require 'magit)
(require 'evil-magit)

; Highlight git changes
(require 'diff-hl)
(global-diff-hl-mode 1)

; Map hunk reverting to some key combo
(global-set-key (kbd "C-M-r") 'diff-hl-revert-hunk)



; ghcid with projectile
(require 'projectile-ghcid)


;; ;; Agda stuff
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))

;; Dante =~ intero under nix ;-)
(require 'dante)


; 'my-choose-haskell-mode
(defun my-choose-haskell-mode ()
  "Choosing either stack or dante mode."
  (message "Choosing haskell mode -> up and running")
  (message (concat "Projectile project root: " (projectile-project-root)))
  (message (concat "pcz-dispatch-ide: " pcz-dispatch-ide))
  (if (locate-dominating-file "." "shell.nix")
      (progn (message "NOT Enabling DANTE mode")
        ;; (flycheck-mode)
        ;; (dante-mode)
	)
      (progn (message "NOT enabling INTERO mode")
        ;;(intero-mode))))
        )))

;; (add-hook 'haskell-mode-hook 'flycheck-mode) ;; probably not needed
;; (add-hook 'haskell-mode-hook 'my-choose-haskell-mode)


;; Buffer size management
(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 110))

(global-set-key (kbd "C-x C-`") 'set-80-columns)

;; Switch buffers with helm

(global-set-key (kbd "M-`") 'helm-buffers-list)

;; Set indentation for sh mode
(setq sh-basic-offset 2)

;; Tab width for makefile mode
(add-hook 'makefile-mode-hook (lambda ()
				(setq-local tab-width 4)
				(whitespace-mode)))

(add-to-list 'auto-mode-alist '("\\emacs\\'" . lisp-mode))

;(require 'org-jira)

;; FIXME: experiments only
(setq jiralib-url "http://localhost:8080")


;; LSP
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
(use-package yasnippet
  :ensure t)
(use-package lsp-mode
  :ensure t
  ;; :hook (haskell-mode . lsp)
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package lsp-haskell
 :ensure t
 :config
 ;; (setq lsp-haskell-process-path-hie "ghcide")
 (setq lsp-haskell-process-path-hie "ghcide-8.8.3")
 (setq lsp-haskell-process-args-hie '())
 ;; Comment/uncomment this line to see interactions between lsp client/server.
 (setq lsp-log-io t)
)
;; -------------------------------------------------------------------------------
;;                          Playing with dynamic mode dispatch
;; -------------------------------------------------------------------------------
(defgroup czechow nil
  "Private configuation dispatch methods."
  :group 'tools
  :group 'convenience)

(defcustom pcz-dispatch-ide "intero"
  "The value haskell-mode-hook will use to decide which ide to launch."
  :group 'czechow
  :type 'string)


(defun init-log ()
  (write-region "" nil "~/l"))

(defun log-msg (msg)
  (message msg)
  (write-region
   (concat (substring (current-time-string) 11 19) " [INFO] " msg "\n")
   nil "~/l" 'append))

;;
;; (add-hook 'haskell-mode-hook 'pcz-haskell-mode-setup)

;; We need to have two stages, since we can only learn .dir-locals.el
;; settings much later than haskell mode hook is run

(defun pcz-haskell-mode-setup ()
  (init-log)
  (log-msg "------------------------------")
  (log-msg (concat "Identified dir: ["
		   (file-name-directory buffer-file-name)
		   "]"))

  ;; check if .dir-locals.el exist
  (let ((file-dir (file-name-directory buffer-file-name)))
    (log-msg (concat "file-dir: " file-dir))
    (unless file-dir (error "No directory found for the buffer"))
    (let ((locals-dir-file (projectile-locate-dominating-file file-dir ".dir-locals.el")))
      (unless locals-dir-file
	(error "No .dir-locals.el found in project(ile), Haskell hooks cannot ber run"))
;;      (log-msg (concat "locals-dir-file: " locals-dir-file))
      )
    )

  (add-hook 'hack-local-variables-hook 'pcz-haskell-mode-setup-stage2 nil t)

  (log-msg "pcz-haskell-mode-setup finished")
  )

;; True Haskell mode is set here
(defun pcz-haskell-mode-setup-stage2 ()
  (log-msg "+++ Stage2 +++")
  (log-msg (concat "pcz-dispatch-ide: " pcz-dispatc-ide))

  (cond ((string= pcz-dispatch-ide "dante")
	 (log-msg "Choosing dante")
	 (flycheck-mode)
	 (dante-mode)
	 )
        ((string= pcz-dispatch-ide "ghcide")
	 (log-msg "Choosng ghcide")
	 )
        ((string= pcz-dispatch-ide "intero")
	 (log-msg "Intero not supported")
	 )
	(t (log-msg (concat "Unknown pcz-dispatch-ide: " pcz-dispatch-ide)))
	)

  (log-msg "pcz-haskell-mode-setup-stage2 run successfully")
  )

;; Get rid of those annoying tabs
(setq indent-tabs-mode nil)

;; Wanna go fancy?
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'vscode-dark-plus t)
