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

(defun insert-shell-option (cmd)
  (interactive "sCommand: ")
  (require 'pcmpl-args)
  (require 'helm)
  (let ((options ()))
    (dolist (item (pcmpl-args-extract-argspecs-from-manpage cmd))
      (let ((option (plist-get item 'option))
            (help (plist-get item :help)))
        (push (cons (with-temp-buffer
                      (insert help)
                      (let ((fill-column 80))
                        (fill-paragraph))
                      (goto-char (point-min))
                      (insert (format "%s\n" option))
                      (buffer-string))
                  (format "%s" (plist-get item 'option)))
            options)))
    (helm (helm-build-sync-source "Options: "
            :candidates (nreverse options)
            ;; :multiline t
            :action #'insert))))

(defun own/updatedb ()
  (interactive)
  (async-shell-command "cd $HOME;sudo /usr/libexec/locate.updatedb -I 0 -U $HOME"))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
         (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defun launch-in-adobe (file)
  (async-shell-command (concat "open -a 'Adobe Acrobat Reader DC' " (shell-quote-argument file)))
  (kill-this-buffer))
