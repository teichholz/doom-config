;; gets loaded after any modules

(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./lispyville.el")
(load! "./keybindings.el")
(load! "./vars.el")

(def-package! pyvenv)
(def-package! company-box
  :hook (company-mode . company-box-mode))
(def-package! auto-yasnippet)
(setq make-backup-files t)
(setq company-idle-delay nil)
(setq doom-font (font-spec :family "Source Code Pro" :size 22))

;; (add-to-list exec-path "/Users/timeichholz/.nvm/versions/node/v11.2.0/bin")


;; (when (eq major-mode 'js2-mode)
;;   (make-local-variable 'completion-at-point-functions)
;;   (setq 'completion-at-point-functions '(company-complete)))
