(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)

(setq smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      mu4e-update-interval 300
      mu4e-maildir "~/Maildir"
      message-send-mail-function 'smtpmail-send-it
      smtpmail-queue-mail  nil
      smtpmail-queue-dir  "/home/user/Maildir/queue/cur"
      message-kill-buffer-on-exit t)

;; Skeleton
;; (setq my-mu4e-account-alist
;;       '(("Star"
;;          (smtpmail-smtp-server "")
;;          (mu4e-sent-folder "//Saved Items")
;;          (mu4e-drafts-folder "//Drafts")
;;          (user-mail-address "")
;;          (smtpmail-smtp-user ""))
;;         ("Me"
;;          (smtpmail-smtp-server ""))))

(setq mu4e-get-mail-command "getmail -r ~/.getmail/getmail2rc -r ~/.getmail/getmailrc -r ~/.getmail/getmail3rc")

(add-hook 'mu4e-index-updated-hook
          (defun new-mail ()
            (message "New Mail")))

(defun my-mu4e-set-account ()
       "Set the account for composing a message."
       (let* ((account
               (if mu4e-compose-parent-message
                   (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                     (string-match "/\\(.*?\\)/" maildir)
                     (match-string 1 maildir))
                 (completing-read (format "Compose with account: (%s) "
                                          (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                                  (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                                  nil t nil nil (caar my-mu4e-account-alist))))
              (account-vars (cdr (assoc account my-mu4e-account-alist))))
         (if account-vars
             (mapc #'(lambda (var)
                       (set (car var) (cadr var)))

                   account-vars)
           (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(provide 'config-mail)












