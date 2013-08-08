(require 'smartparens-config)
(smartparens-global-mode)
(show-smartparens-global-mode)
(setq sp-ignore-modes-list '(minibuffer-inactive-mode erc-mode w3m-mode))

(add-hook 'lisp-mode-hook
	   (lambda ()
	     (set (make-local-variable 'lisp-indent-function)
		  'common-lisp-indent-function)))
