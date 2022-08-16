(map!
 ;; Undo Tree
 :n "u" #'undo-fu-only-undo
 :n "U" #'undo-fu-only-redo

 ;; Hippie expand
 :i "M-e" 'hippie-expand

 ;; Pasting
 :i "M-v" #'evil-paste-before

 :map +popup-mode-map
 :n "C-r" #'+popup/raise
 )

(map! :n "C-w u" 'winner-undo
      :n "C-w U" 'winner-redo)
;; Org

(map!
 :n "L" 'evil-end-of-line
 :n "H" 'evil-beginning-of-visual-line)

(map!
 :map doom-leader-map
 "." 'lsp-execute-code-action)

(map!
 :map (c++-mode-map c-mode-map)
 :n "g o" 'ff-find-other-file)

(map!
 :after sage-shell-mode
 :map sage-shell-mode-map
  "<C-M-return>" 'sage-shell-blocks:send-current)

(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))
