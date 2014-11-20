(require 'package)

;; bootstrap utils

(defconst my-custom-file "~/.emacs.d/custom.el")

(setq custom-file my-custom-file)
(load my-custom-file t)
(setq make-backup-files nil)
;; (setq debug-on-error t)

;; load extensions
(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
