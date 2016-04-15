(defvar installed-packages-list "~/.emacs.d/packages.txt")

(defun save-installed-packages-list ()
  (interactive)
  (with-temp-file installed-packages-list
    (if (file-exists-p installed-packages-list)
        (progn (erase-buffer)
               (insert (prin1-to-string package-activated-list))))))

(defun load-installed-packages-list ()
  (if (not package-archive-contents)
      (package-refresh-contents))
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

(provide 'config-packages)
