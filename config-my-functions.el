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

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

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


;; ------------------------------------------------ autosave and backup
;; Put autosave files (ie #foo#) in one place, *not* scattered all over the
;; file system! (The make-autosave-file-name function is invoked to determine
;; the filename of an autosave file.) 
(defvar autosave-dir (concat "/tmp/emacs_" (user-login-name) "/"))
(make-directory autosave-dir t)
 
(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))
 
(defun make-auto-save-file-name ()
   (concat autosave-dir
           (if buffer-file-name
               (concat "#" (file-name-nondirectory buffer-file-name) "#")
             (expand-file-name
              (concat "#%" (buffer-name) "#")))))
 
;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
 
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq bkup-backup-directory-info (list (cons "." backup-dir)))
(setq make-backup-files nil)
