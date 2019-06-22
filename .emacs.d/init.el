;; this is my config main file to combine module configs
;; -------------------------------------------------- auto create emacs------
;; this is must be exist for emacs auto create.
(package-initialize)
;; this is also emacs auto create
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-go spacemacs-theme lua-mode company-ycmd ycmd smooth-scrolling soft-stone-theme github-theme anti-zenburn-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ----------------------------------------------------auto create emacs-----

;; load config file path
(add-to-list 'load-path "C:\\Users\\NNERO\\AppData\\Roaming\\.emacs.d\\elisp")

;;modules
(require 'init-packages)
(require 'init-ui)
(require 'init-default)
(require 'init-keymap)
