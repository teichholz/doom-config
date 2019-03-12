;; gets loaded after any modules

(load! "./vars.el")
(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./lispyville.el")
;; (load! "./packages/python-lsp-ms.el")
(load! "./functions.el")
(load! "./hydras.el")
(load! "./keybindings.el")

(def-package! pyvenv)
(def-package! evil-avy)
(def-package! evil-ex-fasd)
(def-package! drag-stuff)
(def-package! auto-yasnippet)
(def-package! major-mode-hydra)
(def-package! helm-mode-manager)
(def-package! helm-make)
(def-package! helm-ls-git)
(def-package! helm-swoop)
(setq make-backup-files t)
;; (setq lsp-python-ms-dir
;;       (expand-file-name "~/GitHub/python-language-server/output/bin/Release/"))
;; (setq lsp-python-ms-executable
;;       (expand-file-name "~/.local/bin/Microsoft.Python.LanguageServer"))
(add-hook! eshell-mode
  (company-mode 1))
(evil-avy-mode 1)
(def-package! pcmpl-args)
(def-package! fzf)

(after! helm-mode
  (remove-hook 'helm-after-initialize-hook '+helm|hide-mode-line)
  (advice-remove 'helm-display-mode-line '+helm|hide-mode-line))
