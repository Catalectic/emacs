(require 'erc)
(require 'erc-track)

(erc-spelling-mode 1)

(define-key erc-mode-map (kbd "<up>") 'erc-previous-command)
(define-key erc-mode-map (kbd "<down>") 'erc-next-command)

(eval-after-load "erc"
  '(progn
 
     ;; Set personal information
     (setq erc-disable-ctcp-replies t
           erc-track-exclude-server-buffer t
           erc-track-showcount t)
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
