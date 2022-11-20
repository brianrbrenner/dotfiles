(setq visible-bell t
      use-dialog-box nil
      cua-mode t
      inhibit-startup-message t)
(blink-cursor-mode 0)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-auto-revert-mode 1)

;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;; backups
(setq make-backup-files nil)
(setq backup-directory-alist `(("." . "~/.saves")))

;; theme
(global-display-line-numbers-mode 1)
(setq modus-themes-mode-line '(accented borderless padded))
(setq modus-themes-region '(bg-only))
(setq modus-themes-syntax '(yellow-comments green-strings faint))
(setq modus-themes-paren-match '(bold intense))
(setq modus-themes-completions 'minimal)
;;(load-theme 'modus-vivendi t)


;; find recent files M-x open-file
(recentf-mode 1)

;; Save what you enter into minibuffer prompts
(setq history-length 25)
(savehist-mode 1)

;; save cursor spot
(save-place-mode 1)

;; avoid writing custom to init.el
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; font
(defvar efs/default-font-size 180)
(defvar efs/default-variable-font-size 180)
(add-to-list 'default-frame-alist '(font . "Iosevka Term" ))

;; straight pack-man
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)

(straight-use-package 'use-package)
(straight-use-package 'helm)

;; theme
(straight-use-package 'gruvbox-theme)
(straight-use-package 'autothemer)
(straight-use-package 'dash)

(straight-use-package 'company)

(load-theme 'gruvbox-dark-hard t)
(company-mode 1)
(helm-mode 1)

;;(evil-mode 1)
;; evil
(use-package evil
  :straight t
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map "jj" 'evil-normal-state)
 )

(use-package evil-collection
  :straight t
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Enable vertico
(use-package vertico
  :straight t
  :init
  (vertico-mode)
  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode)
  :straight t 
  )

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
   (setq read-extended-command-predicate
         #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package perspective
  :straight t
  :bind
  ("C-x b" . persp-switch-to-buffer*)        
  ("S-<right>" . persp-next)
  ("S-<left>" . persp-prev)
  :custom
  (persp-mode-prefix-key (kbd "C-x x"))  ; pick your own prefix key here
  :init
  (persp-mode)
  )
  (setq persp-suppress-no-prefix-key-warn t)

;; lsp
(use-package lsp-mode
    :straight t
    :init
    ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
    (setq lsp-keymap-prefix "C-c l")
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	    (c++-mode . lsp)
	    (c-mode . lsp)
	    ;; if you want which-key integration
	    (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)
;; optional if you want which-key integration
(use-package which-key
  :straight t
  :config
  (which-key-mode))

(setq lsp-log-io nil) ; if set to true can cause a performance hit

;; optionally
(use-package lsp-ui :commands lsp-ui-mode :straight t)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol :straight t)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol :straight t)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list :straight t)

;; optionally if you want to use debugger
;; (use-package dap-mode :straight t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; lsp opts
(setq lsp-modeline-diagnostics-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-enable-completion-at-point t)
(setq lsp-enable-semantic-highlighting t)
(setq lsp-enable-on-type-formatting t)
