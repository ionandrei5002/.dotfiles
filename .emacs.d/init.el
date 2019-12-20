;; .emacs.d/init.el
;; ===================================
;; MELPA Package Support
;; ===================================

;; Enables basic packaging support
(require 'package)
;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; Initializes the package infrastructure
(package-initialize)
;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install packages
(defvar MyPackages
  '(better-defaults  ;; Set up some better Emacs default
    material-theme   ;; Theme
    multiple-cursors ;; Multiple cursors
    )
  )

;; Scans the list in MyPackages
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      MyPackages)

;; Basic Customization
(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Multiple cursor
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

