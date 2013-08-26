(add-hook 'after-init-hook 'save-installed-packages-list)

(defun my-forward-to-indentation (n)
  "Move forward ARG lines and position at first nonblank character, skipping blank lines."
  (interactive "p")
  (forward-to-indentation (if (null n) 1 n))
  (while (and (eolp) (not (eobp)))
    (forward-to-indentation 1)))

(defun my-backward-to-indentation (n)
  "Move backward ARG lines and position at first nonblank character, skipping blank lines."
  (interactive "p")
  (while (and (eolp) (not (bobp)))
    (backward-to-indentation (if (null n) 1 n))
    (backward-to-indentation 1)))

(defun repeat-shell-command ()
  "Repeat most recently executed shell command."
  (interactive)
  (save-buffer)
  (or shell-command-history (error "Nothing to repeat."))
  (shell-command (car shell-command-history)))

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

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(add-hook 'before-save-hook 'whitespace-cleanup)

(recentf-mode)
(run-with-timer 0 1800 'recentf-save-list)

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

(load-installed-packages-list)

(provide 'config-my-functions)
