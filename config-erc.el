(require 'erc)
(require 'erc-track)

;(erc-spelling-mode 1)
(erc-track-mode 1)

(add-hook 'erc-connect-pre-hook (lambda (null) (global-subword-mode -1))) ; Breaks ERC in 24.4

(define-key erc-mode-map (kbd "<up>") 'erc-previous-command)
(define-key erc-mode-map (kbd "<down>") 'erc-next-command)

(eval-after-load "erc"
  '(progn

     ;; Set personal information
     (setq erc-disable-ctcp-replies t
           erc-track-exclude-server-buffer t
           erc-track-showcount t
           erc-hide-list (quote ("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE"))
           erc-lurker-hide-list (quote ("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE"))
           erc-lurker-threshold-time 84600
           erc-max-buffer-size 100000
           erc-nick-uniquifier "_"
           erc-server-reconnect-attempts 10
           erc-server-reconnect-timeout 60
           erc-spelling-mode t
           erc-truncate-mode t
           erc-whowas-on-nosuchnick t)
     (setq erc-quit-reason-various-alist
           '(("brb"    "I'll be right back.")
             ("lunch"  "Having lunch.")
             ("dinner" "Having dinner.")
             ("food"   "Getting food.")
             ("sleep"  "Sleeping.")
             ("work"   "Getting work done.")
             (".*"     "Quit")))
     (setq erc-part-reason-various-alist erc-quit-reason-various-alist
           erc-part-reason               'erc-part-reason-various
           erc-quit-reason               'erc-quit-reason-various)    (setq erc-part-reason 'erc-part-reason-various)
           (setq erc-quit-reason 'erc-quit-reason-various)

           (setq erc-part-reason-various-alist
                 '(("^$" "Part")))

           (setq erc-quit-reason-various-alist
                 '(("^$" "Quit")))))

(defun erc-process-sentinel-2 (event buffer)
  "Called when `erc-process-sentinel-1' has detected an unexpected disconnect."
  (if (not (buffer-live-p buffer))
      (erc-update-mode-line)
    (with-current-buffer buffer
      (erc-display-message nil 'error (current-buffer) 'disconnected)
      (condition-case err
          (progn
            (setq erc-server-reconnecting nil)
            (erc-server-reconnect)
            (setq erc-server-reconnect-count 0))
        (error (when (buffer-live-p buffer)
                 (set-buffer buffer)
                 (if (integerp erc-server-reconnect-attempts)
                     (setq erc-server-reconnect-count
                           (1+ erc-server-reconnect-count))
                   (message "%s ... %s"
                            "Reconnecting until we succeed"
                            "kill the ERC server buffer to stop"))
                 (if (numberp erc-server-reconnect-timeout)
                     (run-at-time erc-server-reconnect-timeout nil
                                  #'erc-process-sentinel-2
                                  event buffer)
                   (error (concat "`erc-server-reconnect-timeout`"
                                  " must be a number")))))))))

(provide 'config-erc)
