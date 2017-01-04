(require 'cl)

(add-to-list 'load-path "~/.emacs.d/")
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("melpa" . "https://melpa.org/packages")))
(package-initialize)

(require 'projectile)
(require 'move-lines)
(require 'elscreen)
(elscreen-start)

(require 'config-my-functions)
(require 'config-completion)
(require 'config-prog)
(require 'config-ruby)
;(require 'config-mail)
(require 'config-web)
(require 'config-irc)
(require 'config-my-keys)
(require 'config-misc)


(setq custom-file "~/.emacs.d/config-custom.el")
(load custom-file)
(load-theme 'solarized-dark t)

(load-file "~/.emacs.d/config-private.el")
