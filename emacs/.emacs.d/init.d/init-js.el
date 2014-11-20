;; company tern

(req-package company-tern
  :require (company tern)
  :config
  (progn
    (add-hook 'js-mode-hook (lambda()
			      (add-to-list 'company-backends 'company-tern)))))

;; js2

(req-package js2-mode
  :mode "\\.js\\'"
  :interpreter "javascript")

(provide 'init-js)
