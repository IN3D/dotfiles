;;; init.el -- Summary
;;; Commentary:
;;; Main Emacs file.
;;; Code:

(require 'org) ; This is probably paranoid redundancy
(org-babel-load-file
 (expand-file-name (concat user-emacs-directory "config.org")))

(provide 'init)
;;; init.el ends here
