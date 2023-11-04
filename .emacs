;;
;; Ken's .emacs!
;;

;; TODO: update with use-package -- https://github.com/jwiegley/use-package

;; Requires (>= emacs-major-version 24) for MELPA, at least.  I
;; should probably add a check for that.

;; from <https://stackoverflow.com/a/5058752>
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; PACKAGES TO INSTALL:
;; - js2-mode
;; - git-gutter
;; - mic-paren
;; - markdown-mode
;; - racket-mode
;; - e2ansi

;; To use this: paren-activate (below) is mic-paren, which is a
;; package installed through MELPA.  Run the 3 lines below, then run
;; (list-packages), and install mic-paren (i, then x).
(require 'package)
;; (package-initialize)  ;; no longer necessary, as of 27.1
;; default package-archives: ("gnu" . "https://elpa.gnu.org/packages/")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (setq package-archives ())

(tool-bar-mode 0)
(column-number-mode t)

;; from a comment on:
;; <http://stuff-things.net/2015/10/05/emacs-visible-bell-work-around-on-os-x-el-capitan/>
(setq visible-bell t
      ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil 'invert-face 'mode-line)))


(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(global-hl-line-mode)

;; mic-paren, better than show-paren-mode:
(package-initialize)
(paren-activate)
(setq paren-highlight-offscreen t)

;; i hate "progress"
(setq line-move-visual nil)
(setq recenter-positions '(middle))
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(put 'narrow-to-region 'disabled nil)

(setq-default indent-tabs-mode nil)

;; derekslager's clever scrolling idea:
;; FUTURE: should i use scroll-*-command rather than scroll-* now?
(global-set-key [up] (lambda (n) (interactive "P") (scroll-down (or n 1))))
(global-set-key [down] (lambda (n) (interactive "P") (scroll-up (or n 1))))
(global-set-key [left] (lambda (n) (interactive "P") (scroll-right (* tab-width (prefix-numeric-value n)) t)))
(global-set-key [right] (lambda (n) (interactive "P") (scroll-left (* tab-width (prefix-numeric-value n)) t)))

;; omit boring files
(eval-after-load "dired"
  '(require 'dired-x))
(add-hook 'dired-mode-hook
          (lambda () (dired-omit-mode 1)))

;; show boring spaces
(require 'whitespace)
(setq-default show-trailing-whitespace t)

;; don't put backup files where i'm working
(setq backup-directory-alist `(("." . "~/.saves")))

;;(require 'git-gutter)
(global-git-gutter-mode t)
(custom-set-variables
 '(git-gutter:update-interval 2))

(defalias 'yes-or-no-p 'y-or-n-p)

;; inspired by <http://stackoverflow.com/a/25438277>:
(when (eq system-type 'darwin)
  (mouse-wheel-mode -1)
  (global-set-key [wheel-up] 'ignore)
  (global-set-key [wheel-down] 'ignore)
  (global-set-key [double-wheel-up] 'ignore)
  (global-set-key [double-wheel-down] 'ignore)
  (global-set-key [triple-wheel-up] 'ignore)
  (global-set-key [triple-wheel-down] 'ignore)
  (global-set-key [wheel-left] 'ignore)
  (global-set-key [wheel-right] 'ignore)
  (global-set-key [double-wheel-left] 'ignore)
  (global-set-key [double-wheel-right] 'ignore)
  (global-set-key [triple-wheel-left] 'ignore)
  (global-set-key [triple-wheel-right] 'ignore))

;; install js2-mode from MELPA
(require 'js2-mode)  ;; not sure why i need this, but it fixes things
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; note: install zenburn-theme from MELPA
;;(load-theme 'zenburn t)

(ido-mode)

;; use C-j to activate
(require 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
;; FUTURE: maybe also 'sgml-mode-hook?
