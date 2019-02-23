


;;;;;; 设置文件所关联的major-mode ;;;;;;
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.htm\\'" . web-mode))
       '(("\\.css\\'" . web-mode))
       auto-mode-alist))



;;;;;; COmpany web (package) ;;;;;;
(require 'company-web-html)      ; load company mode html backend
(require 'web-mode)
(define-key web-mode-map (kbd "C-'") 'company-web-html)

;; 文件末尾
(provide 'init-editor-defaults)
