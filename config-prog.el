(add-hook 'after-init-hook #'global-flycheck-mode)

; Keybindings
(define-key prog-mode-map (kbd "M-a") 'beginning-of-defun)
(define-key prog-mode-map (kbd "M-e") 'end-of-defun)
(define-key prog-mode-map (kbd "RET") 'newline-and-indent)

(require 'eclimd)

(add-hook 'prog-mode-hook 'smartparens-mode)
(add-hook 'prog-mode-hook 'show-smartparens-mode)

(add-hook 'lisp-mode-hook
           (lambda ()
             (set (make-local-variable 'lisp-indent-function)
                  'common-lisp-indent-function)))

; Web-mode

(require 'web-mode)
(setq js-indent-level 2
      rails-auto-mode-alist nil
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 4
      web-mode-code-indent-offset 2
      sgml-basic-offset 2)

(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))

(require 'flycheck)

(flycheck-add-mode 'javascript-eslint 'rjsx-mode)

(setq js2-mode-show-strict-warnings nil)

(add-hook 'flycheck-mode-hook 'use-eslint-from-node-modules)

(add-hook 'haskell-mode-hook 'intero-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
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

(def-projectile-commander-method ?f
    "Find file in project."
    (helm-projectile))

(def-projectile-commander-method ?M
    "Run Helm mini buffer"
    (helm-mini))

(def-projectile-commander-method ?S
    "Split windows"
    (my-split-window))

(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

(provide 'config-prog)
