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
(fset 'yes-or-no-p 'y-or-n-p)

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
  :init (sml/setup)
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


(use-package volatile-highlights
  :ensure
  :diminish volatile-highlights-mode
  :init (volatile-highlights-mode t))

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
;  (use-package ido-other-window
;    :ensure
;    :config
;    (defun my-ido-split-keys ()
;      "Add my keybindings to enable window splitting with ido."
;      (mapcar
;       (lambda (map)
;	 (define-key map (kbd "<C-return>") 'ido-exit-minibuffer)
;	 (define-key map (kbd "C-o") 'ido-invoke-in-other-window)
;	 (define-key map (kbd "C-h") 'ido-invoke-in-vertical-split)
;	 (define-key map (kbd "C-v") 'ido-invoke-in-horizontal-split)
;	 (define-key map (kbd "C-t") 'ido-invoke-in-new-frame))
;       (list ido-buffer-completion-map
;	     ido-common-completion-map
;	     ido-file-completion-map
;	     ido-file-dir-completion-map)))
;  (add-hook 'ido-setup-hook 'my-ido-split-keys))
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


(use-package company
  :ensure
  :idle (global-company-mode t)
  :config
  (progn
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
    (define-key evil-ex-map (kbd "e ") 'ido-find-file)
    (define-key evil-ex-map (kbd "b ") 'ido-switch-buffer)))

;(use-package vi-tilde-fringe-mode
;  :ensure)

;; Per languages
;(add-hook 'prog-mode-hook 'vi-tilde-fringe-mode)
(add-hook 'emacs-lisp-mode-hook
	  (lambda()
	    (use-package eldoc
	      :ensure
	      :diminish eldoc-mode
	      :init
	      (progn 
		(eldoc-mode t)))
	    (use-package highlight-parentheses
	      :ensure
	      :init
	      (progn 
		(highlight-parentheses-mode t)))
	    (use-package rainbow-delimiters
	      :ensure
	      :init
	      (progn 
		  (rainbow-delimiters-mode t)))
	    (electric-pair-mode t)))

(use-package js2-mode
  :ensure
  :mode "\\.js\\'"
  :interpreter "javascript")
