;; Remove backup files
(setq make-backup-files nil)

;; Disable bars
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(menu-bar-mode -1)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; heaven and hell
(require 'color-theme-sanityinc-tomorrow)
(require 'heaven-and-hell)

;; Default is 'light
(setq heaven-and-hell-theme-type 'dark)

;; Set preferred light and dark themes
;; default light is emacs default theme, default dark is wombat
;; Themes can be the list: (dark . (tsdh-dark tango-dark))
(setq heaven-and-hell-themes
      '((light . sanityinc-tomorrow-day)
        (dark . sanityinc-tomorrow-night)))
;; Optionall, load themes without asking for confirmation.
(setq heaven-and-hell-load-theme-no-confirm t)

;; Add init-hook so heaven-and-hell can load your theme
(add-hook 'after-init-hook 'heaven-and-hell-init-hook)

;; Set keys to toggle theme and return to default emacs theme
(global-set-key (kbd "C-c <f6>") 'heaven-and-hell-load-default-theme)
(global-set-key (kbd "<f6>") 'heaven-and-hell-toggle-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(heaven-and-hell color-theme-sanityinc-tomorrow rust-mode nix-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; because of eelco
(use-package nix-mode
  :mode "\\.nix\\'")

;; don't yell at me
;;(setq warning-minimum-level :emergency)

;; sit on trees
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

