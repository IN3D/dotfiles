(package-initialize)

;; ==================== basics ====================
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
'(fill-column 80)
(setq-default indent-tabs-mode nil) ;; never use tabs by default

(setq package-archives
'(("gnu"          . "http://elpa.gnu.org/packages/")
  ("melpa"        . "http://melpa.org/packages/")
  ("melpa-stable" . "http://stable.melpa.org/packages/")
  ("marmalade"    . "http://marmalade-repo.org/packages/")))
;; ==================== basics ====================


;; ==================== functions ====================
(defun ejh/globalize (mode)
  "Jankey function to make a global function for minor modes that
don't provide one by default."
  (add-hook 'prog-mode-hook mode))

;; For Rails
(defun ejh/wtf-are-the-routes ()
    "Create a temporary buffer with the output of the current Rails
projects routes."
  (interactive)
  (when (and (buffer-modified-p)
             (y-or-n-p (format "Save file %s?" (buffer-file-name))))
    (save-buffer))
  (with-output-to-temp-buffer "*wtf-are-the-routes*"
    (shell-command "rake routes")
    (pop-to-buffer "*wtf-are-the-routes*")))

(defun ejh/align-repeat (start end regexp &optional justify-right after)
  "Repeat alignment with respect to the given regular expression.
If JUSTIFY-RIGHT is not-nil justify to the right instead of the left.
If AFTER is non-nil, add whitespace to the left instead of the right."
  (interactive "r\nsAlign regexp: ")
  (let* ((ws-regexp (if (string-empty-p regexp)
      "\\(\\s-+\\)"
          "\\(\\s-*\\)"))
   (complete-regexp (if after
            (concat regexp ws-regexp)
          (concat ws-regexp regexp)))
   (group (if justify-right -1 1)))
    (message "%S" complete-regexp)
    (align-regexp start end complete-regexp group 1 t)))

(defmacro ejh/create-align-x (name regexp &optional justify-right default-after)
  (let ((new-func (intern (concat "ejh/align-repeat-" name))))
    `(defun ,new-func (start end switch)
       (interactive "r\nP")
       (let ((after (not (eq (if switch t nil) (if ,default-after t nil)))))
   (ejh/align-repeat start end ,regexp ,justify-right after)))))

(ejh/create-align-x "colon" ":" nil t)
(ejh/create-align-x "equal" "=")
(ejh/create-align-x "arrow" "->")
(ejh/create-align-x "fat-arrow" "=>")

(defun ejh/counsel-projectile-rg  (&optional options)
  "Ivy version of `projectile-ripgrep'.
That I've hacked based off of `counsel-projectile-ag'."
  (interactive)
  (if (projectile-project-p)
      (let* ((options
        (if current-prefix-ag
      (read-string "options: ")
    options))
       (ignored
        (unless (eq (projectile-projects-vcs) 'git)
    ;; rg supports git ignored files
    (append
     (cl-union (projectile-ignored-files-rel)
         grep-find-ignored-files)
     (cl-union (projectile-ignored-directories-rel)
         grep-find-ignored-directories))))
       (options
        (concat options " "
          (mapconcat (lambda (i)
           (concat "--ignore " i))
         ignored
         " "))))
  (counsel-rg nil
        (projectile-project-root)
        options
        (projectile-prepend-project-name "rg")))
    (user-error "You're not in a project")))

;; TODO: finish writing this.
(defun ejh/counsel-projectile-git-grep (&optional options)
  "Projectile version of `counsel-git-grep'."
  (interactive)
  (if (projectile-project-p)
      (message "You're in a project")
    (user-error "You're not in a project")))

(defun ejh/setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-h1-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company
  (company-mode +1))

;; ==================== functions ====================

;; ==================== packages ====================

;; ++ themes ++
(use-package blackboard-theme :ensure t :pin melpa)
(use-package grandshell-theme :ensure t :pin melpa)
(use-package badwolf-theme    :ensure t :pin melpa)
(use-package gruvbox-theme    :ensure t :pin melpa)
(use-package darktooth-theme  :ensure t :pin melpa)
(use-package moe-theme        :ensure t :pin melpa)

;; ++ themes ++

;; ++ languages ++
(use-package clojure-mode    :ensure t :pin melpa)
(use-package js2-mode        :ensure t :pin melpa)
(use-package typescript-mode :ensure t :pin melpa)
(use-package elm-mode        :ensure t :pin melpa)
(use-package web-mode        :ensure t :pin melpa)
(use-package rust-mode       :ensure t :pin melpa)
(use-package scala-mode      :ensure t :pin melpa)
(use-package typescript-mode :ensure t :pin melpa)
(use-package tide            :ensure t :pin melpa)
(use-package nim-mode        :ensure t :pin melpa)
;; ++ languages ++


;; ++ for languages ++
;; Packages, mostly minor modes that compliment various major modes.
(use-package paredit    :ensure t :pin melpa :diminish " 内")
(use-package emmet-mode :ensure t :pin melpa)
;; ++ for langauges ++


;; ++ should be built in ++
;; These are packages that feel so basic I would expect that maybe by
;; the time Emacs 26 rolls around they would be part of the standard
;; distribution. Basically, these are things I can't imagine Emacs
;; without. These tend to be smaller packages.
(use-package fill-column-indicator :ensure t :pin melpa)
(use-package hungry-delete         :ensure t :pin melpa)

(use-package highlight-numbers
  :ensure t
  :config (ejh/globalize #'highlight-numbers-mode))

(use-package which-key
  :ensure t
  :pin melpa
  :diminish " ?"
  :config (ejh/globalize #'which-key-mode))

;; ++ should be built in ++


;; ++ core ++
;; Packages that feel very core to my editing experience, but aren't
;; so core that I think Emacs ought to ship with them by default.
(use-package magit              :ensure t :pin melpa)
(use-package projectile         :ensure t :pin melpa)
(use-package counsel            :ensure t :pin melpa)
(use-package counsel-projectile :ensure t :pin melpa)
(use-package avy                :ensure t :pin melpa)
(use-package google-translate   :ensure t :pin melpa)
(use-package swoop              :ensure t :pin melpa)
(use-package ripgrep            :ensure t :pin melpa)
(use-package projectile-ripgrep :ensure t :pin melpa)
(use-package multiple-cursors   :ensure t :pin melpa)

(use-package rainbow-delimiters
  :ensure t
  :pin melpa
  :config (ejh/globalize #'rainbow-delimiters-mode))

(use-package swiper
  :ensure t
  :pin melpa
  :config (ejh/globalize #'ivy-mode))

(use-package company
  :ensure t
  :diminish " C"
  :pin melpa
  :config (global-company-mode))

(use-package general
  :ensure t
  :pin melpa
  :config
  (general-define-key
   :prefix "s-SPC"
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
   "jn"  '(avy-goto-line-below :which-key "to next line")
   "jp"  '(avy-goto-line-above :which-key "to previous line")
   "jw"  '(avy-goto-word-0 :which-key "to word")
   "s"   '(nil :which-key "search")
   "sa"  '(counsel-ag :which-key "ag")
   "sG"  '(counsel-grep :which-key "grep")
   "sr"  '(counsel-rg :which-key "rg")
   "ss"  '(swoop :which-key "swoop")
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
   "xf=" '(ejh/align-repeat-equal "equal")
   "xf:" '(ejh/align-repeat-colon "colon")
   "xf-" '(ejh/align-repeat-arrow "arrow")
   "xf>" '(ejh/align-repeat-fat-arrow "fat arrow")
   "xfr" '(align-regexp "regex")))
;; ++ core ++

;; ==================== packages ====================


;; ==================== hooks ====================
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode)
            (general-define-key
             :prefix "s-,"
             "e" '(nil :which-key "evaluate")
             "er" '(eval-region :which-key "region")
             "eb" '(eval-buffer :which-key "buffer"))))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; ==================== hooks ====================
