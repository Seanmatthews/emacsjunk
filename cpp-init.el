;; open .emacs file with F12
;; put this at top so it loads even if you have other problems in this file
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file-other-window user-init-file)))

;; Don't create backup files. I hate them.
(setq make-backup-files nil)

(require 'cc-mode)

;; additional package repo
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("marmalade". "http://marmalade-repo.org/packages/")
						 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; basic C++ standards
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; electric pair mode replaces autopair below-- it's automatic bracket insertion, etc
(electric-pair-mode 1)

;; basic autocomplete with default configuration
(require 'auto-complete-config)
(ac-config-default)

;; add iron hooks for c++
(add-hook 'c++-mode-hook 'irony-mode)

;; replace the completion-at-point and complete-symbol bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; flycheck checks syntax on the fly
(require 'flycheck)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


;; yasnippet configuration
;; load before auto-complete
;;(require 'yasnippet)
;;(yas-global-mode 1)

;; autocompelte
;; load after yasnippet
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
;;(ac-set-trigger-key "TAB")
;;(ac-set-trigger-key "<tab>")

;; replace C-S-<return> with a key binsing that you want
;;(add-to-list 'load-path "~/.emacs.d/")
;;(load "auto-complete-clang.el")
;;(require 'auto-complete-clang)
;;(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)

;; 

