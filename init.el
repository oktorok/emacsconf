;;MELPA

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;unbind control z
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-display-line-numbers-mode)
;;Load packages directory
(add-to-list 'load-path "~/.emacs.d/packages")

;;enable copy clipboard



;; configuration go
(require 'company)
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)
			  (setq company-tooltip-limit 20)                      ; bigger popup window
			  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
			  (setq company-echo-delay 0)                          ; remove annoying blinking
			  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
			  (autoload 'go-mode "go-mode" nil t)
			  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))))

;;load elpy
(elpy-enable)
(eval-after-load "elpy"
  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq python-shell-interpreter "python3")
	    (setq indent-tabs-mode t)
	    (setq python-indent-offset 4)
	    (setq tab-width 4))
	  (tabify (point-min) (point-max)))

;;tabs para modo html
(add-hook 'html-mode-hook
	  (lambda()
	    (setq tab-width 4)
	    (setq sgml-basic-offset 4)
	    (setq indent-tabs-mode t)))


;;tabs for cpp mode
(add-hook 'c++-mode-hook
	  (lambda()
	    (setq c-basic-offset 8
		  tab-width 8
		  indent-tabs-mode t)))


;;load windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

;;Configure desktop saving
(desktop-save-mode 1)

;;Configure mouse scroll
(mouse-wheel-mode t)
(load "mouse_wheel_move_cursor")

;;Save backup files in tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(package-selected-packages
   (quote
    (xclip avy bind-key company-go company auto-complete js2-mode elpy)))
 '(scroll-margin 0)
 '(scroll-step 1)
 '(select-enable-clipboard nil)
 '(select-enable-primary t)
  '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
