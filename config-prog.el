(add-hook 'after-init-hook #'global-flycheck-mode)

; Keybindings
(define-key prog-mode-map (kbd "M-a") 'beginning-of-defun)
(define-key prog-mode-map (kbd "M-e") 'end-of-defun)
(define-key prog-mode-map (kbd "RET") 'newline-and-indent)

(require 'eclimd)

(require 'smartparens-config)
(smartparens-global-mode)
(show-smartparens-global-mode)
(show-paren-mode -1)
(setq sp-ignore-modes-list '(minibuffer-inactive-mode erc-mode w3m-mode))

(add-hook 'lisp-mode-hook
	   (lambda ()
	     (set (make-local-variable 'lisp-indent-function)
		  'common-lisp-indent-function)))

; Web-mode

(setq rails-auto-mode-alist nil)

(require 'web-mode)
; Hack to get syntax highlight to work automatically
(add-hook 'web-mode-hook (lambda () (font-lock-mode 0)))

(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" .web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(projectile-global-mode)
(setq projectile-require-project-root nil)

(provide 'config-prog)
