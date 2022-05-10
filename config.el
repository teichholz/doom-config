;; gets loaded after any modules
;; (fset 'battery-update #'ignore)

(load! "./vars.el")
(load! "./functions.el")
(load! "./keybindings.el")


(setq deft-directory org-roam-directory)
(setq +latex-viewers '(pdf-tools))

(add-hook! eshell-mode
  (company-mode 1))

;; which-key
(after! which-key
  (setq which-key-idle-delay 0.1))


(add-hook 'company-completion-started-hook 'ans/set-company-maps)
(add-hook 'company-completion-finished-hook 'ans/unset-company-maps)
(add-hook 'company-completion-cancelled-hook 'ans/unset-company-maps)

(defun ans/unset-company-maps (&rest unused)
"Set default mappings (outside of company).
Arguments (UNUSED) are ignored."
(general-def
:states 'insert
:keymaps 'override
"<up>" nil
"<down>" nil
"C-j" nil
"C-k" nil
"C-h" nil
"C-s" nil
"RET" nil
[return] nil))

(defun ans/set-company-maps (&rest unused)
"Set maps for when you're inside company completion.
Arguments (UNUSED) are ignored."
(general-def
:states 'insert
:keymaps 'override
"<down>" 'company-select-next
"<up>" 'company-select-previous
"C-j" 'company-select-next
"C-h" 'company-show-doc-buffer
"C-k" 'company-select-previous
"C-s" 'company-filter-candidates
"RET" 'company-complete
[return] 'company-complete))

(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-keymap-prefix "C-l")
(setq lsp-ui-doc-max-height 150)
(setq lsp-ui-doc-max-width 150)

(eval-after-load "tex"
  '(setcdr (assoc "LaTeX" TeX-command-list)
           '("%`%l%(mode) -shell-escape%' %t"
             TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
           ))


(setq +lookup-provider-url-alist (cons '("Hoogle" "https://hoogle.haskell.org/?hoogle=%s") +lookup-provider-url-alist))
