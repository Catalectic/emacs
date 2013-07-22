(require 'cl)

(add-to-list 'load-path "~/.emacs.d/")
(setq package-archives 
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("Tromey" . "http://tromey.com/elpa/")))
(package-initialize)

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

(require 'ecb)
(require 'elscreen)
(elscreen-start)

(load-file "~/.emacs.d/config-completion.el")
(load-file "~/.emacs.d/config-my-functions.el")
(load-file "~/.emacs.d/config-lisp.el")
(load-file "~/.emacs.d/config-ruby.el")
(load-file "~/.emacs.d/config-w3m.el")
(load-file "~/.emacs.d/config-erc.el")
(load-file "~/.emacs.d/config-my-keys.el")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(load-file "~/.emacs-private.el")

(global-undo-tree-mode)

; Hack for obsolete macro in Rails
(remprop 'flet 'byte-obsolete-info)

(put 'erase-buffer 'disabled nil)
