;;; ~/.doom.d/keybindings.el -*- lexical-binding: t; -*-

(defvar my-keys-minor-mode-map
  (let ((myMap (make-sparse-keymap)))
    (map! :after 'python :map python-mode-map
          :n "C-c C-c"
          #'python-shell-send-buffer)
    (map! :n "g K" #'dash-at-point)
    (map! :i "M-c" #'+company/complete)
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
