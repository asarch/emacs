;; $HOME/.emacs -*-emacs-lisp-*-

;;--------------------------------------------------------------------
;;  SBCL - QuickLisp
;;--------------------------------------------------------------------

;; Nota: QuickLisp es para SBCL.
;;
;; Su metodo de instalacion lo puedes checar en:
;;
;; https://www.quicklisp.org/beta/
;;
;; Pero rapidamente:
;;
;; 1. Descarga el script "quicklist.lisp" y guardalo en $HOME/Projects:
;;
;;    https://beta.quicklisp.org/quicklisp.lisp
;;
;; 2. Carga el script:
;;
;;    [$] sbcl --load $HOME/Projects/quiclist.lisp
;;
;; 3. Ejectualo:
;;
;;    sbcl> (quicklisp-quickstart:install)
;;
;; 4. Sigue las instrucciones para agregar las extensiones.

;;--------------------------------------------------------------------
;; SLIME Installation
;;--------------------------------------------------------------------

;; From: http://melpa.org/#/getting-started
;;
;; M-x package-refresh-contents
;; M-x package-install RET slime RET

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;--------------------------------------------------------------------
;; SLIME - Configuration
;;--------------------------------------------------------------------

;; From: https://common-lisp.net/project/slime/doc/html/Installation.html#Installation
;; - Para iniciar Slime: M-x slime
;; - Para cambiar el interprete: C-u M-x slime
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")

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

;; Disable #*# files
(setq auto-save-default nil)

;; Highlight the current line
(global-hl-line-mode)

;; Save current desktop session
;; More info: https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html
(desktop-save-mode 1)

;; From pjb@#lisp.FN: https://www.emacswiki.org/emacs/CategoryParentheses
;; Show Paren Mode: https://www.emacswiki.org/emacs/ShowParenMode
(show-paren-mode 1)
