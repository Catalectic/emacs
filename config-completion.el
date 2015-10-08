(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq-default ac-sources '(ac-source-filename
			   ac-source-abbrev
			   ac-source-words-in-same-mode-buffers
			   ac-source-dictionary))
(setq ac-use-quick-help t)

(ac-flyspell-workaround)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-b" 'ac-next-page)
(define-key ac-complete-mode-map "\C-v" 'ac-previous-page)

(defun ac-next-page ()
  (interactive)
  (dotimes (i 10) (ac-next)))

(defun ac-previous-page ()
  (interactive)
  (dotimes (i 10) (ac-previous)))

(setq eldoc-idle-delay 0.2)

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(require 'helm)
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t)

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
