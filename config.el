;; gets loaded after any modules

(load! "./vars.el")
(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./lispyville.el")
(load! "./packages/python-lsp-ms.el")
(load! "./hydras.el")
(load! "./keybindings.el")
(load! "./functions.el")
(load! "./documentation.el")

(def-package! pyvenv)
(def-package! drag-stuff)
(def-package! pcmpl-args)
(def-package! auto-yasnippet)
(def-package! major-mode-hydra)
(def-package! helm-mode-manager)
(def-package! helm-make)
(def-package! helm-ls-git)
(def-package! helm-swoop)
(def-package! nswbuff)
(def-package! symbol-overlay)
(def-package! dired-filter)
(def-package! dired-narrow)
(def-package! dired-subtree)
(def-package! dired-sidebar)
(def-package! dired-launch)
(def-package! let-alist)
(def-package! tablist)
(def-package! org-noter)
;; (def-package! nov)


(after! helm
  (helm-autoresize-mode 1)
  (remove-hook 'helm-after-initialize-hook '+helm|hide-mode-line)
  (advice-remove 'helm-display-mode-line '+helm|hide-mode-line))

(add-hook! eshell-mode
  (company-mode 1))

(add-hook 'prog-mode-hook 'turn-on-evil-avy-mode)
(add-hook 'magit-mode-hook 'turn-off-evil-avy-mode)

(advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update)

(add-hook 'dired-mode-hook 'turn-off-evil-matchit-mode)
(add-hook 'dired-mode-hook 'turn-on-dired-filter-mode)

(linum-mode 0)

;; (when macosx-p
;;   (set-exec-path-from-shell-PATH))


(add-hook! 'prog-mode-hook #'save-prog-major-mode)

;; (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
