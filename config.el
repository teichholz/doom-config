;; gets loaded after any modules

(load! "./functions.el")
(load! "./vars.el")
(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./lispyville.el")
(load! "./packages/python-lsp-ms.el")
(load! "./hydras.el")
(load! "./keybindings.el")
(load! "./documentation.el")

(def-package! pyvenv)
(def-package! evil-avy)
(def-package! evil-ex-fasd)
(def-package! drag-stuff)
(def-package! pcmpl-args)
(def-package! auto-yasnippet)
(def-package! major-mode-hydra)
(def-package! helm-mode-manager)
(def-package! helm-make)
(def-package! helm-ls-git)
(def-package! helm-swoop)
(def-package! nswbuff)
(def-package! ace-popup-menu)
(def-package! symbol-overlay)
(def-package! dired-filter)
(def-package! dired-open)
(def-package! dired-narrow)
(def-package! dired-subtree)

(after! helm
  (helm-autoresize-mode 1)
  (remove-hook 'helm-after-initialize-hook '+helm|hide-mode-line)
  (advice-remove 'helm-display-mode-line '+helm|hide-mode-line))

(add-hook! eshell-mode
  (company-mode 1))

(evil-avy-mode 1)

(advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update)

(add-hook 'dired-mode-hook 'turn-off-evil-matchit-mode)
(add-hook 'dired-mode-hook 'turn-on-dired-filter-mode)


;; (when macosx-p
;;   (set-exec-path-from-shell-PATH))
