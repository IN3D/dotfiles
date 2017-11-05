;;; core.el -- Summary
;;; Commentary:
;;; Packages that are core to my editing experience.
;;; Code:
(require 'all-the-icons)

(use-package magit
  :ensure t)
(use-package evil
  :ensure t)
(use-package projectile
  :ensure t)
(use-package counsel
  :ensure t)
(use-package counsel-projectile
  :ensure t)
(use-package avy
  :ensure t)
(use-package ripgrep
  :ensure t)
(use-package projectile-ripgrep
  :ensure t)
(use-package powerline
  :ensure t)
(use-package multiple-cursors
  :ensure t)
(use-package wakatime-mode
  :ensure t)
(use-package rainbow-delimiters
  :ensure t
  :config
  (ejh/globalize #'rainbow-delimiters-mode))
(use-package swiper
  :ensure t
  :diminish " "
  :config
  (ejh/globalize #'ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "M-x") 'counsel-M-x))
(use-package company
  :ensure t
  :diminish " "
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase nil)
  (eval-after-load 'company
    '(push 'company-robe company-backends)))
(use-package general
  :ensure t
  :config
  ;; In retrospect having all the bindings here in `general' is not the best way
  ;; to go about this. In the future I should really consider moving all of this
  ;; into it's respective `use-package' declaration. Not hurting anything, just
  ;; poor form.
  (general-define-key
   :prefix "SPC"
   :states 'normal
   "SPC" '(counsel-M-x)
   "b"   '(nil :which-key "buffers")
   "bb"  '(ivy-switch-buffer :which-key "switch")
   "bk"  '(kill-buffer :which-key "kill")
   "g"   '(nil :which-key "git")
   "gb"  '(magit-blame :which-key "blame")
   "gs"  '(magit-status :which-key "status")
   "gm"  '(magit-dispatch-popup :which-key "menu")
   "j"   '(nil :which-key "jump")
   "jc"  '(avy-goto-char :which-key "to character")
   "jl"  '(avy-goto-line :which-key "to line")
   "jj"  '(avy-goto-line-below :which-key "to next line")
   "jk"  '(avy-goto-line-above :which-key "to previous line")
   "jw"  '(avy-goto-word-0 :which-key "to word")
   "p"   '(nil :which-key "project")
   "pf"  '(counsel-projectile-find-file :which-key "find-file")
   "s"   '(nil :which-key "search")
   "sa"  '(counsel-ag :which-key "ag")
   "sG"  '(counsel-grep :which-key "grep")
   "sr"  '(counsel-rg :which-key "rg")
   "ss"  '(swiper :which-key "swiper")
   "sg"  '(nil :which-key "git project")
   "sga" '(counsel-projectile-ag :which-key "ag")
   "sgr" '(ejh/counsel-projectile-rg :which-key "rg")
   "t"   '(nil :which-key "toggle")
   "td"  '(hungry-delete-mode :which-key "hungry delete")
   "tt"  '(counsel-load-theme :which-key "theme")
   "tn"  '(global-linum-mode :which-key "line numbers")
   "tf"  '(fci-mode :which-key "fill column")
   "tF"  '(auto-fill-mode :which-key "fill break")
   "x"   '(nil :which-key "text")
   "xf"  '(nil :which-key "format")
   "xf=" '(ejh/align-repeat-equal :which-key "equal")
   "xf:" '(ejh/align-repeat-colon :which-key "colon")
   "xf-" '(ejh/align-repeat-arrow :which-key "arrow")
   "xf>" '(ejh/align-repeat-fat-arrow :which-key "fat arrow")
   "xf<" '(ejh/align-repeat-back-arrow :which-key "back arrow")
   "xf," '(ejh/align-repeat-comma :which-key "comma")
   "xfr" '(align-regexp :which-key "regex")))
(use-package iedit
  :ensure t
  :config
  (general-define-key
   :prefix "C-c"
   ";" '(iedit-mode :which-key "iedit")))
(use-package fci-mode
  :ensure t)

(provide 'core.el)
;;; core.el ends here
