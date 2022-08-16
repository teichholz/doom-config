;;  helm-ff-auto-update-initial-value t
;;  helm-find-files-doc-header " (\\<helm-find-files-map>\\[helm-find-files-up-one-level]: Go up one level)"
;;  helm-display-buffer-height 50
;;  helm-display-buffer-default-height 1)


(setq tab-always-indent 'complete)

(setq company-show-numbers t)

(setq doom-localleader-key ",")
;; (setq doom-font (font-spec :family "Iosevka Extended" :size 24))
(setq doom-theme 'doom-one)

(setq display-line-numbers 'relative)

(setq evil-echo-state nil)
(setq make-backup-files t)
(setq confirm-kill-emacs nil
      confirm-kill-processes nil)


(setq org-directory (expand-file-name "~/org"))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq +org-code-file (concat org-directory "/code.org"))
(setq org-roam-directory (concat org-directory "/roam")
      org-roam-graph-viewer "chromium"
      deft-directory org-roam-directory)
(setq org-startup-with-inline-images t)

(after! org
  (push (list "c" "templates for code") org-capture-templates)
  (push (list "ce" "emacs snippet" 'entry (list 'file+headline +org-code-file "Emacs lisp")
              "* Elisp Snippet: %?\n  #+BEGIN_SRC emacs-lisp \n %i\n #+END_SRC\n  %a")
        org-capture-templates)
  (push (list "ca" "algorithm snippet" 'entry (list 'file+headline +org-code-file "Algorithms")
              "* Algorithm: %?\n  #+BEGIN_SRC %(symbol-value 'prog-major-mode) \n %i\n #+END_SRC\n  %a")
        org-capture-templates))

(setq doom-scratch-buffer-major-mode t)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq enable-local-variables :all)
(setq latex-run-command "latex -shell-escape")


(setq haskell-compile-cabal-build-command "stack run")

(setq ispell-dictionary "de_DE")

(setq standard-indent 2)
(add-hook! haskell-mode
  (setq! evil-shift-width 2))

;; Scheme
(setq geiser-scheme-implementation 'chez)

(after! treemacs
  (setq treemacs-collapse-dirs 3))

(defun own/latex-scale ()
  (let ((amount text-scale-mode-amount))
    (if (>= amount 1)
        (+ amount 1.3)
      2.3)))

(defun own/set-latex-scale ()
  (setq org-format-latex-options (plist-put org-format-latex-options :scale (own/latex-scale))))

;; Change latex preview scala when font size increases
(advice-add 'text-scale-increase
            :after
            (lambda (&rest r) (own/set-latex-scale)))

(add-hook 'org-mode-hook #'own/set-latex-scale)

(setq org-startup-with-latex-preview t)
(setq org-startup-with-inline-images t)
(setq org-export-use-babel nil)

(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))
