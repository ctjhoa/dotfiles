(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(load-theme 'wombat)

(progn
    (menu-bar-mode -1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1))

(setq inhibit-startup-screen t)

(require 'use-package)

(use-package eldoc
  :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))

; ensure packages
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

(use-package highlight-parentheses
  :ensure
  :init
  (progn 
    (defun turn-on-highlight-parentheses-mode ()
      (highlight-parentheses-mode t))
    (add-hook 'emacs-lisp-mode-hook 'turn-on-highlight-parentheses-mode)))
  
(use-package rainbow-delimiters
  :ensure
  :init
  (progn 
    (defun turn-on-rainbow-delimiters-mode ()
      (rainbow-delimiters-mode t))
    (add-hook 'emacs-lisp-mode-hook 'turn-on-rainbow-delimiters-mode)))

(use-package company
  :ensure
  :init (global-company-mode t)
  :config
  (progn
    (define-key company-mode-map (kbd "C-n") 'company-select-next)
    (define-key company-mode-map (kbd "C-p") 'company-select-previous))


(use-package evil
  :ensure
  :pre-load
  (setq evil-want-C-u-scroll t
	evil-want-C-i-jump t)
  :config
  (progn 
    (evil-mode t)
    (define-key evil-ex-map (kbd "e ") 'ido-find-file)
    (define-key evil-ex-map (kbd "b ") 'ido-switch-buffer)
))
