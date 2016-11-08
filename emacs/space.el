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
                                       markdown
                                       csv
                                       (auto-completion :variables auto-completion-enable-snippets-in-popup t)
                                       javascript
                                       html
                                       elm
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
                                      haskell-mode
                                      go-mode
                                      js2-mode
                                      livescript-mode
                                      markdown-mode+
                                      scss-mode
                                      sass-mode
                                      typescript-mode
                                      yaml-mode
                                      web-mode
                                      (vue-mode :location (recipe
                                                           :fetcher github
                                                           :repo "codefalling/vue-mode"))
                                      ;; themes
                                      distinguished-theme
                                      majapahit-theme
                                      )
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t
   dotspacemacs-elpa-https nil))

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
   dotspacemacs-default-font '("PragmataPro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
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
  ;;(run-if-gui (add-hook 'prog-mode-hook #'nyan-mode))
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
   This function is called at the very end of Spacemacs initialization after
   layers configuration. You are free to put any user code."
  ;; Spaceline stuff
  (setq powerline-default-separator 'arrow-fade)
  (setq dotspacemacs-colorize-cursor-according-to-state nil)
  (spaceline-compile)

  ;; Default Indentation
  (setq c-basic-offset 2)
  (setq js-indent-level 2)
  (setq sgml-basic-offset 2)

  ;; (setq git-gutter+-modified-sign "=")
  ;; (setq git-gutter+-modified-sign "●") ;; maybe use this if I'm feeling fancy

  ;; === Rebindings ===
  ;; hybrid-mode
  (global-set-key (kbd "C-z") 'company-yasnippet) ;; much more useful than minimizing to tray
  (global-set-key (kbd "C-a") 'back-to-indentation)
  ;; normal-mode
  (define-key evil-normal-state-map (kbd "H") (kbd "^"))
  (define-key evil-normal-state-map (kbd "L") (kbd "$"))
  (define-key evil-normal-state-map (kbd "J") (kbd "G"))
  (define-key evil-normal-state-map (kbd "K") (kbd "gg"))
  (define-key evil-normal-state-map (kbd "U") (kbd "C-r"))
  ;; fast scrolling
  (define-key evil-normal-state-map (kbd "C-j") (kbd "15jzz"))
  (define-key evil-normal-state-map (kbd "C-k") (kbd "15kzz"))

  ;; Custom leader character sequences
  (evil-leader/set-key
    "tG" 'glasses-mode
    "te" 'emmet-mode
    "tRm" 'rainbow-mode
    "tRi" 'rainbow-identifiers-mode
    "xax" 'align-regexp)

  ;; Hooks
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'sass-mode-hook 'rainbow-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'prog-mode-hook #'editorconfig-mode)
  (add-hook 'js-mode-hook 'js-setup)
  (add-hook 'js2-mode-hook
            (defun js2-setup()
              (setq js2-strict-missing-semi-warning nil)))
  (add-hook 'vue-mode-hook
            (defun vue-setup()
              (use-package vue-mode)))

  ;; Globals settings
  (global-wakatime-mode)
  ;; (mac-auto-operator-composition-mode)

  ;; Global variable/config settings
  (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %")
  (setq glasses-separate-parentheses-p nil) ;; glasses
  (setq glasses-uncapitalize-p t) ;; glasses
  (setq sp-highlight-pair-overlay nil) ;; don't highlight inside of new pairs
  (setq org-todo-keywords ;; org-mode
        '((sequence "TODO(t)" "|" "DONE(d)")
          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
          (sequence "|" "CANCELED(c)")))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#20240E" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (ripgrep csv-mode php-mode zonokai-theme zenburn-theme zen-and-art-theme yaml-mode ws-butler window-numbering which-key web-mode web-beautify wakatime-mode vue-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme typescript-mode twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme quelpa purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox orgit organic-green-theme org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme nyan-mode noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme markdown-mode+ majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum livid-mode livescript-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gandalf-theme flyspell-correct-helm flycheck-pos-tip flycheck-clojure flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme emmet-mode elm-mode elisp-slime-nav editorconfig dumb-jump dracula-theme django-theme distinguished-theme diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-cli-path "/usr/local/bin/wakatime")
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
