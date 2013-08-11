(setq next-line-add-newlines t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq debug-on-error t)

(setq auto-indent-key-for-end-of-line-then-newline "<M-RET>"
      auto-indent-key-for-end-of-line-insert-char-then-newline "<M-S-return>")

(provide 'config-setq)
