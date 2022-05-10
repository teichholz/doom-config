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
 ;; :i "(" 'own/open-paren
 :i "{" 'own/open-brace)
