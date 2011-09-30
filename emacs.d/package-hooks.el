(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (require 'ruby-electric)
                               (local-set-key (kbd "RET") 'newline-and-indent)
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode)))

(defun haml-mode-hook ()
  (autoload 'haml-mode "haml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode)))

(defun sass-mode-hook ()
  (autoload 'sass-mode "sass-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode)))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(defun scss-mode-hook ()
  (autoload 'scss-mode "scss-mode" nil t)
  (set-variable 'scss-compile-at-save nil))

(defun project-root-hook ()
  (setq project-roots
        `(("Rails project"
           :root-contains-files ("app" "config" "Rakefile")
           :filename-regex ,(regexify-ext-list '(rb ru js css sass scss erb haml))
           :exclude-paths '("vendor"))
          ("Rake project"
           :root-contains-files ("Rakefile"))
          ("Generic Git project"
           :root-contains-files (".git"))))
  (defun project-create-tags ()
    (interactive)
    (with-project-root
        (let ((root (cdr project-details)))
              (create-tags root)))))

(defun eproject-mode-hook ()
  (load "eproject-extras.el"))
