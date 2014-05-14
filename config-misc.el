(setq next-line-add-newlines t)
(setq echo-keystrokes 0.1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil
      auto-save-default nil)

(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-up (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-down (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-left (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-right (before other-window-now activate)
  (when buffer-file-name (save-buffer)))

(setq sml/theme 'dark)
(sml/setup)

(recentf-mode 1)
(setq recentf-max-saved-items 100)

(savehist-mode 1)
(setq history-length 1000)

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

(add-hook 'before-revert-hook  (lambda () (kill-ring-save (point-min) (point-max))))
(setq revert-buffer-function nil)
(setq kill-ring-max 1000)
(global-auto-revert-mode t)

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

(remove-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

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

(define-minor-mode sticky-buffer-mode
  "Make the current window always display this buffer."
  nil " sticky" nil
  (set-window-dedicated-p (selected-window) sticky-buffer-mode))

(exec-path-from-shell-initialize)

(provide 'config-misc)
