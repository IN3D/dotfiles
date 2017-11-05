;;; init.el -- Summary
;;; Commentary:
;;; Main Emacs file.
;;; Code:

;; Define where my config files live.
(defvar ejh/config-dir "~/.emacs.d")
(defvar ejh/package-dir (format "%s/packages" ejh/config-dir))
(defvar ejh/basics (format "%s/basics.el" ejh/config-dir))
(defvar ejh/functions (format "%s/functions.el" ejh/config-dir))
(defvar ejh/font-lock-enhancements (format "%s/font-lock-enhancements.el" ejh/config-dir))
(defvar ejh/packages-should-be-built-in
  (format "%s/should-be-built-in.el" ejh/package-dir))
(defvar ejh/packages-core (format "%s/core.el" ejh/package-dir))

;; Load config files
(load ejh/basics)
(load ejh/functions)
(load ejh/font-lock-enhancements)

;; Load packages
(load ejh/packages-should-be-built-in)
(load ejh/packages-core)

;;; A way I'd done this before, define a list of file names and load them in
;;; a loop, maybe do this instead?
;; (setq config-dir "~/.emacs.d/")
;; (setq files '("basics" "custom"))
;; (dolist (f files)
;;   (load-file (format "%s/%s.el" config-dir f)))

;; This is necessary for Macs, they get the colors wrong in powerline
(when (string-equal system-type "darwin")
    (setq ns-use-srgb-colorspace nil))
;; ========== packages ==========

;; ++ languages ++
(use-package clojure-mode
  :ensure t)
(use-package js2-mode
  :ensure t)
(use-package rjsx-mode
  :ensure t)
(use-package elixir-mode
  :ensure t)
(use-package typescript-mode
  :ensure t)
(use-package elm-mode
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package scala-mode
  :ensure t)
(use-package nim-mode
  :ensure t)
(use-package ess ; This contains 'R-mode' among others
  :ensure t)
(use-package enh-ruby-mode
  :ensure t)
(use-package coffee-mode
  :ensure t
  :config
  (setq coffee-tab-width 2))
(use-package haskell-mode
  :ensure t)
;; ++ languages ++

;; ++ for languages ++
(use-package paredit
  :ensure t
  :diminish "[內]") ; "inside"
(use-package tide
  :ensure t)

;; ========== Ruby Stuff ==========
(use-package robe
  :ensure t)
(use-package rspec-mode
  :ensure t)
(use-package rinari
  :diminish "[リ]" ; "Ri"
  :ensure t)
;; ========== /Ruby Stuff ==========
;; ++ for languages ++

;; ++ other stuff ++
(use-package stupid-indent-mode
  :ensure t)
(use-package all-the-icons
  :ensure t)
(use-package wttrin ; get the weather in Emacs!
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Detroit" "Novi"))
  (setq wttrin-default-accept-language '("Accept-Language" . "en-US"))
  (defun ejh/wttrin-default ()
    "Open `wttrin' without prompting, use the first city in `wttrin-default-cities'."
    (interactive)
    (wttrin-query (car wttrin-default-cities)))
  (defun ejh/wttrin-work ()
    "Open `wttrin' without prompting to get the weather at work."
    (interactive)
    (wttrin-query "Detroit"))
  (defun ejh/wttrin-home ()
    "Open `wttrin' without prompting to get the weather at home."
    (interactive)
    (wttrin-query "Novi")))
(use-package sx ; use StackExchange from Emacs!
  :config
  (bind-keys :prefix "C-c X"
             :prefix-map ejh/sx-map
             :prefix-docstring "StackExchange"
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))
(use-package system-packages
  :ensure t)
;; ++ other stuff ++

;; ========== packages ==========

;; ========== alist ==========
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|prodspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
;; ========== alist ==========


(defun ejh/custom-mode-icon ()
  "This isn't working as intended. Based on the default font, if there is
something defined on the unicode value that one of the given icon fonts wants to
use, then this function gets thrown all off. This might be useful in the future
so I'm leaving it in for now."
  (format "%s"
          (propertize (all-the-icons-icon-for-buffer
                       'help-echo (format "Major-mode: `%s`" major-mode)
                       'face `(:height 1.2 :family ,(all-the-icons-icon-family-for-buffer))))))

;; ========== hooks ==========
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; (setq mode-name (ejh/custom-mode-icon))
            (paredit-mode)
            (general-define-key
             :prefix "C-c"
             "m" '(nil :which-key "mode")
             "me" '(nil :which-key "evaluate")
             "mer" '(eval-region :which-key "region")
             "meb" '(eval-buffer :which-key "buffer"))))

(add-hook 'flycheck-mode-hook
          (lambda ()
            (require 'flycheck-vale)
            (setq flycheck-vale-modes
                  '(text-mode markdown-mode rst-mode org-mode))
            (flycheck-add-mode 'vale 'org-mode)))
         

(add-hook 'speedbar-mode-hook
          (lambda ()
            (speedbar-add-supported-extension ".rb")
            (speedbar-add-supported-extension ".ru")
            (speedbar-add-supported-extension ".erb")
            (speedbar-add-supported-extension ".rjs")
            (speedbar-add-supported-extension ".rhtml")
            (speedbar-add-supported-extension ".rake")))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(add-hook 'org-mode-hook
          (lambda ()
            (setq fill-column 80)
            (flyspell-mode +1)
            (flycheck-mode +1)
            (fci-mode +1)
            (auto-fill-mode +1)
            (flycheck-select-checker 'vale)))

(add-hook 'term-mode-hook
          (lambda ()
            ;; This prevents *really* slow rendering of some CLI programs
            (setq bidi-paragraph-direction 'left-to-right)))

;; NOTE: I think this could be `config:' on the `use-package' macro.
(add-hook 'rjsx-mode-hook
             (lambda ()
               (setq js2-strict-missing-semi-warning nil)
               (setq js2-basic-offset 2)
               (setq js2-strict-trailing-comma-warning nil)))

(add-hook 'typescript-mode-hook
          (lambda ()
            (electric-pair-local-mode)
            (setq typescript-indent-level 2)))

;; NOTE: I added this from somewhere about `ledger'. Not sure I want to keep
;; this.
(add-hook 'org-mode-hook
             (lambda ()
               (org-babel-do-load-languages
                'org-babel-load-languages
                '((R          . t)
                  (ditaa      . t)
                  (dot        . t)
                  (emacs-lisp . t)
                  (gnuplot    . t)
                  (haskell    . t)
                  (latex      . t)
                  (ledger     . t)
                  (ocaml      . t)
                  (octave     . t)
                  (python     . t)
                  (ruby       . t)
                  (screen     . nil)
                  (sh         . t)
                  (sql        . t)
                  (sqlite     . t)))))
;; ========== hooks ==========

;; ========== diminish ==========
(eval-after-load "Undo-Tree"
  '(diminish 'undo-tree-mode "[UT]"))
(eval-after-load "wakatime-mode"
  '(diminish 'wakatime-mode "[w]"))
(eval-after-load "ivy"
  '(diminish 'ivy-mode "[i]"))
(eval-after-load "Rinari"
  '(diminish 'rinari-minor-mode "[リ]")) ; shouldn't need this, set in `use-package'
(eval-after-load "ARev"
  '(diminish 'auto-revert-mode "[_]"))
(eval-after-load "RSpec"
  '(diminish 'rspec-mode "[S]"))
;; ========== diminish ==========
(provide 'init)
;;; init.el ends here
