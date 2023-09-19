; Remove backup files
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

;; native comp packages
(setq package-native-compile t)


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
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(envrc corfu vterm eglot haskell-mode heaven-and-hell color-theme-sanityinc-tomorrow rust-mode nix-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; eglot
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'haskell-mode-hook 'eglot-ensure)

;; because of eelco
(use-package nix-mode
  :mode "\\.nix\\'")

;; don't yell at me
(setq warning-minimum-level :emergency)

;; ido
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; fido
(fido-mode 1)

;; corfu
(global-corfu-mode 1)

;; envrc
(envrc-global-mode 1)


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


;; fonts
(set-face-attribute 'default nil :family "mononoki" :height 110)
