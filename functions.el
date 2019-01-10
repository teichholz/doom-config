;;; ~/.doom.d/functions.el -*- lexical-binding: t; -*-

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
        (kill-buffer buffer)))))
