;; init.el -- Summary
;; Commentary:
;;; Main Emacs file.
;;; Code:

(require 'org)
(org-babel-load-file
 (expand-file-name (concat user-emacs-directory "config.org")))

;; set fonts
(set-face-attribute 'default nil :family "Hack" :height 120)
(add-to-list 'default-frame-alist '(font . "Hack-12"))

(load-theme 'wombat)

(provide 'init)
;;; init.el ends here
