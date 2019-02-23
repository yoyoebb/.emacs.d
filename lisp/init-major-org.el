(require 'org)

(defun org-export-as-html-and-open()
  (interactive)
  (org-open-file-with-system (org-html-export-to-html)))



;; 设置line soft wrap
(add-hook 'org-mode-hook
	  (lambda()
	    (visual-line-mode)
	    (setq word-wrap nil)))

;; org-mode keybindings
(define-key org-mode-map (kbd "<f5>") 'org-publish-all)

;;
;; export to html settings
;;
(setq org-html-doctype "html5")
(setq org-html-xml-declaration nil)
(setq org-html-postamble nil)

;; 设置css

(setq debug-on-error nil)

;; publish settings
(require 'ox-publish)
(setq org-publish-project-alist
      '(("org-notes"
	:base-directory "~/org/"
	:base-extension "org"
	:publishing-directory "~/org_html/"
	:recursive t
	:publishing-function org-html-publish-to-html
	:headline-levels 3
	:auto-preamble t
	:auto-sitemap t
	:sitemap-filename "index.org"
	:sitemap-title "Index"
	)
	("org-static"
	 :base-directory "~/org/"
	 :base-extension "css\\|js\\|jpg\\|gif\\|pdf\\|mps\\|png\\|swf"
	 :publishing-directory "~/org_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org" :components ("org-notes" "org-static"))
	))

;; 文件末尾
(provide 'init-major-org)
