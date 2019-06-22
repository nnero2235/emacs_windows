;; ui config

;; load theme 
(load-theme 'spacemacs-light t)

;; Close title bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; show global line number
(global-linum-mode t)

;; enabled () auto complete
(electric-pair-mode t)

;;change cursor to thick
(setq-default cursor-type 'bar)

;;close init splash screen
(setq inhibit-splash-screen 1)

;;high-light current cursor line
(global-hl-line-mode 1)

;;font consolas size:14 and font chinese
(set-default-font "Consolas-16")
(set-fontset-font "fontset-default" 'chinese-gbk "微软雅黑")

;;set full screen when start
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;export
(provide 'init-ui)
