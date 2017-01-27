(require 'circe)

(define-key circe-mode-map (kbd "<up>") 'lui-previous-input)
(define-key circe-mode-map (kbd "<down>") 'lui-next-input)

(setq circe-default-part-message "Quitter"
      circe-default-quit-message "Quitter"
      circe-default-realname "Real"
      circe-default-user "Circe"
      circe-reduce-lurker-spam t)

; Circe should only consider the active frame when tracking
(setq tracking-frame-behavior nil)

; Hack to make sure Circe clears visible buffers after switching frames
(add-hook 'focus-in-hook 'tracking-remove-visible-buffers)
(add-hook 'focus-in-hook
          '(lambda () (interactive)
             (force-mode-line-update t)))

(require 'slack)
(setq slack-buffer-emojify t)
(setq slack-room-subscription nil)

(add-hook 'circe-mode-hook 'circe-lagmon-mode)

(defmethod slack-room-subscribedp ((_room slack-room) _team)
  t)

(defmethod slack-room-subscribedp ((room slack-group) _team)
  t)

(require 'alert)
(setq alert-default-style 'notifications)

(provide 'config-irc)
