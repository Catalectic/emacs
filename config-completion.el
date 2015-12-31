(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)

(setq eldoc-idle-delay 0.2)

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(require 'helm)
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t)
(setq projectile-enable-caching t)

(yas-global-mode)

(add-hook 'web-mode-hook
          #'(lambda ()
              (setq yas-extra-mode ())
              (set (make-local-variable 'yas-extra-modes) '(html-mode))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Hack for performance in Helm, especially to switch buffers
(defun helm-highlight-buffers (x y) nil)

(provide 'config-completion)
