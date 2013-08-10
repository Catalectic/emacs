(require 'cl)

(add-to-list 'load-path "~/.emacs.d/")
(setq package-archives 
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("Tromey" . "http://tromey.com/elpa/")))
(package-initialize)

(setq my-packages '(smartparens dired+ ac-helm auto-complete bitlbee chm-view coffee-mode elscreen enh-ruby-mode flymake-coffee flymake-css flymake-ruby flymake-sass flymake-easy helm-descbinds helm-ls-git helm-projectile helm-rails helm-rubygems-local helm icomplete+ inflections popup projectile dash robe rspec-mode ruby-electric ruby-end ruby-tools rvm s sass-mode haml-mode ruby-mode session starter-kit-bindings starter-kit-eshell starter-kit-ruby starter-kit magit ido-ubiquitous smex find-file-in-project idle-highlight-mode paredit inf-ruby twittering-mode undo-tree w3m yari))

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(dired+ magit rainbow-mode))

(require 'session)
(session-initialize)
(defun le::maybe-reveal ()
  (when (and (or (memq major-mode  '(org-mode outline-mode))
                 (and (boundp 'outline-minor-mode)
                      outline-minor-mode))
             (outline-invisible-p))
    (if (eq major-mode 'org-mode)
        (org-reveal)
      (show-subtree))))

(add-hook 'session-after-jump-to-last-change-hook
          'le::maybe-reveal)

(require 'chm-view)
(require 'elscreen)
(elscreen-start)

(require 'config-completion)
(require 'config-my-functions)
(require 'config-prog)
(require 'config-ruby)
(require 'config-w3m)
(require 'config-erc)
(require 'config-my-keys)

(setq custom-file "~/.emacs.d/config-custom.el")
(load custom-file)

(load-file "~/.emacs.d/private.el")

(global-undo-tree-mode)

(setq debug-on-error t)

; Hack for obsolete macro in Rails
(remprop 'flet 'byte-obsolete-info)

(put 'erase-buffer 'disabled nil)
