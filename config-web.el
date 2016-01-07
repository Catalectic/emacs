(defun web-browse-url-other-window (url &optional newwin)
  (if (one-window-p) (split-window))
  (other-window 1)
  (eww-browse-url url newwin))

(setq browse-url-browser-function 'choose-browser
      browse-url-new-window-flag t
      browse-url-generic-program "firefox")

(defun choose-browser (url &rest args)
  (interactive "sURL: ")
  (if (y-or-n-p "Use external browser? ")
      (browse-url-generic url)
    (web-browse-url-other-window url)))

(setq browse-url-browser-function 'choose-browser)

(setq shr-blocked-images ".*"
      shr-use-colors nil
      shr-use-fonts nil)

(provide 'config-web)
