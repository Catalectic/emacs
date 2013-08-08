; Obsolete function, some package hasn't redefined it
(defun inf-ruby-keys () (inf-ruby-setup-keybindings))

(add-to-list 'load-path "/home/user/.emacs.d/emacs-rails/")

(require 'flymake)
(require 'starter-kit-ruby)
(require 'flymake-ruby)
(require 'ruby-electric)
(require 'robe)
(require 'rails)
(require 'rspec-mode)
(require 'smartparens-ruby)

(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'rails-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(remove-hook 'ruby-mode-hook 'whitespace-mode)
(remove-hook 'prog-mode-hook 'idle-highlight-mode)

(add-hook 'ruby-mode-hook
          '(lambda ()
	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))))

(add-hook 'ruby-mode-hook
          (lambda ()
            (modify-syntax-entry ?: ".")))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-robe)))

(define-key inf-ruby-mode-map (kbd "<up>") 'comint-previous-input)
(define-key inf-ruby-mode-map (kbd "<down>") 'comint-next-input)

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

     ;;; nxml (HTML ERB template support)
;(require 'nxml-mode)
;(load "~/.emacs.d/nxhtml/autostart.el")
;     (setq
;      nxhtml-global-minor-mode t
;      mumamo-chunk-coloring 'submode-colored
;      nxhtml-skip-welcome t
;      indent-region-mode t
;      rng-nxml-auto-validate-flag nil
;      nxml-degraded nil)
; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . nxhtml-mode))
