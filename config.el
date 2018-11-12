;; gets loaded after any modules

(def-package! dash-at-point)

(map!
 :after cc-mode
 :map (c-mode-map cpp-mode-map)
 :n "K" #'dash-at-point)
