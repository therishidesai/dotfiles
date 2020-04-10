(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(package-initialize)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(haskell-mode rust-mode multiple-cursors color-theme-sanityinc-tomorrow avy go-mode web-beautify hc-zenburn-theme tango-2-theme tangotango-theme molokai-theme evil-visual-mark-mode auto-complete))))
(defun turn-on-subword-mode ()
  (interactive)
  (subword-mode 1))
(defun my-haskell-mode-hook ()
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space))
(custom-set-variables
 '(haskell-mode-hook
   (quote
    (interactive-haskell-mode 
     turn-on-haskell-indent 
     turn-on-subword-mode
     turn-on-haskell-decl-scan 
     my-haskell-mode-hook)))
 '(haskell-process-type 'cabal-repl))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'before-save-hook #'gofmt-before-save)
