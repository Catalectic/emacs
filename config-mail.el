(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq user-mail-address "evening_star@gmx.com"
      smtpmail-default-smtp-server "smtp.gmx.com"
      smtpmail-smtp-server "smtp.gmx.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 25
      mu4e-update-interval 300
      mu4e-maildir "~/Maildir")

(setq my-mu4e-account-alist
  '(("Star"
     (mu4e-sent-folder "/Star/Saved Items")
     (mu4e-drafts-folder "/Star/Drafts")
     (user-mail-address "evening_star@gmx.com")
     (smtpmail-smtp-user "evening_star@gmx.com"))
    ("Me"
     (mu4e-sent-folder "/Me/Saved Items")
     (mu4e-drafts-folder "/Me/Drafts")
     (user-mail-address "daphne.johnson@gmx.com")
     (smtpmail-smtp-user "daphne.johnson@gmx.com"))))

(setq mu4e-get-mail-command "getmail -r ~/.getmail/getmailrc2 -r ~/.getmail/getmailrc")

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
