;;; init.el -- Summary
;;; Commentary:
;;; Main Emacs file.
;;; Code:

;; Define where my config files live.
(defvar ejh/config-dir "~/.emacs.d")
(defvar ejh/package-dir (format "%s/packages" ejh/config-dir))

(defun ejh/load-dir (directory files)
  "Takes a list of `FILES' in `DIRECTORY' and loads them in the provided order."
  (dolist (f files)
    (load-file (format "%s/%s.el" directory f))))


;; Load packages
(setq ejh/config-files '("basics"
                         "functions"
                         "font-lock-enhancements"))
(setq ejh/package-files '("should-be-built-in"
                          "core"))

(ejh/load-dir ejh/config-dir ejh/config-files)
(ejh/load-dir ejh/package-dir ejh/package-files)

;; This is necessary for OSX, it gets the colors wrong in powerline
(ejh/when-osx-do
 (setq ns-use-srgb-colorspace nil))
;; ========== packages ==========

;; ++ languages ++
(use-package clojure-mode
  :ensure t)
(use-package js2-mode
  :ensure t)
(use-package rjsx-mode
  :ensure t
  :config
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-strict-trailing-comma-warning nil)
  (setq js2-basic-offset 2))
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
;; TODO: add `yari-mode'
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


;; Not using this at the moment, meant to do something with `all-the-icons'
(defun ejh/custom-mode-icon ()
  "This isn't working as intended. Based on the default font, if there is
something defined on the unicode value that one of the given icon fonts wants to
use, then this function gets thrown all off. This might be useful in the future
so I'm leaving it in for now."
  (format "%s"
          (propertize (all-the-icons-icon-for-buffer
                       'help-echo (format "Major-mode: `%s`" major-mode)
                       'face `(:height 1.2 :family ,(all-the-icons-icon-family-for-buffer))))))

;; ========== bindings ==========
(progn ; Bindings for `package-menu'
  (define-key package-menu-mode-map (kbd "a") 'move-beginning-of-line)
  (define-key package-menu-mode-map (kbd "e") 'move-end-of-line)
  (define-key package-menu-mode-map (kbd "l") 'recenter-top-bottom)
  (define-key package-menu-mode-map (kbd "s") 'isearch-forward))
;; ========== bindings ==========

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
