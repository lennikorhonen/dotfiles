;;Define init file
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

(use-package mood-one-theme
	     :ensure t
	     :config
	     (load-theme 'mood-one t))

(use-package gcmh
  :config
  (gcmh-mode 1))
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
   	  (lambda ()
		 (message "*** Emacs loaded in %s with %d garbage collections."
			  (format "%.2f seconds"
				  (float-time
				   (time-subtract after-init-time before-init-time)))
			  gcs-done)))

;; (setq comp-async-report-warnings-error nil)

(setq initial-frame-alist '((top . 0) (left . 1920) (width . 137) (height . 76)))

;; Config packages
(use-package helm)
(use-package helm-projectile)
(use-package magit)
;;(use-package helm-ag)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(mood-one))
 '(package-selected-packages
   '(magit helm-projectile helm-ag elpy mood-one-theme use-package gcmh ruby-mode python-mode py-autopep8 pylint)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; UI

;; Font
(set-face-attribute 'default nil :font "Ubuntu Mono" :height 130)

(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)
;; Visible bell
(setq visible-bell t)

;; Kyebindigs

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-x") #'helm-M-x)
;;(global-set-key (kbd "s-f") #'helm-projectile-ag)
(global-set-key (kbd "s-t") #'helm-projectile-find-file-dwim)

;; Langugaes
(use-package ruby-mode)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(use-package python-mode)
(use-package py-autopep8)
(use-package pylint)
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)

;; Lang configs
(setq py-autopep8-options '("--max-line-lenth=100"))
