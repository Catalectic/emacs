(require 'eclim)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode)
(global-eclim-mode)

(setq eldoc-idle-delay 0.2)

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(require 'helm-config)
(helm-adaptive-mode 1)
(helm-push-mark-mode 1)
(add-hook 'helm-mode-hook 'helm-toggle-truncate-line)

(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t)
(setq projectile-enable-caching t)

(add-hook 'web-mode-hook
          #'(lambda ()
              (setq yas-extra-mode ())
              (set (make-local-variable 'yas-extra-modes) '(html-mode))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

(setq highlight-symbol-on-navigation-p t
      highlight-symbol-idle-delay 0.1)

(provide 'config-completion)
