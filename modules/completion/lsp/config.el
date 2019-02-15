;;; completion/lsp/config.el -*- lexical-binding: t; -*-

(def-package! lsp-mode
  :commands (lsp)
  :init
  (setq lsp-prefer-flymake nil)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-eldoc-hook '(lsp-hover)))

(def-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :commands (lsp-mode)
  :init
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-auto-guess-root t)
  (setq lsp-ui-doc-max-height 80)
  (setq lsp-ui-doc-max-width 50)
  :config
  (set-lookup-handlers! 'lsp-ui-mode
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-ignore-duplicate t)
  (setq lsp-ui-sideline-enable nil))

(def-package! company-lsp
  :after lsp-mode
  :commands (company-lsp)
  :config
  (set-company-backend! 'lsp-mode 'company-lsp)
  (setq company-lsp-enable-recompletion t))

(def-package! cquery
  :when (featurep! +cpp)
  :hook (c++-mode . 'lsp)
  :init
  (setq cquery-executable "/usr/local/bin/cquery")
  (setq cquery-extra-init-params '(:index (:comments 2)
                                          :cacheFormat "msgpack"
                                          :completion (:detailedLabel t))
        cquery-sem-highlight-method 'overlay) ;; set to 'font-lock if highlighting slowly
  )

(add-hook! (js2-mode web-mode css-mode sh-mode cpp-mode c-mode python-mode) 'lsp)
