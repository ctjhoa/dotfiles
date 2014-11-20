;; company

(req-package company
  :require yasnippet
  :commands global-company-mode
  :idle (global-company-mode)
  :config
  (progn
    (setq company-transformers '(company-sort-by-occurrence)
	  company-require-match t)
    (add-to-list 'company-backends 'company-yasnippet)
    (define-key company-mode-map (kbd "C-n") 'company-select-next)
    (define-key company-mode-map (kbd "C-p") 'company-select-previous)
    (define-key company-mode-map (kbd "C-d") 'company-show-doc-buffer)
    (define-key company-mode-map (kbd "<tab>") 'company-complete)))

(provide 'init-company)
