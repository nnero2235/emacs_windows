;;keymap binding config

;;bind <f2> to open my "init.el" file
(defun open-init-file()
  (interactive)
  (dired "C:\\Users\\NNERO\\AppData\\Roaming\\.emacs.d"))
(global-set-key (kbd "<f2>") 'open-init-file)

;;bind c-d:kill-line c-k:delete char
(global-set-key (kbd "\C-d") 'kill-whole-line)
(add-hook 'c-mode-hook (lambda()
                         (local-set-key (kbd "\C-d") 'kill-whole-line)))
(global-set-key (kbd "C-K") 'delete-char)

;;make copy paste undo to windows usual.
(global-set-key (kbd "C-Z") 'undo)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-n") 'scroll-up-command)
(global-set-key (kbd "M-m") 'scroll-up-command)

;;bind c-t to org-mode todo
;;(global-set-key (kbd "C-t") 'org-todo)

;;bind open recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;copy line
(defun copy-line()
  (interactive)
  (progn
    (move-end-of-line 1)
    (kill-ring-save (line-beginning-position)
		    (line-end-position))
    (newline)
    (yank)))
(global-set-key (kbd "\C-y") 'copy-line)

;;comment line
(defun comment-line()
  (interactive)
  (progn
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
     (next-line 1)))
(global-set-key (kbd "C-/") 'comment-line)

;;bind <f5> compile c/c++ source code and run target program
(global-set-key (kbd "<f8>") (lambda ()
                               (interactive)
                               (progn
                                 (switch-to-buffer-other-window "*runresult*")
                                 (insert "*****************************************running....   output:\n")
                                 (insert (shell-command-to-string "wmake -C f:\\code\\go\\c_program\\"))
                                 (insert (shell-command-to-string "f:\\code\\c\\c_program\\build\\program.exe"))
                                 (other-window -1))))

;; <f6> to "run go filename.go show in shell"
(defun go-run-current-buffer ()
  "save current buffer to file then exec it (go run file)"
  (interactive)
  (let ((go-source-filename (buffer-file-name (current-buffer))))
    (when go-source-filename
      (save-excursion
        (save-buffer)
        (let ((cmd (concatenate 'string
                                "go run "
                                go-source-filename)))
          (progn
            (message (concatenate 'string
                                  "\n################# "
                                  cmd
                                  " #################"))
            (shell-command cmd cmd)))))))
(global-set-key (kbd "<f6>") 'go-run-current-buffer)
                                 

;;bind <f3> to open work directory
(global-set-key (kbd "<f3>") (lambda ()
                               (interactive)
                               (dired "f:\\orgs\\")))

;;bind <f3> to open work directory
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (dired "f:\\code\\go\\")))
;;goimports C-c C-r
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;swiper and counsel in ivy mode
(ivy-mode 1)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;magit kbd
(global-set-key (kbd "C-x g") 'magit-status)

;; insert current time quickly
(defun now()
  (interactive)
  (insert (current-time-string)))

;; company c-n c-p
;;(setq company-active-map t)
(define-key company-active-map "\C-n" 'company-select-next)
(define-key company-active-map "\C-p" 'company-select-previous)

(provide 'init-keymap)
;;; init-keymap.el ends here
