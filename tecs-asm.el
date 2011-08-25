
(defvar tecs-asm-syntax-table nil
  "Syntax table used in `tecs-asm-mode' buffers.")

;; TODO should predefined addresses display differently?
;; or literal values?
(setq tecs-asm-keywords
	  '(("@.*\\|(.*?)" . font-lock-constant-face)))

;; TODO don't re-indent if already correct (do move though)
;; TODO allow the indentation to be taken from indent-tabs-mode and tabs-width
(defun tecs-asm-indent (&optional arg)
  "Indents the line properly"
  (interactive)
  (let ((movep (looking-back "^[\s\t]*"))
		(move-to nil))
	(save-excursion
	  (move-beginning-of-line nil)
	  (while (looking-at "[\s\t]")
		(delete-char 1))
	  (unless (looking-at "(")
		(insert "    "))
	  (setq move-to (point)))
	(when movep
	  (goto-char move-to))))

;; the command to comment/uncomment text
(defun tecs-asm-comment-dwim (arg)
"Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start "//") (comment-end ""))
     (comment-dwim arg)))

(define-derived-mode tecs-asm-mode fundamental-mode
  (setq font-lock-defaults '(tecs-asm-keywords))
  (setq mode-name "asm")

  ;; modify the keymap
  (define-key tecs-asm-mode-map [remap comment-dwim] 'tecs-asm-comment-dwim)

  ;; default is indent-relative
  (set (make-local-variable 'indent-line-function) 'tecs-asm-indent)

  ;; // as comments
  ;; I have no idea how this works
  (modify-syntax-entry ?\/ ". 12b" tecs-asm-syntax-table)
  (modify-syntax-entry ?\n "> b" tecs-asm-syntax-table))

(provide 'tecs-asm-mode)
