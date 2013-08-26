(require 'cl)

(add-to-list 'load-path "~/.emacs.d/")
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("Tromey" . "http://tromey.com/elpa/")))
(package-initialize)

(require 'projectile)
(require 'move-lines)
(require 'chm-view)
(require 'elscreen)
(elscreen-start)

(require 'config-my-functions)
(require 'config-completion)
(require 'config-prog)
(require 'config-ruby)
(require 'config-mail)
(require 'config-w3m)
(require 'config-erc)
(require 'config-my-keys)
(require 'config-misc)

(setq custom-file "~/.emacs.d/config-custom.el")
(load custom-file)

(load-file "~/.emacs.d/private.el")
