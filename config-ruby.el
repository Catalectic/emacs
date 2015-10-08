; Obsolete function, some package hasn't redefined it
(defun inf-ruby-keys () (inf-ruby-setup-keybindings))

(add-to-list 'load-path "~/.emacs.d/emacs-rails/")

(require 'robe)
(require 'rspec-mode)
(require 'smartparens-ruby)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(setq ruby-use-smie nil)

(setq rspec-key-command-prefix "."
      rspec-use-rake-when-possible nil)

(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'robe-mode)


(add-hook 'ruby-mode-hook
          (lambda ()
            (modify-syntax-entry ?: ".")))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-robe)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (rvm-use "ruby-2.0.0p353" "rails3.2")))

(setq ruby-insert-encoding-magic-comment nil)

(define-key inf-ruby-mode-map (kbd "<up>") 'comint-previous-input)
(define-key inf-ruby-mode-map (kbd "<down>") 'comint-next-input)

(provide 'config-ruby)

