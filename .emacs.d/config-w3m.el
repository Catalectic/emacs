 (setq browse-url-browser-function 'w3m-browse-url-other-window
          browse-url-new-window-flag t
          w3m-new-session-in-background t)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 (global-set-key "\C-xm" 'browse-url-at-point)

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))
 
