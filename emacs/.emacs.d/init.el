; Init MELPA repo
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; Theme
(load-theme 'wombat)
(set-default-font "Monaco-9")

; Remove bars
(progn
    (menu-bar-mode -1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1))

(setq inhibit-startup-screen t)

; Auto install use-package
(if (not (package-installed-p 'use-package))
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(require 'use-package)

; Ensure packages
(use-package ido
  :ensure
  :init (ido-mode t)
  :config
  (progn
    (use-package ido-vertical-mode
      :ensure
      :init (ido-vertical-mode t))
    (use-package ido-ubiquitous
      :ensure
      :init (ido-ubiquitous-mode t))
    (use-package flx-ido
      :ensure
      :init (flx-ido-mode t))
    (use-package smex
      :ensure
      :init (smex-initialize)
      :bind ("M-x" . smex))))

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

; Per languages
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
