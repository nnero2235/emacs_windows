;;; package --- Summary

;;disabled backup files and auto-save
(setq-default make-backup-files nil)
(setq auto-save-default nil)


;;enabled delete selection mode

(delete-selection-mode 1)

;;enabled smooth-scrolling-mode
;;(smooth-scrolling-mode -1)

;;open popwindow mode
(require 'popwin)
(popwin-mode 1)

;;open global complete any things
(global-company-mode t)

;;set reading encoding
(prefer-coding-system 'utf-8)
;;set writing encoding
(setq buffer-file-coding-system 'utf-8)

;;open smartparens
;(require 'smartparens-config)

;; indent 4 spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; open recent file mode
(require 'recentf)
(recentf-mode 1)

(setq default-directory "f:\\code")

;; c/c++ config
;;(require 'ycmd)
;;(add-hook 'c++-mode-hook #'global-ycmd-mode)
;;(set-variable 'ycmd-server-command '("python" "f:\code\YouCompleteMe\third_party\ycmd\ycmd"))
;;(set-variable 'ycmd-global-config "c:\\Users\\NNERO\\AppData\\Roaming\\.emacs.d\\.ycm-extra-conf.py")
;;(require 'company-ycmd)
;;(company-ycmd-setup)
;;(add-hook 'c-mode-hook 'imenu-add-menubar-index)
;;(add-hook 'c-mode-hook 'flycheck-mode)
;;(require 'flycheck-ycmd)
;;(flycheck-ycmd-setup)

;; go
(add-to-list 'load-path "C:\\Users\\NNERO\\AppData\\Roaming\\.emacs.d\\go_mode\\")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
;;(add-hook 'before-save-hook 'gofmt-before-save)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
(add-to-list 'load-path "f:\\code\\go\\src\\github.com\\dougm\\goflymake")
(require 'go-flymake)

;; enabled () high-light
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(defun sucha-insert-time-string () 
  "Insert the date in current position." 
  (interactive) 
  (insert (format-time-string "[%Y-%m-%d, %a]")))
(define-key text-mode-map "\C-c\i" 'sucha-insert-time-string)

(provide 'init-default)
;;; init-default.el ends here

