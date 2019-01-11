;;; ~/.doom.d/keybindings.el -*- lexical-binding: t; -*-

(load! "./functions.el")

(after! org
  (map! :map org-mode-map
        :ni "M-p" #'make-python-src-block!))
(after! org-src
  (map! :map org-src-mode-map
        :n "M-p" #'lsp-python-enable))

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


(map! :i "M-c" #'+company/complete)
(map! :after js2-mode
      :map js2-mode-map
      :localleader
      :n "n s" #'nodejs-repl
      :n "n b" #'nodejs-repl-send-buffer
      :n "n r" #'nodejs-repl-send-region
      :n "s" #'setup-js)


(map! :after helm
      :leader
      :n "f l" #'helm-locate)

(map! :after evil
      :ng "M-f" 'swiper-helm)

(map! :after avy
      :prefix "M-g"
      :n "k" 'avy-kill-region
      :prefix ("M-g m" . "Avy move")
      :n "r" 'avy-move-region
      :n "l" 'avy-move-line
      :prefix ("M-g g" . "Avy goto")
      :n "c" 'avy-goto-char-2
      :n "l" 'avy-goto-line
      )


(map! :after js2-mode
      :map js2-mode-map
      :i "<tab>" #'indent-or-complete)
(map! :after emacs-lisp-mode
      :map emacs-lisp-mode-map
      :i "<tab>" #'indent-or-complete)
(map! :after python-mode
      :map python-mode-map
      :i "<tab>" #'indent-or-complete)
(map! :after c++-mode
      :map c++-mode-map
      :i "<tab>" #'indent-or-complete)
(map! :after c-mode
      :map c-mode-map
      :i "<tab>" #'indent-or-complete)
