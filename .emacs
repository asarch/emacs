;; $HOME/.emacs -*-emacs-lisp-*-

;; Setting up the diary file
(setq diary-file "~/.emacs_diary")

;; Setting the appointments list
(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)

;; Enabling color syntax
(global-font-lock-mode t)

;; Show the column number
(setq column-number-mode t)

;; Enabling the highlight region
(setq transient-mark-mode t)

;; Turn on the mouse wheel message in X
;;(mouse-wheel-mode)

;; Enabling zone amusement
(zone)

;; Add F1 support to man pages
(global-set-key [(f1)] (lambda()(interactive)(manual-entry (current-word))))

;; Show line numbers
(global-linum-mode t)

;; Keeping identation level
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Disable backup files
(setq make-backup-files nil)





;; Setting the diary's file.
;; NOTE: This line MUST precede the next one
(setq diary-file "~/.emacs-diary")

;; Hooking the diary's file appointments
(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)

;; Enabling mouse wheel for scrolling
(mouse-wheel-mode)

;; From man man:
;;
;; If you add the line
;; (global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))
;;
;; to your .emacs file, then hitting F1 will give you the man page for the
;; library call at the current cursor position.
(global-set-key [(f1)] (lambda() (interactive) (manual-entry(current-word))))

;; Enable tool-bar mode
;; (tool-bar-mode)

;; Eanbling zone
(zone)

;; Using a mouse in terminal emulators
(xterm-mouse-mode t)

;; To see in which column are we
(setq column-number-mode t)

;; Truncate lines
;; (setq truncate-lines t)

;; Set the frame's title bar
;; (setq frame-title-format "emacs - %f")
