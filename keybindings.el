;;; ~/.doom.d/keybindings.el -*- lexical-binding: t; -*-

(defun make-python-src-block! ()
  (interactive)
  (save-excursion
    (insert "#+BEGIN_SRC python" "\n" "\n" "#+END_SRC")))

(after! org
  (map! :map org-mode-map
        :ni "M-p" #'make-python-src-block!))
(after! org-src
  (map! :map org-src-mode-map
        :n "M-p" #'lsp-python-enable))

(defvar my-keys-minor-mode-map
  (let ((myMap (make-sparse-keymap)))
    (map! :after 'python :map python-mode-map
          :n "C-c C-c"
          #'python-shell-send-buffer)
    (map! :n "g K" #'dash-at-point)
    (map! :i "M-c" #'+company/complete)
    (map! :after 'org :map org-mode-map
          :n "M-p" #'make-python-src-block!)
    (map! :after 'org-src :map org-src-mode-map
          :n "M-p" #'lsp-python-enable)
    myMap)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter "my-keys")

(my-keys-minor-mode 1)

(setq doom-localleader-key ",")

(map! :after js2-mode
      :localleader
      :n "n s" #'nodejs-repl
      :n "n b" #'nodejs-repl-send-buffer
      :n "n r" #'nodejs-repl-send-region)

(map! :after helm
      :leader
      :n "f l" #'helm-locate)

(map! :after evil
      :ng "M-f" 'swiper-helm)

(map! :after avy
      :prefix "M-g"
      :n "k" 'avy-kill-region
      :prefix ("M-g m" . "Avy move")
      :n "r" 'avy-move-region
      :n "l" 'avy-move-line
      :prefix ("M-g g" . "Avy goto")
      :n "c" 'avy-goto-char-2
      :n "l" 'avy-goto-line
      )

