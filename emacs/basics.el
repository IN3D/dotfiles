;;; basics.el -- Summary
;;; Commentary:
;;; The most basics aspects of my Emacs config.
;;; Code:
(menu-bar-mode -1)

;; NOTE: not sure this is necessary? I think it's that there's no
;; `scroll-bar-mode' or `tool-bar-mode' in CLI mode.
(when (display-graphic-p)
  (tool-bar-mode -1)
  (toggle-scroll-bar -1))

(setq default-fill-column 80)       ; default to this instead of 70
(setq-default indent-tabs-mode nil) ; don't use tabs by default

;; (setq ejh/default-font "Source Code Pro")

;; (add-to-list 'default-frame-alist '(font . ejh/default-font))
;; (set-face-attribute 'default t :font ejh/default-font)

;; NOTE: not sure where this should be, it's here, and in `init.el'
;; Allow init.el to load faster, but stash the original value.
(defvar ejh/default-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold 100000000)

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("elpa"         . "http://elpa.gnu.org/packages/")
	("melpa"        . "http://melpa.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")
	("marmalade"    . "http://marmalade-repo.org/packages/"))
      package-archive-priorities
      '(("melpa"        . 10)  ; "I too, like to live dangerously"
        ("melpa-stable" . 5)   ; The safe bet
        ("elpa"         . 3)   ; The standard
        ("marmalade"    . 0))) ; Probably a bad sign if it gets to this

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(provide 'basics)
;;; basics.el ends here
