;; gets loaded after any modules

(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./keybindings.el")

(def-package! pyvenv)
(setq make-backup-files t)
(setq doom-font (font-spec :family "Source Code Pro" :size 22))

;; (add-to-list exec-path "/Users/timeichholz/.nvm/versions/node/v11.2.0/bin")

(add-hook! lisp-mode #'lispy-mode)
(after! lispyville
  (lispyville-set-key-theme
   '((operators normal)
     (c-w normal)
     (prettify insert normal)
     (atom-movement normal visual)
     slurp/barf-lispy
     (wrap normal insert)
     (text-objects normal)
     additional
     (additional-motions normal)
     additional-insert
     (additional-wrap normal insert)
     (escape insert))))
