;; evil

(req-package evil
  :require undo-tree
  :pre-load
  (setq evil-want-C-u-scroll t
	evil-want-C-w-in-emacs-state t
	evil-auto-indent t
	evil-move-cursor-back t
	evil-search-module 'evil-search)
  :config
  (progn
    (evil-mode t)
    (define-key evil-normal-state-map "Y" (kbd "y$"))
    ;; ESC exit from anywhere
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)
    (global-set-key [escape] 'keyboard-quit)))

;; evil visualstar

(req-package evil-visualstar
  :require evil)

;; evil jumper

(req-package evil-jumper
  :require evil)

;; evil matchit

(req-package evil-matchit
  :require evil)

;; evil surrond

(req-package evil-surround
  :require evil
  :commands global-evil-surround-mode
  :idle (global-evil-surround-mode))

(provide 'init-evil)
