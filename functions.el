;;; ~/.doom.d/functions.el -*- lexical-binding: t; -*-

(defun setup-js ()
  "Eigene Fuktion zum erstellen einer jsconfig.json"
  (interactive)
  (save-excursion
    (let ((buffer (create-file-buffer "jsconfig.json")))
      (set-buffer buffer)
      (insert "{
          \"compilerOptions\": {
          \"target\": \"es2017\",
          \"allowSyntheticDefaultImports\": true,
          \"noEmit\": true,
          \"checkJs\": true,
          \"jsx\": \"react\",
          \"lib\": [ \"dom\", \"es2017\" ]
          }
         }
        ")
      (write-file "jsconfig.json")
      (kill-buffer buffer))))

(defun make-python-src-block! ()
  (interactive)
  (save-excursion
    (insert "#+BEGIN_SRC python" "\n" "\n" "#+END_SRC")))

(defun +workspace/switch-to-0 ()
  (interactive)
    (+workspace/switch-to 0))
(defun +workspace/switch-to-1 ()
  (interactive)
    (+workspace/switch-to 1))
(defun +workspace/switch-to-2 ()
  (interactive)
    (+workspace/switch-to 2))
(defun +workspace/switch-to-3 ()
  (interactive)
    (+workspace/switch-to 3))
(defun +workspace/switch-to-4 ()
  (interactive)
    (+workspace/switch-to 4))
(defun +workspace/switch-to-5 ()
  (interactive)
    (+workspace/switch-to 5))
(defun +workspace/switch-to-6 ()
  (interactive)
    (+workspace/switch-to 6))