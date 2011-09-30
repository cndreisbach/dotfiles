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
        (:name eproject
               :type git
               :url "git://github.com/jrockway/eproject.git"
               :load "eproject.el"
               :after (lambda () (eproject-mode-hook)))
        (:name full-ack :type elpa)
        (:name deft
               :type http
               :url "http://jblevins.org/projects/deft/deft.el"
               :after (lambda ()
                        (setq deft-directory "~/Dropbox/Notes/")
                        (setq deft-text-mode 'markdown-mode)))
        (:name smex
               :after (lambda ()
                        (setq smex-save-file "~/.emacs.d/.smex-items")
                        (global-set-key (kbd "M-x") 'smex)
                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
        (:name rainbow-mode)
        (:name rainbow-delimiters)
        (:name paredit)
        
        ;; languages
        (:name ruby-mode 
               :type elpa
               :load "ruby-mode.el"
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby :type elpa)
        (:name ruby-compilation :type elpa)
        (:name ruby-electric :type elpa)
        (:name rhtml
               :type git
               :url "git://github.com/crazycode/rhtml.git"
               :load-path (".")
               :features rhtml-mode
               :after (lambda () (rhtml-mode-hook)))
        (:name css-mode 
               :type elpa
               :after (lambda () (css-mode-hook)))
        (:name haml-mode
               :type elpa
               :after (lambda () (haml-mode-hook)))
        (:name sass-mode
               :type elpa
               :after (lambda () (sass-mode-hook)))
        (:name scss-mode 
               :type elpa
               :after (lambda () (scss-mode-hook)))
        (:name yaml-mode 
               :type elpa
               :after (lambda () (yaml-mode-hook)))
        (:name go-mode)
        (:name markdown-mode)
        (:name asciidoc)
        
        ;; lisp!
        (:name slime :type elpa)
        (:name slime-repl :type elpa)
        (:name geiser
               :type git
               :url "git://git.sv.gnu.org/geiser.git"
               :load "elisp/geiser.el")
        (:name quack)
        (:name clojure-mode
               :after (lambda () (setq slime-net-coding-system 'utf-8-unix)))
        ))


(el-get 'sync)
