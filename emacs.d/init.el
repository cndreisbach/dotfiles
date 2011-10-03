;;;;; Clinton R. Nixon's Emacs 24 configuration
;;;;; Inspired by many sources, but especially:
;;;;; * https://github.com/avdi/.emacs24.d
;;;;; * http://technomancy.us/153

;;; Initial configuration
(require 'cl)

(setq crn-elisp-dir (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path crn-elisp-dir)
(setq crn-vendor-dir (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path crn-vendor-dir)

; Add external projects to load path
(dolist (project (directory-files crn-vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

; Backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Package installation
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq my-packages '(starter-kit
                    starter-kit-lisp
                    starter-kit-eshell
                    starter-kit-ruby
                    starter-kit-js
                    starter-kit-bindings
                    clojure-mode clojure-test-mode
                    ruby-end
                    yaml-mode
                    haml-mode
                    sass-mode scss-mode
                    feature-mode
                    coffee-mode
                    go-mode
                    markdown-mode
                    undo-tree
                    full-ack
                    deft
                    marmalade))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;; Configure packages
(setq ack-prompt-for-directory t)

(setq css-indent-level 2)
(setq css-indent-offset 2)

(setq deft-directory "~/Dropbox/Notes/")
(setq deft-text-mode 'org-mode)

(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))

;;; Local code
(load "functions.el")

;;; Server setup
(add-hook 'server-switch-hook
            (lambda ()
              (when (current-local-map)
                (use-local-map (copy-keymap (current-local-map))))
	      (when server-buffer-clients
		(local-set-key (kbd "C-x k") 'server-edit))))

;;; Keybindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-/") 'dabbrev-expand)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-\\") 'indent-region)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

; user definitions
(global-set-key (kbd "C-c a") 'mark-whole-buffer)
(global-set-key (kbd "C-c c") 'query-replace-regexp)
(global-set-key (kbd "C-c d") 'deft)
(global-set-key (kbd "C-c e") 'esk-eval-and-replace)
(global-set-key (kbd "C-c f") 'find-file-in-project)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c n") 'esk-cleanup-buffer)
(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c s") 'save-buffer-always)
(global-set-key (kbd "C-c v") 'eval-buffer)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c x") 'execute-extended-command)
