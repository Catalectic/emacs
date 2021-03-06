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

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq sml/no-confirm-load-theme t)
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

(eval-after-load 'tramp
  '(vagrant-tramp-enable))

(setq auto-indent-key-for-end-of-line-then-newline "<M-RET>"
      auto-indent-key-for-end-of-line-insert-char-then-newline "<M-S-return>")

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(setq gc-cons-threshold 20000000)

(remove-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

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

(setq split-height-threshold 1200)
(setq split-width-threshold 2000)

(menu-bar-mode 1)
(tool-bar-mode -1)

(setq visible-bell nil
      ring-bell-function 'ignore
      inhibit-startup-message t
      confirm-kill-emacs 'yes-or-no-p
      sentence-end-double-space nil
      shift-select-mode nil
      mouse-yank-at-point t
      uniquify-buffer-name-style 'forward)

(setq select-active-regions t
      select-enable-clipboard t
      select-enable-primary t)

(defadvice pop-to-mark-command
    (around ensure-new-position activate)
  (let ((p (point)))
    (dotimes (i 10)
      (when (= p (point))
        ad-do-it))))

(setq set-mark-command-repeat-pop t)

(setq-default fill-column 100)

(setq-default mode-line-position
  `((9 ,(propertize
             "[%l,%c]"
             'face 'font-lock-constant-face))))

(setq-default mode-line-format
      (list

       '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                           'help-echo (buffer-file-name)))

       '(mode-line-position mode-line-position)

       "["

       '(:eval (propertize "%m" 'face 'font-lock-string-face
                           'help-echo buffer-file-coding-system))
       "]"

       '(vc-mode vc-mode)

       ""

       '(global-mode-string global-mode-string)

       " -- "

       '(:eval (propertize (format-time-string "%D %H:%M")
                'face 'font-lock-comment-face))
))

(provide 'config-misc)
