;; gets loaded after any modules

(load! "./vars.el")
;; (load! "./dash-at-point.el")
(load! "./winum.el")
;; (load! "./lispyville.el")
;; (load! "./packages/python-lsp-ms.el")
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
(def-package! parinfer)
(def-package! tablist)
(def-package! org-noter)
;; (def-package! nov)


(after! helm
  (helm-autoresize-mode 1)
  (remove-hook 'helm-after-initialize-hook '+helm|hide-mode-line)
  (advice-remove 'helm-display-mode-line '+helm|hide-mode-line))

(add-hook! eshell-mode
  (company-mode 1))

(advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update)

(add-hook 'dired-mode-hook 'turn-on-dired-filter-mode)

(linum-mode 0)

;; (when macosx-p
;;   (set-exec-path-from-shell-PATH))


(add-hook! 'prog-mode-hook #'save-prog-major-mode)

;; (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(set-company-backend! 'css-mode 'company-lsp)

(cljr-add-keybindings-with-prefix "C-c C-m")
(setq cljr-warn-on-eval nil)

(doom-modeline-mode)

;; Paredit mode
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook           #'enable-paredit-mode)
