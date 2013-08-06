 (setq browse-url-browser-function 'w3m-browse-url-other-window
          browse-url-new-window-flag t
          w3m-new-session-in-background t)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))

(add-hook 'w3m-mode-hook 'w3m-mode-bindings)

(defun w3m-mode-bindings ()
            (local-set-key (kbd "i") 'previous-line)
            (local-set-key (kbd "j") 'backward-char)
            (local-set-key (kbd "k") 'next-line)
            (local-set-key (kbd "l") 'forward-char)

            (local-set-key (kbd "h") 'w3m-db-history)
            (local-set-key (kbd "q") 'w3m-delete-buffer)
            (local-set-key (kbd "M-a") 'backward-sentence))
