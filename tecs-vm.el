
(defvar tecs-vm-syntax-table nil
  "Syntax table used in `tecs-vm-mode' buffers.")

(setq tecs-vm-keywords
 `((,(regexp-opt 
	  '("push" "pop" "label" "goto" "if-goto" "function" "return" "call"
		"add" "sub" "neg" "eq" "gt" "lt" "and" "or" "not") t) 
	. font-lock-function-name-face)
   (,(regexp-opt
	  '("argument" "local" "static" "constant" "this" "that" "pointer" "temp") t) 
	. font-lock-constant-face)))

(defun tecs-vm-indent (&optional arg)
  "Indents the line properly"
  (interactive)
  (indent-to-left-margin))

;; the command to comment/uncomment text
(defun tecs-vm-comment-dwim (arg)
"Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start "//") (comment-end ""))
     (comment-dwim arg)))

(define-derived-mode tecs-vm-mode fundamental-mode
  (setq font-lock-defaults '(tecs-vm-keywords))
  (setq mode-name "vm")

  ;; modify the keymap
  (define-key tecs-vm-mode-map [remap comment-dwim] 'tecs-vm-comment-dwim)

  (set (make-local-variable 'indent-line-function) 'tecs-vm-indent)

  ;; // comment
  (modify-syntax-entry ?\/ ". 12b" tecs-vm-syntax-table)
  (modify-syntax-entry ?\n "> b" tecs-vm-syntax-table))

(provide 'tecs-vm-mode)
