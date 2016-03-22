(require 'auto-complete-config)
(ac-config-default)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(add-hook 'java-mode-hook
  (lambda ()
    (setq ac-sources '(ac-source-emacs-eclim))))

(setq ac-auto-start nil)

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


(provide 'config-completion)
