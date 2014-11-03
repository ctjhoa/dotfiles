; Init MELPA repo
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

; Theme
(set-default-font "Monaco-9")

; Remove bars
(progn
    (menu-bar-mode -1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1))

(line-number-mode t)
(column-number-mode t)

(setq redisplay-dont-pause t
      require-final-newline t
      scroll-step 1
      scroll-conservatively 10000
      mouse-yank-at-point t
      inhibit-default-init t
      inhibit-startup-screen t
      custom-file "~/.emacs.d/custom.el")
(load custom-file)

(toggle-truncate-lines t)

; Auto install use-package
(if (not (package-installed-p 'use-package))
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(require 'use-package)

; Ensure packages

;; Colorscheme

(use-package sublime-themes
  :ensure
  :config
  (load-theme 'granger :no-confirm))

(use-package hl-line
  :ensure
  :init (global-hl-line-mode t)
  :config
  (set-face-background hl-line-face "gray5")
  (set-face-foreground hl-line-face nil))

(use-package smart-mode-line
  :ensure
  :pre-load (setq sml/no-confirm-load-theme t)
  :init
  (sml/setup)
  :config
  (sml/apply-theme 'respectful)
  (set-face-attribute 'mode-line nil
		      :foreground "gray40"
		      :background "black"
		      :box '(:color "black" :line-width 6))
  (set-face-attribute 'mode-line-inactive nil
		      :foreground "gray15"
		      :background "black"
		      :box '(:color "black" :line-width 6)))

(use-package highlight-numbers
  :ensure
  :diminish highlight-numbers-mode
  :init (highlight-numbers-mode t))

(use-package highlight-quoted
  :ensure
  :diminish highlight-quoted-mode
  :init (highlight-quoted-mode t))

(use-package ido
  :commands (ido-find-file
	     ido-switch-buffer)
  :init
  (ido-mode t)
  (setq ido-everywhere t
	ido-create-new-buffer 'always
	ido-default-buffer-method 'selected-window)
  :config
  (progn
    (define-key ido-file-completion-map  (kbd "  ") 'ido-prev-match)
    (define-key ido-file-completion-map  (kbd "<tab>") 'ido-next-match))
  (use-package ido-vertical-mode
    :ensure
    :init (ido-vertical-mode t))
  (use-package flx-ido
    :ensure
    :init (flx-ido-mode t)
    :config (setq ido-use-face nil))
  (use-package ido-ubiquitous
    :ensure
    :init (ido-ubiquitous-mode t))
  (use-package ido-hacks
    :ensure
    :init (ido-hacks-mode t))
  (use-package smex
    :ensure
    :init (smex-initialize)
    :bind ("M-x" . smex)))


(use-package yasnippet
  :ensure
  :diminish yas-minor-mode
  :commands yas-global-mode
  :idle (yas-global-mode)
  :init
  (setq yas-verbosity 1
	yas-prompt-functions '(yas-completing-prompt yas-ido-prompt)))

(use-package company
  :ensure
  :commands global-company-mode
  :idle (global-company-mode)
  :config
  (progn
    (add-to-list 'company-backends 'company-yasnippet)
    (define-key company-mode-map (kbd "C-n") 'company-select-next)
    (define-key company-mode-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "<tab>") 'company-complete)))

(use-package evil
  :ensure
  :pre-load
  (setq evil-want-C-u-scroll t
	evil-want-C-i-jump t)
  :config
  (progn 
    (evil-mode t)
    (evil-add-hjkl-bindings magit-status-mode-map 'emacs
      ":" 'evil-ex
      "K" 'magit-discard-item
      "l" 'magit-key-mode-popup-logging
      "h" 'magit-diff-toggle-refine-hunk)
    ;; move RET and SPC from motion state to normal state
    (mapcar
     (lambda (k)
       (define-key evil-normal-state-map k (lookup-key evil-motion-state-map k))
       (define-key evil-motion-state-map k nil))
     (list (kbd "RET") " "))
    ;; ex-mode shortcuts
    (define-key evil-ex-map "e " 'ido-find-file)
    (define-key evil-ex-map "b " 'ido-switch-buffer)
    (define-key evil-ex-map "pf " 'projectile-find-file)
    (define-key evil-ex-map "pp " 'projectile-switch-project)
    (define-key evil-ex-map "pa " 'projectile-ag)
    (define-key evil-ex-map "pb " 'projectile-switch-to-buffer)
    (define-key evil-ex-map "po " 'projectile-find-other-file)
    ;; Vim-ism ;]
    (define-key evil-normal-state-map "Y" (kbd "y$"))
    ;; ESC exit from anywhere
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit))
  (use-package evil-visualstar
    :ensure)
  (use-package evil-jumper
    :ensure)
  (use-package evil-matchit
    :ensure)
  (use-package evil-surround
    :ensure
    :commands global-evil-surround-mode
    :idle (global-evil-surround-mode)
    :config
    (setq-default surround-pairs-alist
		  '((?\( . ("(" . ")"))
		    (?\[ . ("[" . "]"))
		    (?\{ . ("{" . "}"))
		    (?\) . ("( " . " )"))
		    (?\] . ("[ " . " ]"))
		    (?\} . ("{ " . " }"))
		    (?# . ("#{" . "}"))
		    (?b . ("(" . ")"))
		    (?B . ("{" . "}"))
		    (?> . ("<" . ">"))
		    (?t . evil-surround-read-tag)
		    (?< . evil-surround-read-tag)
		    (?f . evil-surround-function)))))

;(use-package vi-tilde-fringe-mode
;  :ensure)

;; Per languages
;(add-hook 'prog-mode-hook 'vi-tilde-fringe-mode)

(use-package highlight-parentheses
  :init
  (progn 
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (eldoc-mode t)))))
(use-package highlight-parentheses
  :init
  (progn 
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (electric-pair-mode t)))))
(use-package highlight-parentheses
  :ensure
  :init
  (progn 
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (highlight-parentheses-mode t)))))
(use-package rainbow-delimiters
  :ensure
  :init
  (progn 
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (rainbow-delimiters-mode t)))))

(use-package rainbow-mode
  :ensure
  :init
  (progn 
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (rainbow-mode t)))
    (add-hook 'css-mode-hook (lambda()
				      (rainbow-mode t)))
    (add-hook 'html-mode-hook (lambda()
				      (rainbow-mode t)))))

(use-package js2-mode
  :ensure
  :mode "\\.js\\'"
  :interpreter "javascript")
