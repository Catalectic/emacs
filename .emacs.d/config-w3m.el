 (setq browse-url-browser-function 'w3m-browse-url
          browse-url-new-window-flag t)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 (global-set-key "\C-xm" 'browse-url-at-point)
