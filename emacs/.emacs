(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/lisp")

(setq package-enable-at-startup nil)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(package-initialize)
(exec-path-from-shell-initialize)
(setq tab-width 4) 
(setq c-default-style "linux"
      c-basic-offset 4)
(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'go-mode-hook (lambda () (setq tab-width 4)))
;;(require 'tangotango-theme)
;;(require 'tango-2-theme)
(setq-default tab-width 4)
(require 'sanityinc-tomorrow-eighties-theme)
(require 'auto-complete)
(ac-config-default)
(global-display-line-numbers-mode)
(require 'web-beautify)
(global-set-key (kbd "C-c g") 'avy-goto-char)
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/rishi.org"))
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq x-select-enable-clipboard t)

(require 'haskell-style)
(add-hook 'haskell-mode-hook #'haskell-style)
(add-hook 'before-save-hook #'gofmt-before-save)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


