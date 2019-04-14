;; Leichtes markieren mit Hyper m
(map! :after helm
      :map (helm-find-files-map helm-buffer-map helm-M-x-map)
      "H-m" 'helm-toggle-visible-mark)
;; Universelle Argument in helm buffern
(map!
 :map helm-map
 "C-u" 'universal-argument)

(map! :n "U" #'undo-tree-redo)


(map!
 :prefix "H-h"
 :n "H-w" 'jp-window/body
 :n "H-c" 'hydra-flycheck/body
 :n "H-f" 'hydra-flycheck/body
 :map prog-mode-map
 :n "H-l" 'hydra-lsp/body
 :map projectile-mode-map
 :n "H-p" 'hydra-projectile/body)
(map! :n
      "H-w" 'jp-window/body)
(map! :map dired-mode-map
      :n "." 'hydra-dired/body)

(map! :i "M-v" 'evil-paste-before)
(map! :map +popup-mode-map
      :ni "M-r" '+popup/raise)

(after! which-key
  (define-key which-key-mode-map (kbd "<f1> C-h") 'which-key-C-h-dispatch))

;; in evil integriert via evil-escape-key-sequence
;; (general-def :states 'insert
;;   "j" (general-key-dispatch 'self-insert-command
;;         :timeout 0.25
;;         "k" 'evil-normal-state))

(map!
 :n "H-1" '+workspace/switch-to-0
 :n "H-2" '+workspace/switch-to-1
 :n "H-3" '+workspace/switch-to-2
 :n "H-4" '+workspace/switch-to-3
 :n "H-5" '+workspace/switch-to-4
 :n "H-6" '+workspace/switch-to-5
 :n "H-7" '+workspace/switch-to-6)

;; Leichtes Scrollen auf US Layout
(map!
 :n "H-j" 'evil-scroll-line-down
 :n "H-k" 'evil-scroll-line-up)

;; Eigenes Prefix fuer dies und das
(map!
 :map prog-mode-map
 :prefix "q"
 :n "q" 'evil-record-macro
 :n "f" 'avy-goto-char-2
 :n "s" 'helm-swoop)


(map!
 :n "*" 'symbol-overlay-put)

(map!
 :n "<C-tab>" 'nswbuff-switch-to-next-buffer
 :n "<H-tab>" 'nswbuff-switch-to-previous-buffer)

(map!
 :n "J" 'avy-goto-char-2)

(map!
 :map dired-mode-map
 :n "%" nil
 :n "%u" #'dired-upcase
 :n "%l" #'dired-downcase
 :n "%d" #'dired-flag-files-regexp
 :n "%g" #'dired-mark-files-containing-regexp
 :n "%m" #'dired-mark-files-regexp
 :n "%r" #'dired-do-rename-regexp
 :n "%C" #'dired-do-copy-regexp
 :n "%H" #'dired-do-hardlink-regexp
 :n "%R" #'dired-do-rename-regexp
 :n "%S" #'dired-do-symlink-regexp
 :n "%&" #'dired-flag-garbage-files
 :n "%n" #'dired-narrow-regexp
 ;; dired subtree
 :n "<tab>" #'dired-subtree-cycle)

(map!
 :after evil-matchit
 :map dired-mode-map
 :n "#" dired-filter-map)
