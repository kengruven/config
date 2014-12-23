;;
;; Ken's .emacs!
;;

;; Requires (>= emacs-major-version 24) for MELPA, at least.  I
;; should probably add a check for that.

;; To use this: paren-activate (below) is mic-paren, which is a
;; package installed through MELPA.  Run the 3 lines below, then run
;; (list-packages), and install mic-paren (i, then x).
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(tool-bar-mode 0)
(column-number-mode t)

(setq visible-bell t)

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
(global-set-key [up] (lambda () (interactive) (scroll-down 1)))
(global-set-key [down] (lambda () (interactive) (scroll-up 1)))
(global-set-key [left] (lambda () (interactive) (scroll-right tab-width t)))
(global-set-key [right] (lambda () (interactive) (scroll-left tab-width t)))

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
