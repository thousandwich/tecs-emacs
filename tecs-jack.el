
(define-derived-mode tecs-jack-mode c-mode
  ;; (setq font-lock-defaults '(tecs-vm-keywords))
  (setq mode-name "jack")

  ;; modify the keymap
  ;; (define-key tecs-vm-mode-map [remap comment-dwim] 'tecs-vm-comment-dwim)

  ;; (set (make-local-variable 'indent-line-function) 'tecs-vm-indent)

  ;; // comment
  ;; (modify-syntax-entry ?\/ ". 12b" tecs-vm-syntax-table)
  ;; (modify-syntax-entry ?\n "> b" tecs-vm-syntax-table))
  )

(provide 'tecs-vm-mode)
