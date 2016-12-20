;; My personal bindings

;; Emacs mode
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "s-x") 'kill-buffer)

;; Normal mode mappings
(define-key evil-normal-state-map (kbd "H") (kbd "^"))
(define-key evil-normal-state-map (kbd "L") (kbd "$"))
(define-key evil-normal-state-map (kbd "J") (kbd "G"))
(define-key evil-normal-state-map (kbd "K") (kbd "gg"))
(define-key evil-normal-state-map (kbd "U") (kbd "C-r"))

;; Jump around faster
(define-key evil-normal-state-map (kbd "C-j") (kbd "15jzz"))
(define-key evil-normal-state-map (kbd "C-k") (kbd "15kzz"))

;; Leader mappings
(evil-leader/set-key
  "jl" 'avy-goto-line
  "jk" 'avy-goto-line-above ;; emulate easy-motion
  "jj" 'avy-goto-line-below ;; emulate easy-motion
  "tf" 'fci-mode)
