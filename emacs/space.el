;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; set a variable so it's easy to refactor where everything lives
(setq config-dir "~/.config/emacs")
(setq space-config-dir (format "%s/spacemacs" config-dir))

(setq spacemacs-layers-file (format "%s/layers.el" space-config-dir))
(setq spacemacs-init-file (format "%s/init.el" space-config-dir))
(setq spacemacs-user-init-file (format "%s/user-init.el" space-config-dir))

(setq custom-file (format "%s/custom.el" config-dir))
(setq globals-file (format "%s/globals.el" config-dir))
(setq bindings-file (format "%s/bindings.el" config-dir))
(setq junk-drawer-file (format "%s/junk-drawer.el" config-dir))

(load spacemacs-layers-file)
(load spacemacs-init-file)
(load spacemacs-user-init-file)


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Load up my personal stuff
  (load globals-file)
  (load bindings-file)
  (load junk-drawer-file)
  (load custom-file))
