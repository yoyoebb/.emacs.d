;; 不自动生成backup       foo~
;; 不自动生成auto-save    #foo#
(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'package)
(require 'cl)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; 非常好用的package配置管理工具
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; 如果package不存在则自动下载
(setq use-package-always-ensure t)

;; 利用org来分类组织所有的配置脚本，比多个el文件好用
(require 'ob-tangle)
(org-babel-load-file "~/.emacs.d/emacs-and-org-init.org")

;; 自定义函数：快速打开配置文件(快捷键F12)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/emacs-and-org-init.org"))
(global-set-key (kbd "<f12>") 'open-init-file)


;;遗留注释，以后解决
;;(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
;;(load-file custom-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-bullets web-mode use-package smartparens popwin org monokai-theme js2-mode htmlize counsel company-web))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
