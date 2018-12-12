;; gets loaded after any modules

(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./keybindings.el")

(def-package! pyvenv)

(setq doom-font (font-spec :family "Source Code Pro" :size 22))

(after! org
  (add-to-list 'org-src-lang-modes '("js" . js2)))



;; (setq lsp-ui-doc-include-signature t)
;; (setq lsp-ui-doc-max-height 30)
