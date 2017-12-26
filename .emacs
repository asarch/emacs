;; $HOME/.emacs -*-emacs-lisp-*-

;; Setting the diary's file.
;; NOTE: This line MUST precede the next one
(setq diary-file "~/.emacs-diary")

;; 24 Hour time format
(setq display-time-24hr-format t)

;; Hooking the diary's file appointments
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
(mouse-wheel-mode)

;; Enabling zone amusement
(zone)

;; From man man:
;;
;; If you add the line
;; (global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))
;;
;; to your .emacs file, then hitting F1 will give you the man page for the
;; library call at the current cursor position.
(global-set-key [(f1)] (lambda()(interactive)(manual-entry (current-word))))

;; Show line numbers
(global-linum-mode t)

;; Keeping identation level
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Disable backup files
(setq make-backup-files nil)

;; Enable tool-bar mode
(tool-bar-mode)

;; Using a mouse in terminal emulators
(xterm-mouse-mode t)

;; Truncate lines
(setq truncate-lines t)

;; Set the frame's title bar
(setq frame-title-format "emacs - %f")

;; Set the default font face for X11 sessions
(set-default-font "Monospace-11")

;; Save history files
(savehist-mode 1)

;; Highlight the current line
(global-hl-line-mode)

;; Save current desktop session
;; More info: https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html
(desktop-save-mode 1)
