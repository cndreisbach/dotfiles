(deftheme railscasts
  "Theme for faces, based on the Railscasts textmate theme by Ryan Bates.")

(custom-theme-set-faces
 'railscasts
 '(default ((t (:foreground "#e6e1dc" :background "#2b2b2b"))))
 '(cursor ((t (:foreground "#444444" :background "#ffffff"))))
 '(highlight ((t (:background "#333435"))))
 '(region ((t (:background "#333435"))))
 '(font-lock-builtin-face ((t (:foreground "#d0d0ff"))))
 '(font-lock-comment-face ((t (:foreground "#444444"))))
 '(font-lock-constant-face ((t (:foreground "#6d9cbe"))))
 '(font-lock-function-name-face ((t (:foreground "#ffc66d"))))
 '(font-lock-keyword-face ((t (:foreground "#cc7833"))))
 '(font-lock-string-face ((t (:foreground "#a5c261"))))
 '(font-lock-type-face ((t (:foreground "#ffffff"))))
 '(font-lock-variable-name-face ((t (:foreground "#d0d0ff"))))
 '(font-lock-warning-face ((t (:foreground "#990000"))))
 '(erb-out-delim-face ((t (:foreground "#E6E1DC"))))
 '(erb-delim-face ((t (:foreground "#E6E1DC" ))))
 '(erb-exec-face ((t (:background "#191919"))))
 '(erb-out-face ((t (:background "#191919"))))

 '(button ((t (:underline t :foreground "#6d9cbe"))))
 '(link ((t (:underline t :foreground "#6d9cbe"))))
 '(link-visited ((t (:underline t :foreground "#6d9cbe"))))
 '(mode-line ((t (:box nil
		       :background "#1c1c1c" :foreground "#444444"))))
 '(mode-line-inactive ((t (:box nil
				:background "#1f1f1f" :foreground "#333333"))))
 '(isearch ((t (:background "#555555"))))
 '(minibuffer-prompt ((t (:bold t :foreground "#cc7833"))))
 '(show-paren-match-face ((t (:foreground "#444444" :background "#e6e1dc"))))
 '(show-paren-mismatch-face ((t (:foreground "#444444" :background "#990000"))))
 '(lazy-highlight ((t (:background "#cc7833")))))

(provide-theme 'railscasts)