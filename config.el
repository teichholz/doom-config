;; gets loaded after any modules

(load! "./dash-at-point.el")
(load! "./winum.el")
(load! "./lispyville.el")
(load! "./keybindings.el")
(load! "./vars.el")
(load! "./packages/python-lsp-ms.el")

(def-package! pyvenv)
(def-package! evil-avy)
(def-package! evil-ex-fasd)
;; (def-package! company-box
;;   :hook (company-mode . company-box-mode))
(def-package! auto-yasnippet)
(setq make-backup-files t)
(setq doom-font (font-spec :family "Source Code Pro" :size 22))
(setq lsp-python-ms-dir
      (expand-file-name "~/GitHub/python-language-server/output/bin/Release/"))
(setq lsp-python-ms-executable
      (expand-file-name "~/.local/bin/Microsoft.Python.LanguageServer"))
(add-hook! eshell-mode
  (company-mode 1))



;;(setq counsel-locate-cmd (cond ((eq system-type 'darwin)
;;                                     '(lambda (string) (format "mdfind -name '%s'" string)))
 ;;                                   ((and (eq system-type 'windows-nt)
   ;;                                       (executable-find "es.exe"))
     ;;                                'counsel-locate-cmd-es)
       ;;                             (t
         ;;                            'counsel-locate-cmd-default))
