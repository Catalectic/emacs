(require 'erc)

(setq erc-join-buffer 'bury
      erc-query-buffer 'bury
      erc-kill-buffer-on-part t
      erc-kill-queries-on-quit t
      erc-kill-server-buffer-on-quit t
      erc-server-reconnect-attempts t)

(setq erc-prompt-for-nickserv-password nil
      erc-user-full-name "Real"
      erc-user-information "Real")

(setq erc-track-enable-keybindings nil
      erc-track-exclude-server-buffer t
      erc-track-showcount t
      erc-track-position-in-mode-line t
      erc-track-visibility nil)

(setq erc-hide-list '("NICK" "JOIN" "PART" "QUIT"))

; Hack to make sure Circe clears visible buffers after switching frames
(add-hook 'focus-in-hook 'erc-modified-channels-update)
(add-hook 'focus-in-hook
          '(lambda () (interactive)
             (force-mode-line-update t)))

(require 'erc-youtube)
(require 'erc-tweet)
(add-to-list 'erc-modules 'services)
(add-to-list 'erc-modules 'youtube)
(add-to-list 'erc-modules 'tweet)
(erc-update-modules)

(erc-truncate-mode)

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
