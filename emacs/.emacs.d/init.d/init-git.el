;; git gutter

;(req-package git-gutter-fringe+
;  :diminish git-gutter+-mode
;  :commands global-git-gutter+-mode
;  :idle (global-git-gutter+-mode)
;  :config
;  (progn
;    (git-gutter-fr+-minimal)))

;; magit

(req-package magit
  :require evil
  :diminish magit-auto-revert-mode
  :commands (magit-status
	     magit-diff
	     magit-log)
  :config
  (progn
    (setq magit-status-buffer-switch-function 'switch-to-buffer)
    (evil-add-hjkl-bindings magit-status-mode-map 'emacs
      ":" 'evil-ex
      "K" 'magit-discard-item
      "l" 'magit-key-mode-popup-logging
      "h" 'magit-diff-toggle-refine-hunk)))

;; magit blame

(req-package magit-blame
  :require magit
  :commands magit-blame-mode)

(provide 'init-git)
