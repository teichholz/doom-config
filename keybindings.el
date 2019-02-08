;;; ~/.doom.d/keybindings.el -*- lexical-binding: t; -*-

(after! org
  (map! :map org-mode-map
        :ni "M-p" #'make-python-src-block!))

(map! :n "g K" #'dash-at-point)
(map! :n "L" #'avy-goto-line)
(map! :i "H-d" 'dabbrev-expand)

(map! :after drag-stuff
      :n "M-H-j" #'drag-stuff-down
      :n "M-H-k" #'drag-stuff-up)

(map! :after avy
      :prefix "M-g"
      :n "k" 'avy-kill-region
      :prefix ("M-g m" . "Avy move")
      :n "r" 'avy-move-region
      :n "l" 'avy-move-line
      :prefix ("M-g g" . "Avy goto")
      :n "c" 'avy-goto-char-2
      :n "l" 'avy-goto-line)

(map! :n "U" #'undo-tree-redo)

(map! :g "s-," #'previous-buffer
      :g "s-." #'next-buffer)

(map! :map dired-mode-map
      :n "F" 'counsel-dired-jump)

(map! :n "s-w" 'jp-window/body)

(map!
 :n "H-1" '+workspace/switch-to-0
 :n "H-2" '+workspace/switch-to-1
 :n "H-3" '+workspace/switch-to-2
 :n "H-4" '+workspace/switch-to-3
 :n "H-5" '+workspace/switch-to-4
 :n "H-6" '+workspace/switch-to-5
 :n "H-7" '+workspace/switch-to-6)
