(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " k" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; Uncouple C-i and TAB
(define-key input-decode-map (kbd "C-i") (kbd "H-C-i"))

(define-key my-keys-minor-mode-map (kbd "M-i")
  ' (lambda () (interactive)
    (kill-visual-line 0)))
(define-key my-keys-minor-mode-map (kbd "M-l") 'kill-word)
(define-key my-keys-minor-mode-map (kbd "M-j") 'backward-kill-word)
(define-key my-keys-minor-mode-map (kbd "M-k") 'kill-visual-line)
(define-key my-keys-minor-mode-map (kbd "M-p") 'backward-sexp)
(define-key my-keys-minor-mode-map (kbd "M-n") 'forward-sexp)
(define-key my-keys-minor-mode-map (kbd "M-f") 'forward-word)
(define-key my-keys-minor-mode-map (kbd "M-b") 'backward-word)
(define-key my-keys-minor-mode-map (kbd "M-u") 'eval-last-sexp)
(define-key my-keys-minor-mode-map (kbd "M-v") 'query-replace-regexp)
(define-key my-keys-minor-mode-map (kbd "M-x") 'helm-M-x)
(define-key my-keys-minor-mode-map (kbd "M-o") 'session-jump-to-last-change)
(define-key my-keys-minor-mode-map (kbd "M-q")
  '(lambda () (interactive)
     (save-excursion
       (indent-region (point-min) (point-max) nil))))
(define-key my-keys-minor-mode-map (kbd "M-C-q") 'fill-paragraph)


(define-key my-keys-minor-mode-map (kbd "M-z") 'fastnav-zap-up-to-char-forward)
(define-key my-keys-minor-mode-map (kbd "M-Z") 'fastnav-zap-up-to-char-backward)
(define-key my-keys-minor-mode-map (kbd "M-m") 'helm-imenu)
(define-key my-keys-minor-mode-map (kbd "M-/") 'ac-complete-imenu)

(define-key my-keys-minor-mode-map (kbd "M-C-s") 'kill-sentence)
(define-key my-keys-minor-mode-map (kbd "M-C-r") 'kill-word)

(define-key my-keys-minor-mode-map (kbd "C-a")
  '(lambda () (interactive)
     (beginning-of-line)
     (back-to-indentation)))
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
(define-key my-keys-minor-mode-map (kbd "C-o") 'ace-jump-mode)
(define-key my-keys-minor-mode-map (kbd "C-;") 'recenter-top-bottom)
(define-key my-keys-minor-mode-map (kbd "C-\'") 'flyspell-auto-correct-previous-word)
(define-key my-keys-minor-mode-map (kbd "C--") 'er/contract-region)
(define-key my-keys-minor-mode-map (kbd "C-=") 'er/expand-region)
(define-key my-keys-minor-mode-map (kbd "C-.") 'isearch-forward-symbol-at-point)

(define-key my-keys-minor-mode-map (kbd "C-c j") 'repeat-shell-command)
(define-key my-keys-minor-mode-map (kbd "C-x b") 'helm-mini)
(define-key my-keys-minor-mode-map (kbd "C-x C-b") 'helm-projectile)
(define-key my-keys-minor-mode-map (kbd "C-x f") 'helm-find-files)
(define-key my-keys-minor-mode-map (kbd "C-x m") 'browse-url-at-point)
(define-key my-keys-minor-mode-map (kbd "C-x C-f") 'projectile-find-file)

(define-key my-keys-minor-mode-map (kbd "C-h r") 'yari-helm)
(define-key my-keys-minor-mode-map (kbd "C-h C-f") 'find-function)
(define-key my-keys-minor-mode-map (kbd "C-h C-v") 'find-variable)
(define-key my-keys-minor-mode-map (kbd "C-h a") 'helm-apropos)
(define-key my-keys-minor-mode-map (kbd "C-h y") 'helm-c-yas-complete)
(define-key my-keys-minor-mode-map (kbd "C-h n") 'helm-descbinds)

(define-key my-keys-minor-mode-map (kbd "C-r") 'undo-tree-undo)
(define-key my-keys-minor-mode-map (kbd "M-r") 'undo-tree-visualize)
(define-key my-keys-minor-mode-map (kbd "<M-up>") 'move-lines-up)
(define-key my-keys-minor-mode-map (kbd "<M-down>") 'move-lines-down)
(define-key my-keys-minor-mode-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key my-keys-minor-mode-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(define-key my-keys-minor-mode-map (kbd "C-c d")
  '(lambda () (interactive)
     (set-window-dedicated-p (selected-window) 1)
     (message "Active window is now sticky")))

(define-key my-keys-minor-mode-map (kbd "C-c s") 'rspec-verify-single)
(define-key my-keys-minor-mode-map (kbd "C-c b") 'rspec-verify)
(define-key my-keys-minor-mode-map (kbd "C-c p") 'projectile-ag)

(define-key my-keys-minor-mode-map (kbd "<C-tab>")
  '(lambda () (interactive)
     (call-interactively (key-binding (kbd "M-TAB")))))

(define-key my-keys-minor-mode-map (kbd "<backtab>")
  '(lambda () (interactive)
     (call-interactively (key-binding (kbd "M-TAB")))))

(define-key ruby-mode-map (kbd "<f10>")
  '(lambda () (interactive)
     (ruby-load-file (buffer-name))))
(define-key my-keys-minor-mode-map (kbd "<f11>") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "<f6>") 'god-local-mode)
(define-key my-keys-minor-mode-map (kbd "<f12>") 'save-buffer)

(define-key my-keys-minor-mode-map (kbd "H-3") 'my-split-window)

(define-key ido-file-completion-map (kbd "C-l") 'ido-delete-backward-updir)

(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "`") 'helm-select-action)
(define-key helm-map (kbd "C-f") 'helm-select-action)

(define-key ruby-mode-map (kbd "C-c H-TAB") 'ruby-dev-start-repl)

(provide 'config-my-keys)


