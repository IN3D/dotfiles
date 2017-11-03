;;; functions.el -- Summary
;;; Commentary:
;;; Functions I have defined that don't have anything to do with any
;;; particular major mode.
;;; Code:
(require 'projectile)
(require 'magit)
(require 'all-the-icons)

(defun ejh/globalize (mode)
  "Janky function to make global modes when one isn't provided.
MODE is the mode to rig a global mode for."
  (add-hook 'prog-mode-hook mode))

;; Jocked from http://emacswiki.org/emacs/AlignCommands
(defun ejh/align-repeat (start end regexp &optional justify-right after)
  "Repeat alignment with respect to the given regular expression.
START and END are where the selected region starts and ends, and are
provided to 'align-regexp'.  REGEXP is the character, or expression to be
aligned.  If JUSTIFY-RIGHT is non-nil justify to the right instead of the left.
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
  "This will create a new function to align text.
NAME is the name that will be appended to the created function.  For example
\"colon\" will produce the function \"ejh/align-repeat-colon\".  REGEXP is the
character or expression to be aligned.  If JUSTIFY-RIGHT is non-nil, justify to
the right instead of the left.  If DEFAULT-AFTER is non-nil, add whitespace to
the left instead of the right."
  (let ((new-func (intern (concat "ejh/align-repeat-" name))))
    `(defun ,new-func (start end switch)
       (interactive "r\nP")
       (let ((after (not (eq (if switch t nil) (if ,default-after t nil)))))
         (ejh/align-repeat start end ,regexp ,justify-right after)))))

(defun ejh/counsel-projectile-rg  (&optional options)
  "Ivy version of `projectile-ripgrep'.
This is hacked together based off the code of `counsel-projectile-ag'.
OPTIONS are CLI options that could be passed to ripgrep."
  (interactive)
  ;; initalize these variables if they aren't set.
  (defvar grep-find-ignored-files)
  (defvar grep-find-ignored-directories)
  (if (projectile-project-p)
      (let* ((options
        (if current-prefix-arg
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

(ejh/create-align-x "colon" ":" nil t)
(ejh/create-align-x "comma" "," nil t)
(ejh/create-align-x "equal" "=")
(ejh/create-align-x "arrow" "->")
(ejh/create-align-x "fat-arrow" "=>")

(provide 'functions)
;;; functions.el ends here
