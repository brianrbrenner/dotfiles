(server-start)
(setq visible-bell t
      use-dialog-box nil
      cua-mode t
      inhibit-startup-message t)
(blink-cursor-mode 0)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-auto-revert-mode 1)
(set-default-coding-systems 'utf-8)

;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;; esc cancel all
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; tabs
(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

;; backups
(setq backup-directory-alist `(("." . "~/.saves")))

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
(defvar efs/default-font-size 200)
(defvar efs/default-variable-font-size 200)
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font" ))

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
(straight-use-package 'company)
(straight-use-package 'key-chord)
(straight-use-package 'flycheck-projectile)

(global-display-line-numbers-mode 1)

;; default theme
(use-package spacegray-theme :defer t)
(use-package doom-themes :defer t)
(load-theme 'doom-palenight t)
(doom-themes-visual-bell-config)

;; gruvbox theme
;; (straight-use-package 'gruvbox-theme)
;; (straight-use-package 'autothemer)
;; (straight-use-package 'dash)
;; (load-theme 'gruvbox-dark-hard t)

;; modus theme
;;(setq modus-themes-mode-line '(accented borderless padded))
;;(setq modus-themes-region '(bg-only))
;;(setq modus-themes-syntax '(yellow-comments green-strings faint))
;;(setq modus-themes-paren-match '(bold intense))
;;(setq modus-themes-completions 'minimal)
;;(load-theme 'modus-vivendi t)


(company-mode 1)

(use-package vterm
	:straight t
  :ensure t)

;; evil
(use-package evil
  :straight t
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

(global-set-key (kbd "C-M-u") 'universal-argument)

;;Exit insert mode by pressing j and then j quickly
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(use-package evil-collection
  :straight t
  :after evil
  :init
  (setq evil-collection-company-use-tng nil)  ;; Is this a bug in evil-collection?
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
	:straight t
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; Enable vertico
(defun dw/minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
      (backward-kill-word arg)))

(use-package vertico
  :straight '(vertico :host github
                      :repo "minad/vertico"
                      :branch "main")
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . dw/minibuffer-backward-kill))
  :custom
  (vertico-cycle t)
  :custom-face
  (vertico-current ((t (:background "#3a3f5a"))))
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
	:straight t
  :config
  (setq history-length 25)
  (savehist-mode 1))

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

;; persp
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
	    (js-mode . lsp)
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
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol :straight t)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol :straight t)
(use-package lsp-treemacs :after lsp :commands lsp-treemacs-errors-list :straight t)

;; optionally if you want to use debugger
;;(use-package dap-mode :straight t)
;;(use-package dap-cpptools :straight t) ;to load the dap adapter for your language

;; lsp opts
(setq lsp-modeline-diagnostics-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-enable-completion-at-point t)
(setq lsp-enable-semantic-highlighting t)
(setq lsp-enable-on-type-formatting t)

;; Projectile
(use-package projectile
	:straight t
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/projects/")
    (setq projectile-project-search-path '("~/projects/")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
	:straight t
  :after projectile
  :config (counsel-projectile-mode))

;; general leaders
(use-package general
  :straight t
  :config
  (general-evil-setup t)

  (general-create-definer dw/leader-key-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (general-create-definer dw/ctrl-c-keys
    :prefix "C-c"))

;; unicode glyph support
(defun dw/replace-unicode-font-mapping (block-name old-font new-font)
  (let* ((block-idx (cl-position-if
                         (lambda (i) (string-equal (car i) block-name))
                         unicode-fonts-block-font-mapping))
         (block-fonts (cadr (nth block-idx unicode-fonts-block-font-mapping)))
         (updated-block (cl-substitute new-font old-font block-fonts :test 'string-equal)))
    (setf (cdr (nth block-idx unicode-fonts-block-font-mapping))
          `(,updated-block))))

(use-package unicode-fonts
  :straight t
  :disabled
  :if (not dw/is-termux)
  :custom
  (unicode-fonts-skip-font-groups '(low-quality-glyphs))
  :config
  ;; Fix the font mappings to use the right emoji font
  (mapcar
    (lambda (block-name)
      (dw/replace-unicode-font-mapping block-name "Apple Color Emoji" "Noto Color Emoji"))
    '("Dingbats"
      "Emoticons"
      "Miscellaneous Symbols and Pictographs"
      "Transport and Map Symbols"))
  (unicode-fonts-setup))

;; modeline
(setq display-time-format "%l:%M %p %b %y"
      display-time-default-load-average nil)
(use-package diminish :straight t)
(use-package smart-mode-line
  :straight t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  (sml/apply-theme 'respectful)  ; Respect the theme colors
  (setq sml/mode-width 'right
      sml/name-width 60)
	
	(setq-default mode-line-format
		`("%e",
				mode-line-front-space
				evil-mode-line-tag
				mode-line-mule-info
				mode-line-client
				mode-line-modified
				mode-line-remote
				mode-line-frame-identification
				mode-line-buffer-identification
				sml/pos-id-separator
				(vc-mode vc-mode)
				" "
				;mode-line-position
				sml/pre-modes-separator
				mode-line-modes
				" "
				mode-line-misc-info))

  (setq rm-excluded-modes
    (mapconcat
      'identity
      ; These names must start with a space!
      '(" GitGutter" " MRev" " company"
      " Helm" " Undo-Tree" " Projectile.*" " Z" " Ind"
      " Org-Agenda.*" " ElDoc" " SP/s" " cider.*")
      "\\|")))

;; You must run (all-the-icons-install-fonts) one time after
;; installing this package!
(use-package minions
  :straight t
  :hook (doom-modeline-mode . minions-mode))

(use-package doom-modeline
  :straight t
  :after eshell     ;; Make sure it gets hooked after eshell
  :hook (after-init . doom-modeline-init)
  :custom-face
  (mode-line ((t (:height 0.85))))
  (mode-line-inactive ((t (:height 0.85))))
  :custom
  (doom-modeline-height 15)
  (doom-modeline-bar-width 6)
  (doom-modeline-lsp t)
  (doom-modeline-github nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-irc nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-major-mode-icon nil))

;; IVY
(use-package ivy
	:straight t
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)

  ;; Use different regex strategies per completion command
  (push '(completion-at-point . ivy--regex-fuzzy) ivy-re-builders-alist) ;; This doesn't seem to work...
  (push '(swiper . ivy--regex-ignore-order) ivy-re-builders-alist)
  (push '(counsel-M-x . ivy--regex-ignore-order) ivy-re-builders-alist)

  ;; Set minibuffer height for different commands
  (setf (alist-get 'counsel-projectile-ag ivy-height-alist) 15)
  (setf (alist-get 'counsel-projectile-rg ivy-height-alist) 15)
  (setf (alist-get 'swiper ivy-height-alist) 15)
  (setf (alist-get 'counsel-switch-buffer ivy-height-alist) 7))

(use-package ivy-hydra
	:straight t
  :defer t
  :after hydra)

(use-package ivy-rich
	:straight t
  :init
  (ivy-rich-mode 1)
  :after counsel
  :config
  (setq ivy-format-function #'ivy-format-function-line)
  (setq ivy-rich-display-transformers-list
        (plist-put ivy-rich-display-transformers-list
                   'ivy-switch-buffer
                   '(:columns
                     ((ivy-rich-candidate (:width 40))
                      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
                      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
                      (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
                      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file 
										 ;;path relative to project root or `default-directory' if project is nil
                     :predicate
                     (lambda (cand)
                       (if-let ((buffer (get-buffer cand)))
                           ;; Don't mess with EXWM buffers
                           (with-current-buffer buffer
                             (not (derived-mode-p 'exwm-mode)))))))))

(use-package counsel
	:straight t
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ;; ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package flx  ;; Improves sorting for fuzzy-matched results
	:straight t
  :after ivy
  :defer t
  :init
  (setq ivy-flx-limit 10000))

(use-package wgrep :straight t)

(use-package ivy-posframe
	:straight t
  :disabled
  :custom
  (ivy-posframe-width      115)
  (ivy-posframe-min-width  115)
  (ivy-posframe-height     10)
  (ivy-posframe-min-height 10)
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((parent-frame . nil)
                                  (left-fringe . 8)
                                  (right-fringe . 8)))
  (ivy-posframe-mode 1))

(use-package prescient
	:straight t
  :after counsel
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
	:straight t
  :after prescient
  :config
  (ivy-prescient-mode 1))

;; nvim like telescope find
(dw/leader-key-def
  "r"   '(ivy-resume :which-key "ivy resume")
  "f"   '(:ignore t :which-key "files")
  "ff"  '(counsel-find-file :which-key "open file")
  "C-f" 'counsel-find-file
  "fr"  '(counsel-recentf :which-key "recent files")
  "fR"  '(revert-buffer :which-key "revert file")
  "fj"  '(counsel-file-jump :which-key "jump to file"))

;; org bindings
(use-package evil-org
	:straight t
  :after org
  :hook ((org-mode . evil-org-mode)
         (org-agenda-mode . evil-org-mode)
         (evil-org-mode . (lambda () (evil-org-set-key-theme
																			'(navigation todo insert textobjects additional)))))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(dw/leader-key-def
  "o"   '(:ignore t :which-key "org mode")

  "oi"  '(:ignore t :which-key "insert")
  "oil" '(org-insert-link :which-key "insert link")

  "on"  '(org-toggle-narrow-to-subtree :which-key "toggle narrow")

  "os"  '(dw/counsel-rg-org-files :which-key "search notes")

  "oa"  '(org-agenda :which-key "status")
  "ot"  '(org-todo-list :which-key "todos")
  "oc"  '(org-capture t :which-key "capture")
  "ox"  '(org-export-dispatch t :which-key "export"))
