;;; font-lock-enhancements.el -- Summary
;;; Commentary:
;;; Enhancements to default font-locks
;;; Code:
;; (defface ejh/class-name-bright
;;   '((t (:inherit dired-marked-face))))

;; "\\(?:^\\s *\\|[[{(,]\\s *\\|\\sw\\s +\\)\\(\\(\\sw\\|_\\)+:\\)[^:]"
;;   (1
;;    (progn
;;      (forward-char -1)
;;      font-lock-constant-face))

(let ((case-fold-search t))
  (font-lock-add-keywords
   'typescript-mode
   '(("\s?\\(@[A-Za-z]*\\)"                1 font-lock-warning-face)
     ("\\(\s\\|\\.\\)\\([A-Z][a-zA-Z]*\\)" 2 font-lock-type-face)
     ("\\(?:^\\s *\\|[[{(,]\\s *\\|\\sw\\s +\\)\\(\\(\\sw\\|_\\)+:\\)[^\\??:]"
      1 (progn
          (forward-char -1)
          font-lock-constant-face))))
  (font-lock-add-keywords
   'coffee-mode
   '(("\\(\s\\|\\.\\)\\([A-Z][a-zA-Z]*\\)" 2 dired-marked-face)))
  (font-lock-add-keywords
   'enh-ruby-mode
   '(("\s\\(sidekiq_options\\)" 1 font-lock-builtin-face))))

(provide 'font-lock-enhancements)
;;; font-lock-enhancements.el ends here
