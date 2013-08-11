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

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(require 'move-lines)
(require 'chm-view)
(require 'elscreen)
(elscreen-start)
(auto-indent-global-mode)

(require 'config-my-functions)
(require 'config-completion)
(require 'config-prog)
(require 'config-ruby)
(require 'config-w3m)
(require 'config-erc)
(require 'config-my-keys)
(require 'config-setq)

(setq custom-file "~/.emacs.d/config-custom.el")
(load custom-file)

(load-file "~/.emacs.d/private.el")

(global-undo-tree-mode)

; Hack for obsolete macro in Rails
(remprop 'flet 'byte-obsolete-info)
(put 'erase-buffer 'disabled nil)
