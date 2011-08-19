(load "package-hooks.el")

(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Bootstrap el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources
      '((:name magit
               :after (lambda ()
                        (global-set-key (kbd "C-x C-z") 'magit-status)))
        (:name full-ack :type elpa)
        (:name smex
               :after (lambda ()
                        (setq smex-save-file "~/.emacs.d/.smex-items")
                        (global-set-key (kbd "M-x") 'smex)
                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
        (:name ruby-mode 
               :type elpa
               :load "ruby-mode.el"
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby :type elpa)
        (:name ruby-compilation :type elpa)
        (:name ruby-electric :type elpa)
        (:name rinari
               :type git
               :url "http://github.com/eschulte/rinari.git"
               :load-path ("." "util" "util/jump")
               :compile ("\\.el$" "util")
               :features rinari)
        (:name rhtml
               :type git
               :url "git://github.com/crazycode/rhtml.git"
               :load-path (".")
               :features rhtml-mode
               :after (lambda () (rhtml-mode-hook)))
        (:name css-mode 
               :type elpa
               :after (lambda () (css-mode-hook)))
        (:name scss-mode 
               :type elpa
               :after (lambda () (scss-mode-hook)))
        (:name yaml-mode 
               :type elpa
               :after (lambda () (yaml-mode-hook)))
        (:name markdown-mode)
        (:name rainbow-mode)
        (:name paredit)
        (:name slime :type elpa)
        (:name slime-repl :type elpa)
        (:name clojure-mode
               :after (lambda () (setq slime-net-coding-system 'utf-8-unix)))
        (:name yasnippet
               :type svn
               :url "http://yasnippet.googlecode.com/svn/trunk/"
               :after (lambda ()
                        (yas/initialize)
                        (yas/load-directory "~/.emacs.d/snippets")))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el"
               :after (lambda () (textmate-mode-hook)))))

(el-get 'sync)
