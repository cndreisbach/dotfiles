;; Visual setup
(set-frame-font "Monospace-12")
(setq my-theme-dir "~/.emacs.d/themes")
(add-to-list 'load-path my-theme-dir)
(setq custom-theme-directory my-theme-dir)
(setq custom-safe-themes 
      (quote ("5600dc0bb4a2b72a613175da54edb4ad770105aa" 
              "0174d99a8f1fdc506fa54403317072982656f127"
              default)))
(load-theme 'wombat)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)
(set-fringe-style 4)
(tooltip-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode -1)
(global-font-lock-mode t)
(show-paren-mode t)
; (setq show-paren-style 'expression) ;; highlight between parens
(blink-cursor-mode 0)

;;(setq whitespace-line-count 80
;;      whitespace-style '(faces lines trailing space-before-tab indentation space-after-tab))

;; config
(setq exec-path (append '("~/go/bin"
                          "~/.rbenv/bin"
                          "~/.rbenv/shims"
                          "~/.local/bin") exec-path))
(setenv "PATH" (concat "~/go/bin:~/.rbenv/bin:~/.rbenv/shims:~/.local/bin:" (getenv "PATH")))
(setq shell-file-name "/bin/bash")
(delete-selection-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(fset 'yes-or-no-p 'y-or-n-p)
(cua-selection-mode t)

; Use the native clipboard
(setq x-select-enable-clipboard t)

; Window navigation
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; Ido
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-use-filename-at-point 'guess)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

(setq scheme-program-name "racket")
