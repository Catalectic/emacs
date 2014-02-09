(setq next-line-add-newlines t)
(setq echo-keystrokes 0.1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(recentf-mode 1)
(setq recentf-max-saved-items 100)

(savehist-mode 1)
(setq history-length 1000)

(winner-mode 1)

(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))

(global-subword-mode 1)

 ; Hack for obsolete macro in Rails
(remprop 'flet 'byte-obsolete-info)
(put 'erase-buffer 'disabled nil)

(setq debug-on-error t)

(setq auto-indent-key-for-end-of-line-then-newline "<M-RET>"
      auto-indent-key-for-end-of-line-insert-char-then-newline "<M-S-return>")

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(setq gc-cons-threshold 20000000)

(setq twittering-auth-method 'xauth)

(require 'session)
(session-initialize)
(defun le::maybe-reveal ()
  (when (and (or (memq major-mode  '(org-mode outline-mode))
                 (and (boundp 'outline-minor-mode)
                      outline-minor-mode))
             (outline-invisible-p))
    (if (eq major-mode 'org-mode)
        (org-reveal)
      (show-subtree))))

(add-hook 'session-after-jump-to-last-change-hook
          'le::maybe-reveal)

(setq gc-cons-threshold 20000000)

(provide 'config-misc)
