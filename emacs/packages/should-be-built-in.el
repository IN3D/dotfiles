;;; should-be-built-in.el -- Summary
;;; Commentary:
;;; These are files that seem so core that I feel like they should
;;; really just be a part of Emacs.
;;; Code:
(use-package fill-column-indicator
  :ensure t)
(use-package hungry-delete
  :ensure t)
(use-package highlight-numbers
  :ensure t
  :config
  (ejh/globalize #'highlight-numbers-mode))
(use-package which-key
  :ensure t
  :diminish " "
  :config
  (ejh/globalize #'which-key-mode))
(provide 'should-be-built-in)

;;; should-be-built-in.el ends here
