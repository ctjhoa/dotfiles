;; elpa

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
    (progn (let* ((ARCHIVES (if (null package-archive-contents)
			      (progn (package-refresh-contents)
				     package-archive-contents)
			      package-archive-contents))
		  (AVAIL (assoc package ARCHIVES)))
	     (if AVAIL
	       (package-install package)))
	   (require package))))

;; el-get

(require-package 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

;; req-package

(require-package 'req-package)

;; init.d

(req-package-force load-dir
  :init
  (progn
    (load-dir-one "~/.emacs.d/init.d")))

;; finish loading packages

(req-package-finish)

;; start emacs server

(require 'server)
(unless (server-running-p)
      (server-start))
