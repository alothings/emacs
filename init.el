(setq visible-bell 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (deeper-blue)))
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode nil)
 '(smtpmail-smtp-server "smtp.googlemail.com")
 '(smtpmail-smtp-service 587)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote top)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


;; Hiding tool bar
;;(tool-bar-mode -1)

;; Getting the melpa packages
(require 'package) ;; You might already have this line
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line

;; Using use-package ??
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)) 

(use-package try
  :ensure t)

;; What's this for??
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Nice window to list and manage buffers
(defalias 'list-buffers 'ibuffer)
;(defalias 'list-buffers 'ibuffer-other-window)

;; For a tab bar
(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))

; For managing windows. Maybe I'll comment out for now
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

; Setting up autocomplete package
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; org presentation to reveal.js
(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

;; Global key binding for magit
(global-set-key (kbd "C-x g") 'magit-status)



;; Set your lisp system and, optionally, some contribs
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/clisp")
(setq slime-contribs '(slime-fancy))
;(setq slime-lisp-implementations
;      '((clisp ("/opt/local/bin/clisp" "-q -I"))
;        (sbcl  ("/usr/local/bin/sbcl") :coding-system utf-8-unix)))
