;;; ~/.doom.d/vars.el -*- lexical-binding: t; -*-


(setq mac-command-modifier 'meta
      mac-right-option-modifier 'hyper)

(if (equal (expand-file-name "~") "/Users/tim")
    (setq mac-option-modifier  nil)
  (setq mac-option-modifier 'super))

(setq flycheck-check-syntax-automatically '(mode-enabled save))


(after! helm-mode
  (helm-autoresize-mode 1)
  (setq helm-autoresize-min-height 35
	    helm-autoresize-max-height 35))

(setq tab-always-indent 'complete)
(setq which-key-idle-delay 1.0)

(setq helm-locate-command
      (case system-type
        ('gnu/linux "locate -i -r %s")
        ('berkeley-unix "locate -i %s")
        ('windows-nt "es %s")
        ('darwin "mdfind -name %s %s")
        (t "locate %s")))

(add-hook! lsp-mode
  (setq company-idle-delay nil))

(setq doom-localleader-key ",")

(setq doom-font (font-spec :family "Source Code Pro" :size 22))
