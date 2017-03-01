(require 'cl)

(add-to-list 'load-path "~/.emacs.d/")
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(require 'projectile)
(require 'move-lines)

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

(set-face-attribute 'default nil
                    :family "Ubuntu Mono"
                    :height 188
                    :weight 'normal
                    :width 'normal)

(rename-frame "*scratch" "IRC")
(maximize-frame)
(setq named-frames '("Ruby" "Java" "Personal"))
(-map (lambda (frame)
        (maximize-frame 'both
          (make-frame `((name . ,frame)))))
         named-frames)

(load-file "~/.emacs.d/config-private.el")
