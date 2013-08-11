(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " k" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

; Uncouple C-i and TAB
(define-key input-decode-map (kbd "C-i") (kbd "H-C-i"))

(define-key my-keys-minor-mode-map (kbd "M-i") '(lambda () 
  (interactive) (kill-visual-line 0)))
(define-key my-keys-minor-mode-map (kbd "M-l") 'forward-word)
(define-key my-keys-minor-mode-map (kbd "M-j") 'backward-word)
(define-key my-keys-minor-mode-map (kbd "M-k") 'kill-visual-line)
(define-key my-keys-minor-mode-map (kbd "M-o") '(lambda () (interactive) (other-window -1)))
(define-key my-keys-minor-mode-map (kbd "M-p") 'smart-symbol-go-backward)
(define-key my-keys-minor-mode-map (kbd "M-n") 'smart-symbol-go-forward)
(define-key my-keys-minor-mode-map (kbd "M-f") 'backward-sexp)
(define-key my-keys-minor-mode-map (kbd "M-b") 'forward-sexp)
(define-key my-keys-minor-mode-map (kbd "M-u") 'eval-last-sexp)
(define-key my-keys-minor-mode-map (kbd "M-v") 'query-replace-regexp)
(define-key my-keys-minor-mode-map (kbd "M-x") 'helm-M-x)
(define-key my-keys-minor-mode-map (kbd "M-o") 'session-jump-to-last-change)

(define-key my-keys-minor-mode-map (kbd "M-C-s") 'kill-sentence) 
(define-key my-keys-minor-mode-map (kbd "M-C-r") 'kill-word) 

(define-key my-keys-minor-mode-map (kbd "C-f") 'ido-find-file)
(define-key my-keys-minor-mode-map (kbd "C-v") ' scroll-up-command)
(define-key my-keys-minor-mode-map (kbd "C-b") 'scroll-down-command)
(define-key my-keys-minor-mode-map (kbd "C-t") 'ido-switch-buffer)
(define-key my-keys-minor-mode-map (kbd "C-n") 'elscreen-next)
(define-key my-keys-minor-mode-map (kbd "C-p") 'elscreen-previous)
(define-key my-keys-minor-mode-map (kbd "C-j") 'backward-char)
(define-key my-keys-minor-mode-map (kbd "C-l") 'forward-char)
(define-key my-keys-minor-mode-map (kbd "H-C-i") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "C-k") 'next-line)
(define-key my-keys-minor-mode-map (kbd "C-o") 'session-jump-to-last-change)
(define-key my-keys-minor-mode-map (kbd "C-;") 'recenter-top-bottom)
(define-key my-keys-minor-mode-map (kbd "C-\'") 'flyspell-auto-correct-previous-word)

(define-key my-keys-minor-mode-map (kbd "C-x b") 'helm-mini) 
(define-key my-keys-minor-mode-map (kbd "C-x C-f") 'helm-find-files) 
(define-key my-keys-minor-mode-map (kbd "C-x m") 'browse-url-at-point)
(define-key my-keys-minor-mode-map (kbd "C-x f") 'find-file-in-repository)

(define-key my-keys-minor-mode-map (kbd "C-h r") 'yari-helm)
(define-key my-keys-minor-mode-map (kbd "C-h f") 'describe-function) 
(define-key my-keys-minor-mode-map (kbd "C-h v") 'describe-variable)
(define-key my-keys-minor-mode-map (kbd "C-h C-f") 'find-function) 
(define-key my-keys-minor-mode-map (kbd "C-h C-v") 'find-variable)
(define-key my-keys-minor-mode-map (kbd "C-h a") 'helm-apropos)

(define-key my-keys-minor-mode-map (kbd "C-r") 'undo-tree-undo)
(define-key my-keys-minor-mode-map (kbd "M-r") 'undo-tree-redo)

(global-set-key (kbd "<M-up>") 'move-lines-up)
(global-set-key (kbd "<M-down>") 'move-lines-down)

(define-key my-keys-minor-mode-map (kbd "<C-tab>") '(lambda ()
                                   (interactive)
                                   (call-interactively (key-binding (kbd "M-TAB")))))

(define-key my-keys-minor-mode-map (kbd "<backtab>") '(lambda ()
                                   (interactive)
                                   (call-interactively (key-binding (kbd "M-TAB")))))

(define-key my-keys-minor-mode-map (kbd "<f11>") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "<f6>") 'elscreen-toggle)

(define-key my-keys-minor-mode-map (kbd "<f12>") 'save-buffer)

(define-key my-keys-minor-mode-map (kbd "H-3") 'my-split-window) 

(provide 'config-my-keys)
