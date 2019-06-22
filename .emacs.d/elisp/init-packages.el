;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; set china plugin sources urls
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;;enabled common lisp keyword for loop
(require 'cl)

;;add packages
(defvar nnero/packages '(
			 ;; ---Auto Complete anything----
			 company
                         ;; --- go complete ----
                         company-go
			 ;; ---- make c-n c-p smooth ----
			 smooth-scrolling
			 ;; ---- theme ----
			 soft-stone-theme
			 ;; ---- ehenced M-x ----
			 swiper
			 ;; ----- swiper needs this ----
			 counsel
			 ;; -----markdown mode smartparens needs ----
			 markdown-mode
			 ;; ---- auto complete () ----
			 smartparens
			 ;; ----- pop win to open file ---
			 popwin
                         ;; ----- flycheck to tip my source file syntax error ---
                         flycheck
                         ;;flycheck-ycmd
                         ;; ---- ycmd and it dependency package ---
                         ;;ycmd
                         ;;company-ycmd
                         ;; ---- magit inner git management----
                         magit
			 ) "NNERO packages")

(setq package-selected-packages nnero/packages)

;;define function: packages install when pkg is not installed then install
(defun nnero/packages-installed-p()
  (loop for pkg in nnero/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

;;run code to install packages when is not installed
(unless (nnero/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg nnero/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;export
(provide 'init-packages)
;;; init-packages.el ends here
