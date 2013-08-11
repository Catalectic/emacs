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

(provide 'config-setq)
