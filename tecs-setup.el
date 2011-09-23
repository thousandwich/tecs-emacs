;; temporary stuff for testing until I put this in my .emacs file

(add-to-list 'load-path "/home/aaron/dev/tecs-emacs")

(autoload 'tecs-asm-mode "tecs-asm.el")
(autoload 'tecs-vm-mode "tecs-vm.el")
(autoload 'tecs-vm-mode "tecs-jack.el")

(add-to-list 'auto-mode-alist '("\\.asm$" . tecs-asm-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . tecs-vm-mode))
(add-to-list 'auto-mode-alist '("\\.jack$" . tecs-jack-mode))
