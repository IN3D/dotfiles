;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
   You should not put any user code in this function besides modifying the
   variable values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers '(
                                       auto-completion
                                       emacs-lisp
                                       git
                                       spell-checking
                                       syntax-checking
                                       themes-megapack
                                       version-control
                                       )

   dotspacemacs-additional-packages '(
                                      cider
                                      clojure-mode
                                      coffee-mode
                                      distinguished-theme
                                      editorconfig
                                      emmet-mode
                                      flycheck-clojure
                                      go-mode
                                      js2-mode
                                      livescript-mode
                                      nyan-mode
                                      majapahit-theme
                                      multiple-cursors
                                      markdown-mode+
                                      rainbow-identifiers
                                      rainbow-mode
                                      sass-mode
                                      scala-mode2
                                      yaml-mode
                                      )
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
   This function is called at the very startup of Spacemacs initialization
   before layers configuration.
   You should not put any user code in there besides modifying the variable
   values."
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-themes '(niflheim
                         darktooth
                         gruvbox
                         majapahit-dark
                         spacemacs-dark
                         solarized-dark
                         majapahit-light
                         spacemacs-light
                         solarized-light
                         leuven
                         monokai
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
   It is called immediately after `dotspacemacs/init'.  You are free to put any
   user code."
  (defun js-setup ()
    (flycheck-mode t)
    (flycheck-set-checker-executable 'javascript-standard "/home/eric/.nvm/versions/node/v6.2.0/bin/standard"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
   This function is called at the very end of Spacemacs initialization after
   layers configuration. You are free to put any user code."
  (setq powerline-default-separator 'nil)
  (setq dotspacemacs-mode-line-unicode-symbols 'nil)
  (setq c-basic-offset 8)
  (setq js-indent-level 2)
  (setq sgml-basic-offset 2)

  (setq glasses-separate-parentheses-p nil)
  (setq glasses-uncapitalize-p t)
  (setq sp-highlight-pair-overlay nil)
  (evil-leader/set-key
    "tG" 'glasses-mode
    "te" 'emmet-mode
    "tRm" 'rainbow-mode
    "tRi" 'rainbow-identifiers-mode)

  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'sass-mode-hook 'rainbow-mode)

  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'prog-mode-hook #'nyan-mode)
  (add-hook 'prog-mode-hook #'editorconfig-mode)
  (add-hook 'js-mode-hook 'js-setup)
  (add-hook 'js2-mode-hook
            (defun js2-setup()
              'js-setup
              (setq js2-strict-missing-semi-warning nil)))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
