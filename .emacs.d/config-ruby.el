; Obsolete function, some package hasn't redefined it
(defun inf-ruby-keys () (inf-ruby-setup-keybindings))

(setq rsense-home (expand-file-name "~/opt/rsense-0.3"))
(add-to-list 'load-path rsense-home)
(add-to-list 'load-path "/home/user/opt/rsense-0.3/etc")
(require 'rsense)

(require 'flymake)
(require 'starter-kit-ruby)
(require 'flymake-ruby)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(add-to-list 'load-path "/home/user/.emacs.d/rails-minor-mode/")
(require 'rails)
(add-hook 'ruby-mode-hook 'rails-minor-mode)
;(remove-hook 'ruby-mode-hook 'whitespace-mode)

(require 'rspec-mode)

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

(add-hook 'ruby-mode-hook
          '(lambda ()

	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))
	     ))

(add-hook 'ruby-mode-hook
          (lambda ()
            (modify-syntax-entry ?: ".")))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
