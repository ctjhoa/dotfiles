;; ido

(req-package ido
  :require evil
  :commands (ido-find-file
	     ido-switch-buffer)
  :init
  (progn
    (ido-mode t)
    (ido-everywhere t)
    (setq ido-enable-flex-matching t
	  ido-create-new-buffer 'always
	  ido-default-buffer-method 'selected-window))
  :config
  (progn
    (define-key evil-ex-map "e " 'ido-find-file)
    (define-key evil-ex-map "b " 'ido-switch-buffer)))

;; ido vertical mode

(req-package ido-vertical-mode
  :require ido
  :init
  (progn
    (ido-vertical-mode t)))

;; ido ubiquitous

(req-package ido-ubiquitous
  :require ido
  :init
  (progn
    (ido-ubiquitous-mode t)))

;; ido hacks

(req-package ido-hacks
  :require ido
  :init
  (progn
    (ido-hacks-mode t)))

;; smex

(req-package smex
  :require ido
  :bind ("M-x" . smex))

(provide 'init-ido)
