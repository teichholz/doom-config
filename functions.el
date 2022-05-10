;;; ~/.doom.d/functions.el -*- lexical-binding: t; -*-





(require 'dash)

(defun own/run-compiler ()
  (interactive)
  (let* ((root "/home/tim/sciebo/Dokumente/bt/Schemer/")
         (file (ivy-read "Choose file to complile:" (f-files (concat root "programs/"))))
         (bin (concat root "checkprogs.sh")))
    ;; shell-command expects the arguments to be relative to its program
    (shell-command
     (concat bin " " file))))


(defun own/make-heading (heading)
  (interactive "sHeading: ")
  (let ((format-string
         "-------------------------------------------------------------------------------
-- %s
-------------------------------------------------------------------------------"))
    (insert (format format-string heading))
    (next-line)))


(defun own/concat-strs (strs)
  (let ((strs (seq-map-indexed (lambda (e i) `(,e ,i)) strs)))
    (let (ret) (dolist (x strs ret)
                 (if (= 0 (cadr x))
                     (setq ret (concat ret (car x)))
                   (setq ret (concat ret " " (car x))))))))

(setq white '(?\ ?\n ?\t ?\( ?\) ?\{ ?\}))

(defun own/open-paren ()
  (interactive)
  (if (not (member (char-after (+ (point) 1 )) white))
      (save-excursion
        (progn
          (let ((beg) (end))
            (setq beg (point))
            (evil-inner-WORD)
            (setq end (point))
            (evil-surround-region beg end nil ?\)))))
    (self-insert-command 1)))


(defun own/open-brace ()
  (interactive)
  (if (not (member (char-after (+ (point) 1 )) white))
      (save-excursion
        (progn
          (let ((beg) (end) (startl) (endl))
            (setq beg (point))
            (setq startl (line-beginning-position))
            (evil-inner-paragraph)
            (setq end (point))
            (setq endl (line-end-position))
            (evil-surround-region beg end nil ?\})
            (+format/region startl endl))))
    (self-insert-command 1)))
