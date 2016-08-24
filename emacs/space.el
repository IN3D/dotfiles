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
                                       ruby-on-rails
                                       )

   dotspacemacs-additional-packages '(
                                      ;; extensions
                                      cider
                                      clojure-mode
                                      coffee-mode
                                      distinguished-theme
                                      editorconfig
                                      emmet-mode
                                      flycheck-clojure
                                      nyan-mode
                                      rainbow-identifiers
                                      rainbow-mode
                                      wakatime-mode
                                      ;; languages
                                      clojure-mode
                                      coffee-mode
                                      go-mode
                                      js2-mode
                                      livescript-mode
                                      markdown-mode+
                                      scss-mode
                                      sass-mode
                                      typescript-mode
                                      yaml-mode
                                      web-mode
                                      ;; themes
                                      distinguished-theme
                                      majapahit-theme
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
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-themes '(darktooth
                         niflheim
                         dracula
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
   dotspacemacs-default-font '("Fira Code"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
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
  (defun run-if-gui (f)
    "Runs the given function if the current session is a GUI"
    (if (display-graphic-p)
        (progn f)))

  (run-if-gui (setq ns-use-srgb-colorspace nil))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
   This function is called at the very end of Spacemacs initialization after
   layers configuration. You are free to put any user code."
  (setq powerline-default-separator 'arrow-fade)
  (setq c-basic-offset 2)
  (setq js-indent-level 2)
  (setq sgml-basic-offset 2)

  (setq glasses-separate-parentheses-p nil)
  (setq glasses-uncapitalize-p t)
  (setq sp-highlight-pair-overlay nil)

  (evil-leader/set-key
    "tG" 'glasses-mode
    "te" 'emmet-mode
    "tRm" 'rainbow-mode
    "tRi" 'rainbow-identifiers-mode
    "xax" 'align-regexp)

  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'sass-mode-hook 'rainbow-mode)

  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'prog-mode-hook #'editorconfig-mode)
  (add-hook 'js-mode-hook 'js-setup)
  (run-if-gui (add-hook 'prog-mode-hook #'nyan-mode))
  (add-hook 'js2-mode-hook
            (defun js2-setup()
              (setq js2-strict-missing-semi-warning nil)))
  (global-wakatime-mode)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
          (sequence "|" "CANCELED(c)")))
  (spaceline-compile)
  (mac-auto-operator-composition-mode)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
