; Obsolete function, some package hasn't redefined it
(defun inf-ruby-keys () (inf-ruby-setup-keybindings))

(add-to-list 'load-path "~/.emacs.d/emacs-rails/")

(require 'starter-kit-ruby)
(require 'robe)
(require 'rails)
(require 'rspec-mode)
(require 'smartparens-ruby)

(rvm-use "2.0.0" "global")
(add-hook 'ruby-mode-hook 'rails-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(add-hook 'ruby-mode-hook
          (lambda ()
            (modify-syntax-entry ?: ".")))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-robe)))

(setq ruby-insert-encoding-magic-comment nil)

(define-key inf-ruby-mode-map (kbd "<up>") 'comint-previous-input)
(define-key inf-ruby-mode-map (kbd "<down>") 'comint-next-input)

(provide 'config-ruby)
