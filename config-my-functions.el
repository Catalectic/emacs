(defun my-forward-to-indentation (n)
  "Move forward ARG lines and position at first nonblank character, skipping blank lines."
  (interactive "p")
(forward-to-indentation (if (null n) 1 n))
(while (and (eolp) (not (eobp))) 
  (forward-to-indentation 1)))

(defun my-backward-to-indentation (n)
  "Move backward ARG lines and position at first nonblank character, skipping blank lines."
  (interactive "p")
(backward-to-indentation (if (null n) 1 n))
(while (and (eolp) (not (bobp))) 
  (backward-to-indentation 1)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (let ((col (current-column))
        start
        end)
    (beginning-of-line)
    (setq start (point))
    (end-of-line)
    (forward-char)
    (setq end (point))
    (let ((line-text (delete-and-extract-region start end)))
      (forward-line n)
      (insert line-text)
      ;; restore point to original column in moved line
      (forward-line -1)
      (forward-char col))))

(defun repeat-shell-command ()
  "Repeat most recently executed shell command."
  (interactive)
  (save-buffer)
  (or shell-command-history (error "Nothing to repeat."))
  (shell-command (car shell-command-history)))

(global-set-key (kbd "C-c j") 'repeat-shell-command)

(defun describe-major-mode ()
  "Describe only `major-mode'."
  (interactive)
  (describe-function major-mode))

; Automatically rebalance windows after splitting them

(defun my-split-window (&optional n)
  (interactive "P")
  (setq n (if n
                           (prefix-numeric-value n)
                         2))
  (dotimes (- n 1)
    (split-window-right))
  (balance-windows)) 

    (defconst emacs-tmp-dir (format "%s%s%s/" temporary-file-directory "emacs" (user-uid)))
    (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
    (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
    (setq auto-save-list-file-prefix
        emacs-tmp-dir)

(setq
   backup-by-copying t      ; don't clobber symlinks
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

  (defvar installed-packages-list "~/.emacs.d/packages.txt")

  (defun save-installed-packages-list () 
    (with-temp-file installed-packages-list
      (if (file-exists-p installed-packages-list)
         (progn (erase-buffer)
      (insert (prin1-to-string package-activated-list))))))

(defun load-installed-packages-list ()
   (with-temp-buffer installed-packages-list
    (insert-file-contents installed-packages-list)
 (let ((packages (read (buffer-string))))
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 packages))))

 (add-hook 'after-init-hook 'save-installed-packages-list)
 
(load-installed-packages-list)

(provide 'config-my-functions)
