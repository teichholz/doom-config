;;; ~/.doom.d/vars.el -*- lexical-binding: t; -*-


(setq mac-command-modifier 'meta
      mac-option-modifier  'super
      mac-right-option-modifier 'hyper)

(setq flycheck-check-syntax-automatically '(mode-enabled save))


(after! helm-mode
  (helm-autoresize-mode 1)
  (setq helm-autoresize-min-height 35
	    helm-autoresize-max-height 35))

(setq tab-always-indent 'complete)

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
