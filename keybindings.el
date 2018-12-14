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

(map! :after helm
      :leader
      :n "f l" #'helm-locate)

(after! js2-mode
  (defun setup-js ()
    "Eigene Fuktion zum erstellen einer jsconfig.json"
    (interactive)
    (save-excursion
      (let ((buffer (create-file-buffer "jsconfig.json")))
        (switch-to-buffer buffer)
         (insert "{
          \"compilerOptions\": {
          \"target\": \"es2017\",
          \"allowSyntheticDefaultImports\": true,
          \"noEmit\": true,
          \"checkJs\": true,
          \"jsx\": \"react\"
          \"lib\": [ \"dom\" \"es2017\" ]
          }
         }
        ")
        (set-visited-file-name "jsconfig.json")
        (save-buffer)
        (kill-buffer buffer))))
  (map! :localleader :n "s" #'setup-js))
