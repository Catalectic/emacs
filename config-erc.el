(require 'erc)
(require 'erc-track)

;(erc-spelling-mode 1)
(erc-track-mode 1)

(global-subword-mode nil) ; Breaks ERC in 24.4

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

(provide 'config-erc)
