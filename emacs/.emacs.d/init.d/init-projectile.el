;; projectile

(req-package projectile
  :diminish (projectile-mode)
  :commands (projectile-global-mode
	     projectile-find-file
	     projectile-switch-project
	     projectile-switch-to-buffer)
  :init
  (progn
    (projectile-global-mode t)
    (define-key evil-ex-map "pf " 'projectile-find-file)
    (define-key evil-ex-map "ps " 'projectile-switch-project)
    (define-key evil-ex-map "pa " 'projectile-ag)
    (define-key evil-ex-map "pb " 'projectile-switch-to-buffer)
    (define-key evil-ex-map "po " 'projectile-find-other-file)))

(provide 'init-projectile)
