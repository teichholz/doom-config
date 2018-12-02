;; gets loaded after any modules

(def-package! dash-at-point
  :config
  (add-to-list 'dash-at-point-mode-alist '(web-mode . "html, css"))
  (add-to-list 'dash-at-point-mode-alist '(racket-mode . "racket"))
  add-to-list 'dash-at-point-mode-alist '(python-mode . "python"))

(def-package! winum
  :init
  (setq winum-auto-setup-mode-line nil)
  (defun winum-assign-9-to-calculator-8-to-flycheck-errors ()
    (cond
     ((equal (buffer-name) "*Flycheck errors*") 8)))

  (defun winum-assign-0-to-neotree ()
    (when (string-match-p (buffer-name) ".*\\*Treemacs\\*.*") 10))
  :after evil
  :config
  (winum-mode)
  (map! :n "M-0" #'winum-select-window-0-or-10
        :n "M-1" #'winum-select-window-1
        :n "M-2" #'winum-select-window-2
        :n "M-3" #'winum-select-window-3
        :n "M-4" #'winum-select-window-4
        :n "M-5" #'winum-select-window-5
        :n "M-6" #'winum-select-window-6
        :n "M-7" #'winum-select-window-7
        :n "M-8" #'winum-select-window-8)
  (add-to-list 'winum-assign-functions #'winum-assign-9-to-calculator-8-to-flycheck-errors)
  (add-to-list 'winum-assign-functions #'winum-assign-0-to-neotree))

(def-package! pyvenv)

(setq doom-font (font-spec :family "Source Code Pro" :size 22))

(map!
 :after cc-mode
 :map (c-mode-map cpp-mode-map)
 :n "K" #'dash-at-point)

(map!
 :after web-mode
 :map (web-mode-map)
 :n "K" #'dash-at-point)

(map!
 :after css-mode
 :map (css-mode-map)
 :n "K" #'dash-at-point)

(map!
 :after racket-mode
 :map (racket-mode-map)
 :n "K" #'dash-at-point)

(map!
 :after python-mode
 :map (python-mode-map)
 :n "K" #'dash-at-point)
(map!
 :after helm-mode
 :leader
 :n "f l" #'helm-locate)

(map!
 :after cc-mode
 :map (c-mode-map cpp-mode-map)
 :n "g h" #'ff-find-other-file)

;; (map!
;;  :i "M-c" #'+company/complete)

(map!
 :after company-mode
 :map company-mode-map
 :i "M-c" #'+company/complete)

;; (setq lsp-ui-doc-include-signature t)
;; (setq lsp-ui-doc-max-height 30)
