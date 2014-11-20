;; font

(set-default-font "Monaco-9")

;; gui

(if (display-graphic-p)
  (progn
    (menu-bar-mode -1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1)))

(progn
  (linum-mode t)
  (line-number-mode t)
  (column-number-mode t)
  (toggle-truncate-lines t))

;; tweaks

(setq inhibit-startup-echo-area-message t
      inhibit-startup-message t
      inhibit-startup-screen t
      inhibit-default-init t
      mouse-yank-at-point t
      scroll-step 1
      scroll-conservatively 10000
      require-final-newline t
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; hooks

(add-hook 'before-save-hook 'whitespace-cleanup)

;; colorscheme

(req-package sublime-themes
  :config
  (progn
    (load-theme 'granger :no-confirm)))

;; smart mode line

(req-package smart-mode-line
  :pre-load (setq sml/no-confirm-load-theme t)
  :init
  (progn
    (sml/setup))
  :config
  (progn
    (sml/apply-theme 'respectful)
    (set-face-attribute 'mode-line nil
			:foreground "gray40"
			:background "black"
			:box '(:color "black" :line-width 6))
    (set-face-attribute 'mode-line-inactive nil
			:foreground "gray15"
			:background "black"
			:box '(:color "black" :line-width 6))))

;; hl line

(req-package hl-line
  :init
  (progn
    (global-hl-line-mode t))
  :config
  (progn
    (set-face-background hl-line-face "gray5")
    (set-face-foreground hl-line-face nil)))

;; highlight numbers

(req-package highlight-numbers
  :diminish highlight-numbers-mode
  :init
  (progn
    (highlight-numbers-mode t)))

;; highlight quoted

(req-package highlight-quoted
  :diminish highlight-quoted-mode
  :init
  (progn
    (highlight-quoted-mode t)))

(provide 'init-look-and-feel)
