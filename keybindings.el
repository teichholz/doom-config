;;; ~/.doom.d/keybindings.el -*- lexical-binding: t; -*-

(after! org
  (map! :map org-mode-map
        :ni "M-p" #'make-python-src-block!))

(map! :n "g K" #'dash-at-point)
(map! :i "H-d" 'dabbrev-expand)
(map! :i "H-x" 'evil-delete-backward-char
      :i "H-w" 'backward-kill-word)

 
(map! :after drag-stuff
      :n "C-M-j" #'drag-stuff-down
      :n "C-M-k" #'drag-stuff-up)

(map! :after avy
      :prefix "M-g"
      :n "k" 'avy-kill-region
      :n "r" 'avy-move-region
      :n "l" 'avy-move-lin
)
(map! :after helm
      :map (helm-find-files-map helm-buffer-map helm-M-x-map)
      "H-m" 'helm-toggle-visible-mark)

(map! :n "U" #'undo-tree-redo)

(map! :g "H-," #'previous-buffer
      :g "H-." #'next-buffer
      :g "H-[" #'previous-buffer
      :g "H-]" #'next-buffer)

(map! :map dired-mode-map
      :n "F" 'counsel-dired-jump)

(map! :g "M-?" #'avy-goto-char-2)

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

(map!
 :map prog-mode-map
 :prefix "q"
 :n "q" 'evil-record-macro
 :n "f" 'avy-goto-char-2 "f")

(map!
 :map helm-map
 "C-u" 'universal-argument)

(map!
 :n "<C-tab>" 'nswbuff-switch-to-next-buffer
 :n "<H-tab>" 'nswbuff-switch-to-previous-buffer)
