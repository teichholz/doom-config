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

;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell
;;          (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))


(defun turn-on-dired-filter-mode ()
  (interactive)
  (dired-filter-mode 1)
  (dired-filter-group-mode 1))

(defun turn-on-evil-avy-mode ()
  (interactive)
  (evil-avy-mode 1))
(defun turn-off-evil-avy-mode ()
  (interactive)
  (evil-avy-mode 0))

(defun vpn-fb4-connect ()
  (interactive)
  ;; (make-process
  ;;  :name "fb4-vpn"
  ;;  :buffer "*fb4-vpn*"
  ;;  :coding 'utf-8
  ;;  :command (list "ikec"
  ;;                 "-r fb4"
  ;;                 "-u tieic002"
  ;;                 "-p Annaanna2"
  ;;                 "-a"))
  ;; (start-process "fb4-vpn" "*vpn*" "ikec" "-r fb4" "-u tieic002" "-p Annaanna2" "-a")
  (start-process-shell-command "fb4-vpn" "*vpn*" (concat "ikec -r fb4 -u tieic002 "
                                                         "-p "
                                                         ;; Ruft die Funktion auf, die das Passwort fuer die Fh-Dortmund ausgibt
                                                         (funcall (let ((auth-sources '(macos-keychain-generic)))
                                                                    (plist-get (nth 0
                                                                                    (auth-source-search :max 1 :user "tieic002" :label "fh-dortmund")) :secret)))
                                                         " -a")))

(defun toggle-vpn-fb (universal)
  "Stellt eine VPN Verbindung zum FB4 her, wenn keine besteht. Besteht eine so wird diese beendet"
  (interactive "P")
  (let ((status (process-status "fb4-vpn")))
    (cond
     ((eq status 'run) (kill-process "fb4-vpn"))
     (t (vpn-fb4-connect)))))

(defun mount-fb4 ()
  "sudo sshfs -o allow_other,defer_permissions root@xxx.xxx.xxx.xxx:/ /mnt/droplet"
  (interactive)
  (shell-command "sudo sshfs -o allow_other,defer_permissions,fsname=Datenbanken sysadmin@172.22.160.125:/ /mnt/mdb"))

(defun tramp-fb4 ()
  (interactive)
  (find-file "/ssh:sysadmin@172.22.160.125|sudo:localhost:/home/sysadmin"))

(defun save-prog-major-mode ()
  (setq prog-major-mode
        (case major-mode
          ((emacs-lisp-mode) "emacs-lisp")
          ((python-mode) "python")
          ((c++-mode) "c++")
          ((js2-mode) "js")
          ((racket-mode) "scheme")
          ((java-mode) "java"))))

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (helm--completing-read-default "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))


(defmacro with-helm (&rest body)
  `(let ((completing-read-function 'helm--completing-read-default)
         (read-file-name-function  'helm--generic-read-file-name)
         (read-buffer-function  'helm--generic-read-buffer)
         ('helm--completion-in-region  completion-in-region-function))
     ,@body))

(defun wrap-line ()
  (interactive)
  (save-excursion
    (back-to-indentation)
    (kill-region
     (point)
     (line-end-position)))
  (insert "if(" (concat "" (yank)) ")" "\n" "{\n}")
  (message "wrapped"))


(defun turn-off-lsp-ui-doc ()
  (interactive)
  (lsp-ui-doc-mode 0))
