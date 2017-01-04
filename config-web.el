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

(setq shr-blocked-images nil
      shr-use-colors t
      shr-use-fonts t)

(eval-after-load "eww"
  '(progn (define-key eww-mode-map (kbd "o") 'eww)
          (define-key eww-mode-map (kbd "H") 'eww-back-url)
          (define-key eww-mode-map (kbd "L") 'eww-forward-url)
          (define-key eww-mode-map (kbd "y") 'eww-copy-page-url)
          (define-key eww-mode-map "f" 'eww-lnum-follow)
          (define-key eww-mode-map "F" 'eww-lnum-universal)))

(setq eww-search-prefix "https://google.com/search?q=")

(provide 'config-web)
