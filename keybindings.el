;;; ~/.doom.d/keybindings.el -*- lexical-binding: t; -*-

(load! "./functions.el")

(after! org
  (map! :map org-mode-map
        :ni "M-p" #'make-python-src-block!))

(defvar my-keys-minor-mode-map
  (let ((myMap (make-sparse-keymap)))
    (map! :after 'python :map myMap
          :n "C-c C-c"
          #'python-shell-send-buffer)
    (map! :n "g K" #'dash-at-point)
    (map! :after 'org :map org-mode-map
          :n "M-p" #'make-python-src-block!)
    (map! :after 'org-src :map org-src-mode-map
          :n "M-p" #'lsp-python-enable)
    (map! :map myMap
          :i "<tab>" #'indent-or-complete)
    myMap)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter "my-keys")

(my-keys-minor-mode 1)

(map! :n "L" #'avy-goto-line)

(map! :i "H-d" 'dabbrev-expand)

(map! :after avy
      :prefix "M-g"
      :n "k" 'avy-kill-region
      :prefix ("M-g m" . "Avy move")
      :n "r" 'avy-move-region
      :n "l" 'avy-move-line
      :prefix ("M-g g" . "Avy goto")
      :n "c" 'avy-goto-char-2
      :n "l" 'avy-goto-line)


(map!
 :n "H-1" '+workspace/switch-to-0
 :n "H-2" '+workspace/switch-to-1
 :n "H-3" '+workspace/switch-to-2
 :n "H-4" '+workspace/switch-to-3
 :n "H-5" '+workspace/switch-to-4
 :n "H-6" '+workspace/switch-to-5
 :n "H-7" '+workspace/switch-to-6)


