(require 'circe)

(define-key circe-mode-map (kbd "<up>") 'lui-previous-input)
(define-key circe-mode-map (kbd "<down>") 'lui-next-input)

(setq circe-default-part-message "Quitter"
      circe-default-quit-message "Quitter"
      circe-default-realname "Real"
      circe-default-user "Circe"
      circe-reduce-lurker-spam t)

(require 'slack)
(setq slack-buffer-emojify t)
(setq slack-room-subscription nil)

(defmethod slack-room-subscribedp ((_room slack-room) _team)
  t)

(defmethod slack-room-subscribedp ((room slack-group) _team)
  t)

(require 'alert)
(setq alert-default-style 'notifications)

(provide 'config-irc)
