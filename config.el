;; gets loaded after any modules

(load! "./dash-at-point.el")
(load! "./winum.el")
;; (load! "./lispyville.el")
;; (load! "./packages/python-lsp-ms.el")
(load! "./functions.el")
(load! "./vars.el")
(load! "./keybindings.el")

(def-package! pyvenv)
(def-package! evil-avy)
(def-package! evil-ex-fasd)
(def-package! drag-stuff)
(def-package! auto-yasnippet)
(def-package! major-mode-hydra)
;; (setq make-backup-files t)
;; (setq lsp-python-ms-dir
;;       (expand-file-name "~/GitHub/python-language-server/output/bin/Release/"))
;; (setq lsp-python-ms-executable
;;       (expand-file-name "~/.local/bin/Microsoft.Python.LanguageServer"))
(add-hook! eshell-mode
  (company-mode 1))
