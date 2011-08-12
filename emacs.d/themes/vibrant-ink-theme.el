;;; vibrant-ink-theme.el --- Custom face theme for Emacs

(deftheme vibrant-ink
  "Emacs 24 theme based on Vibrant Ink for Textmate")

(custom-theme-set-faces
 'vibrant-ink
 '(default ((t (:background "#111111" :foreground "#ffffff"))))
 '(cursor ((t (:background "#555577" :foreground "#ffffff"))))
 '(region ((t (:background "#444444"))))
 '(mode-line ((t (:background "#bfbfbf" :foreground "#000000"))))
 '(mode-line-inactive ((t (:background "#e5e5e5" :foreground "#333333"))))
 '(fringe ((t (:background "#000000"))))
 '(minibuffer-prompt ((t (:foreground "#ff6600"))))
 '(font-lock-builtin-face ((t (:foreground "#aaccff"))))
 '(font-lock-comment-face ((t (:slant italic :foreground "#9933cc"))))
 '(font-lock-constant-face ((t (:foreground "#339999"))))
 '(font-lock-function-name-face ((t (:foreground "#ffcc00"))))
 '(font-lock-keyword-face ((t (:foreground "#ff6600"))))
 '(font-lock-string-face ((t (:foreground "#66ff00"))))
 '(font-lock-type-face ((t (:foreground "#ffffff"))))
 '(font-lock-variable-name-face ((t (:foreground "#ffffff"))))
 '(font-lock-warning-face ((t (:foreground "#ffb5d0" :weight bold))))
 '(erb-out-delim-face ((t (:foreground "#E6E1DC"))))
 '(erb-delim-face ((t (:foreground "#E6E1DC" ))))
 '(erb-exec-face ((t (:background "#191919"))))
 '(erb-out-face ((t (:background "#191919"))))
 '(isearch ((t (:background "#555555"))))
 '(lazy-highlight ((t (:background "#444444"))))
 '(link ((t (:foreground "#aaccff" :underline t))))
 '(link-visited ((t (:foreground "#aaccff" :underline t))))
 '(button ((t (:background "#bfbfbf" :underline t))))
 '(header-line ((t (:background "#e5e5e5" :foreground "#333333")))))

(provide-theme 'vibrant-ink)
