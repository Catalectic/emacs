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

(require 'web-mode)
(setq js-indent-level 4
      rails-auto-mode-alist nil
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 4
      web-mode-code-indent-offset 4
      sgml-basic-offset 4)

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

(setq projectile-switch-project-action
      #'projectile-commander)

(def-projectile-commander-method ?A
    "Find ag on project."
    (call-interactively 'helm-projectile-ag))

(def-projectile-commander-method ?s
  "Open a *shell* buffer for the project."
  (shell (get-buffer-create
          (format "*shell %s*"
                  (projectile-project-name)))))

(def-projectile-commander-method ?c
  "Run `compile' in the project."
  (call-interactively #'compile))


(def-projectile-commander-method ?\C-?
  "Go back to project selection."
  (projectile-switch-project))


(def-projectile-commander-method ?d
  "Open project root in dired."
  (projectile-dired))

(def-projectile-commander-method ?F
  "Git fetch."
  (magit-status)
  (call-interactively #'magit-fetch-all))

(provide 'config-prog)
