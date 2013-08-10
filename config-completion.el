(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq-default ac-sources '(ac-source-filename
                           ac-source-abbrev
                           ac-source-words-in-same-mode-buffers
                           ac-source-dictionary))
(setq ac-use-quick-help t)
(ac-flyspell-workaround)

(global-set-key (kbd "M-/") 'ac-complete-imenu)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-f" 'ac-next-page)
(define-key ac-complete-mode-map "\C-b" 'ac-previous-page)

(defun ac-next-page ()
  (interactive)
  (dotimes (i 10) (ac-next)))

(defun ac-previous-page ()
  (interactive)
  (dotimes (i 10) (ac-previous)))

; Hack for performance in Helm, especially to switch buffers
(defun helm-highlight-buffers (x y) nil)

(require 'icomplete+)

; Icicle

;; (idle-highlight-mode 0)

;; (setq icicle-buffers-ido-like-flag t
;;       icicle-incremental-completion nil
;;       icicle-expand-input-to-common-match 1
;;       enable-recursive-minibuffers t)

;; ;(global-set-key (kbd "<f1>") 'icicle-complete-keys)

;;   (dolist (map (append (list minibuffer-local-completion-map
;; 			   minibuffer-local-must-match-map)
;; 		       (when (boundp 'minibuffer-local-filename-completion-map)
;; 		         (list minibuffer-local-filename-completion-map))))
;;     (define-key map [up] 'previous-history-element)
;;     (define-key map [down] 'next-history-element)
;;  (define-key map [?\M-p] 'icicle-previous-prefix-candidate)
;;     (define-key map [?\M-n] 'icicle-next-prefix-candidate)
;; (define-key map (kbd "<tab>") 'icicle-apropos-complete)
;; (define-key map (kbd "C-o") 'icicle-prefix-complete)
;; (define-key map (kbd "C-s") 'icicle-narrow-candidates))

(provide 'config-completion)
