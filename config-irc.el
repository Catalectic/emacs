(require 'circe)

(define-key circe-mode-map (kbd "<up>") 'lui-previous-input)
(define-key circe-mode-map (kbd "<down>") 'lui-next-input)

(setq circe-default-part-message "Quitter"
      circe-default-quit-message "Quitter"
      circe-default-realname "Real"
      circe-default-user "Circe"
      circe-reduce-lurker-spam t)

(provide 'config-irc)
