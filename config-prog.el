(require 'web-mode)
; Hack to get syntax highlight to work automatically
(add-hook 'web-mode-hook (lambda () (font-lock-mode 0)))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" .web-mode)) 
(add-to-list 'auto-mode-alist '("\\.erb\\'" .web-mode)) 
(add-to-list 'auto-mode-alist '("\\.mustache\\'" .web-mode)) 
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" .web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)) 

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq web-mode-map
  (let ((keymap (make-sparse-keymap)))

    (define-key keymap (kbd "C-;") 'web-mode-comment-or-uncomment)
    (define-key keymap (kbd "M-;") 'web-mode-comment-or-uncomment)

    (define-key keymap (kbd "C-c C-d")   'web-mode-errors-show)
    (define-key keymap (kbd "C-c C-f")   'web-mode-fold-or-unfold)
    (define-key keymap (kbd "C-c C-i")   'web-mode-buffer-indent)
    (define-key keymap (kbd "C-c C-m")   'web-mode-mark-and-expand)
    (define-key keymap (kbd "C-c C-n")   'web-mode-tag-match)
    (define-key keymap (kbd "C-c C-r")   'web-mode-entities-replace)
    (define-key keymap (kbd "C-c C-s")   'web-mode-snippet-insert)
    (define-key keymap (kbd "C-c C-w")   'web-mode-whitespaces-show)

    (define-key keymap (kbd "C-c /")     'web-mode-element-close)
    (define-key keymap (kbd "C-c <")     'web-mode-element-beginning)
    (define-key keymap (kbd "C-c >")     'web-mode-element-end)

    (define-key keymap (kbd "C-c b b") 'web-mode-block-beginning)
    (define-key keymap (kbd "C-c b e") 'web-mode-block-end)
    (define-key keymap (kbd "C-c b n") 'web-mode-block-next)
    (define-key keymap (kbd "C-c b p") 'web-mode-block-previous)
    (define-key keymap (kbd "C-c e b") 'web-mode-element-beginning)
    (define-key keymap (kbd "C-c e d") 'web-mode-element-delete)
    (define-key keymap (kbd "C-c e e") 'web-mode-element-end)
    (define-key keymap (kbd "C-c e c") 'web-mode-element-duplicate)
    (define-key keymap (kbd "C-c e n") 'web-mode-element-next)
    (define-key keymap (kbd "C-c e p") 'web-mode-element-previous)
    (define-key keymap (kbd "C-c e r") 'web-mode-element-rename)
    (define-key keymap (kbd "C-c e s") 'web-mode-element-select)
    (define-key keymap (kbd "C-c e u") 'web-mode-element-parent)
    (define-key keymap (kbd "C-c e i") 'web-mode-element-content-select)
    (define-key keymap (kbd "C-c t b") 'web-mode-tag-beginning)
    (define-key keymap (kbd "C-c t e") 'web-mode-tag-end)
    (define-key keymap (kbd "C-c t m") 'web-mode-tag-match)
    (define-key keymap (kbd "C-c t s") 'web-mode-tag-select)
    (define-key keymap (kbd "C-c t p") 'web-mode-tag-previous)
    (define-key keymap (kbd "C-c t n") 'web-mode-tag-next)
    keymap))

(require 'smartparens-config)
(smartparens-global-mode)
(show-smartparens-global-mode)
(setq sp-ignore-modes-list '(minibuffer-inactive-mode erc-mode w3m-mode))

(add-hook 'lisp-mode-hook
	   (lambda ()
	     (set (make-local-variable 'lisp-indent-function)
		  'common-lisp-indent-function)))

(provide 'config-prog)
