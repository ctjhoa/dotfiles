;; eldoc

(req-package eldoc-mode
  :diminish eldoc-mode
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (eldoc-mode t)))))

;; electric pair

(req-package electric-pair-mode
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (electric-pair-mode t)))))

;; highlight parentheses

(req-package highlight-parentheses
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (highlight-parentheses-mode t)))))

;; rainbow deliminters

(req-package rainbow-delimiters
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (rainbow-delimiters-mode t)))))

;; rainbow

(req-package rainbow-mode
  :diminish rainbow-mode
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook (lambda()
				      (rainbow-mode t)))
    (add-hook 'css-mode-hook (lambda()
				      (rainbow-mode t)))
    (add-hook 'html-mode-hook (lambda()
				      (rainbow-mode t)))))
