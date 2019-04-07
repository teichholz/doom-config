;;; ~/.doom.d/vars.el -*- lexical-binding: t; -*-
(setq mac-command-modifier 'meta
      mac-right-option-modifier 'hyper)
(if (equal (expand-file-name "~") "/Users/tim")
    (setq mac-option-modifier  nil)
  ;; (setq mac-option-modifier 'super)
  (setq mac-option-modifier nil))

(setq flycheck-check-syntax-automatically nil)

(setq
 helm-autoresize-min-height 45
 helm-autoresize-max-height 45
 helm-display-header-line t
 helm-mode-line-string "\
    \\<helm-map>\
    \\[helm-help]:Help \
    \\[helm-select-action]:Act \
    \\[helm-maybe-exit-minibuffer]/\
    f1/f2/f-n:NthAct \
    \\[helm-toggle-suspend-update]:Tog.suspend"
 helm-ff-auto-update-initial-value t
 helm-find-files-doc-header " (\\<helm-find-files-map>\\[helm-find-files-up-one-level]: Go up one level)"
 helm-display-buffer-height 50
 helm-display-buffer-default-height 1
 helm-locate-recursive-dirs-command "mdfind -onlyin '%s' -name '%s'")

(setq tab-always-indent 'complete)

(setq company-show-numbers t)

(setq evil-escape-key-sequence "fd")

(setq doom-localleader-key ",")
(setq doom-font (font-spec :family "Source Code Pro" :size 22))
(setq doom-theme 'doom-solarized-light)

(prefer-coding-system 'utf-8-unix)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(after! ivy-rich
  (plist-put ivy-rich--display-transformers-list 'ivy-switch-buffer
             '(:columns
               (
                (ivy-rich-candidate (:width 30)) ; return the candidate itself
                (ivy-rich-switch-buffer-size (:width 7)) ; return the buffer size
                (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)) ; return the buffer indicators
                (ivy-rich-switch-buffer-major-mode (:width 12 :face warning)) ; return the major mode info
                ;; ((lambda (candidat) (with-current-buffer
                ;;                    (get-buffer candidat)
                ;;                  (doom-project-name))) (:width 15 :face success))
                ;; (ivy-rich-switch-buffer-project (:width 15 :face success)) ; return project name using `projectile'
                ;; (ivy-rich-switch-buffer-path (:width 15))
                ) ; return file path relative to project root or `default-directory' if project is nil
               :predicate
               (lambda (cand) (get-buffer cand))))
  (ivy-rich-mode 0)
  (ivy-rich-mode 1))

(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(when macosx-p
  (set-exec-path-from-shell-PATH))

(setq lsp-ui-sideline-ignore-duplicate t)
(setq lsp-ui-sideline-enable nil)
(setq lsp-eldoc-enable-hover nil)

(setq nswbuff-exclude-buffer-regexps '("^ .*" "^\\*.*\\*"))
(setq nswbuff-clear-delay 1)
(setq nswbuff-buffer-list-function #'+workspace-buffer-list)

(setq evil-echo-state nil)

(setq make-backup-files t)

;; (setq lsp-python-ms-dir
;;       (expand-file-name "~/GitHub/python-language-server/output/bin/Release/"))
(setq lsp-python-ms-executable
      (expand-file-name "~/.local/bin/Microsoft.Python.LanguageServer"))

(setq confirm-kill-emacs nil)

(setq dired-open-extensions-elisp '(("pdf" . launch-in-adobe)))
(setq dired-open-functions '(dired-open-call-function-by-extension dired-open-by-extension dired-open-subdir))

(setq dired-filter-group-saved-groups '(("default"
                                         ("PDF"
                                          (extension . "pdf"))
                                         ("LaTeX"
                                          (extension "tex" "bib"))
                                         ("Org"
                                          (extension . "org"))
                                         ("Archives"
                                          (extension "zip" "rar" "gz" "bz2" "tar"))
                                         ("Pictures"
                                          (extension "png" "jpg" "svg")))))
