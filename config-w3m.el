(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))

 (setq browse-url-browser-function 'choose-browser
       browse-url-new-window-flag t
       browse-url-generic-program "~/firefox/firefox"
          w3m-new-session-in-background t)

(defun choose-browser (url &rest args)
  (interactive "sURL: ")
  (if (y-or-n-p "Use external browser? ")
      (browse-url-generic url)
    (w3m-browse-url-other-window url)))

(setq browse-url-browser-function 'choose-browser)

(add-hook 'w3m-mode-hook 'w3m-mode-bindings)

(defun w3m-mode-bindings ()
            (local-set-key (kbd "i") 'previous-line)
            (local-set-key (kbd "j") 'backward-char)
            (local-set-key (kbd "k") 'next-line)
            (local-set-key (kbd "l") 'forward-char)

            (local-set-key (kbd "h") 'w3m-db-history)
            (local-set-key (kbd "q") 'w3m-delete-buffer)
            (local-set-key (kbd "M-a") 'backward-sentence))

(provide 'config-w3m)
