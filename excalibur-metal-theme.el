(deftheme excalibur-metal "EXCALIBUR METAL")

(let ((black    "#000000")
      (white    "#ffffff")
      (gray     "#666666")
      (fg       "#cccccc")
      (bg       "#000000")
      (line     "#121212")
      (cursor   "#eceee3")
      (keyword  "#626b67")
      (constant "#a5aaa7")
      (type     "#626b67")
      (string   "#a5aaa7")
      (function "#888888")
      (comment  "#666666"))
  
  (custom-theme-set-variables
   'excalibur-metal
   '(frame-background-mode (quote dark)))
  
  (custom-theme-set-faces
   'excalibur-metal

   ;; --- Default Colors -------
   `(default           ((t (:background ,bg :foreground ,fg))))
   `(border            ((t (:background ,fg :foreground ,bg))))
   `(region            ((t (:background ,fg :foreground ,bg))))
   `(fringe            ((t (:background ,bg :foreground ,bg))))
   `(highlight         ((t (:background ,fg :foreground ,bg))))
   `(cursor            ((t (:background ,cursor))))
   `(vertical-border   ((t (:foreground ,line))))
   `(minibuffer-prompt ((t (:foreground ,fg))))

   `(browse-url-button ((t (:foreground ,fg :underline t))))
   `(button            ((t (:foreground ,fg :underline t))))
   `(elisp-shorthand-font-lock-face ((t (:foreground ,fg :underline t))))
   `(info-header-xref  ((t (:foreground ,fg :underline t))))
   `(info-xref         ((t (:foreground ,fg :underline t))))
   
   `(link              ((t (:foreground ,type :underline t))))
   `(link-visited      ((t (:foreground ,constant :underline t))))
   
   `(mouse-drag-and-drop-region ((t ,(list :background fg :foreground line))))
   `(next-error                 ((t ,(list :background fg :foreground line))))
   
   `(match ((t ,(list :background type :foreground line))))
   
   `(help-key-binding          ((t ,(list :background type :foreground bg))))
   `(read-multiple-choice-face ((t ,(list :background type :foreground bg))))

   ;; --- Compilation ----------
   `(compilation-column-number ((t (:foreground ,fg))))
   `(compilation-line-number   ((t (:foreground ,fg))))
   
   `(compilation-error   ((t (:foreground ,type))))
   `(compilation-warning ((t (:foreground ,comment))))
   `(compilation-info    ((t (:foreground ,constant))))
   
   `(compilation-mode-line-fail ((t (:foreground ,gray))))
   `(compilation-mode-line-exit ((t (:foreground ,gray))))
   `(compilation-mode-line-run  ((t (:foreground ,constant))))

   ;; --- Mode Line ------------
   `(mode-line           ((t ,(list :background fg     :foreground bg))))
   `(mode-line-highlight ((t ,(list :background type   :foreground bg))))
   `(mode-line-inactive  ((t ,(list :background line   :foreground fg))))
  
   `(header-line ((t (:background ,black :foreground ,fg))))
   `(completions-annotations ((t (:foreground ,gray))))

   ;; --- Line Number ----------
   `(line-number              ((t (:background ,bg :foreground ,gray))))
   `(line-number-current-line ((t (:background ,bg :foreground ,fg))))

   ;; --- Highlight ------------
   `(hl-line        ((t (:background ,line))))
   `(lazy-highlight ((t (:background ,type :foreground ,bg))))

   ;; --- Font Lock Faces ------
   `(font-lock-bracket-face              ((t (:foreground ,fg))))
   `(font-lock-builtin-face              ((t (:foreground ,type))))
   `(font-lock-comment-delimiter-face    ((t (:foreground ,comment))))
   `(font-lock-comment-face              ((t (:foreground ,comment))))
   `(font-lock-constant-face             ((t (:foreground ,constant))))
   `(font-lock-delimiter-face            ((t (:foreground ,fg))))
   `(font-lock-doc-face                  ((t (:foreground ,type))))
   `(font-lock-doc-markup-face           ((t (:foreground ,type))))
   `(font-lock-escape-face               ((t (:foreground ,fg))))
   ;;`(font-lock-fixme-face                ((t (:foreground "#"))))
   `(font-lock-function-call-face        ((t (:foreground ,function))))
   `(font-lock-function-name-face        ((t (:foreground ,function))))
   `(font-lock-keyword-face              ((t (:foreground ,keyword :bold nil))))
   `(font-lock-misc-punctuation-face     ((t (:foreground ,fg))))
   `(font-lock-negation-char-face        ((t (:foreground ,fg))))
   ;;`(font-lock-note-face                 ((t (:foreground "#"))))
   `(font-lock-number-face               ((t (:foreground ,fg))))
   `(font-lock-operator-face             ((t (:foreground ,fg))))
   `(font-lock-preprocessor-face         ((t (:foreground ,gray))))
   `(font-lock-property-name-face        ((t (:foreground ,fg))))
   `(font-lock-property-use-face         ((t (:foreground ,fg))))
   `(font-lock-punctuation-face          ((t (:foreground ,fg))))
   `(font-lock-regexp-face               ((t (:foreground ,fg))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,fg))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,fg))))
   `(font-lock-string-face               ((t (:foreground ,string))))
   `(font-lock-type-face                 ((t (:foreground ,type :bold nil))))
   `(font-lock-variable-name-face        ((t (:foreground ,fg))))
   `(font-lock-variable-use-face         ((t (:foreground ,fg))))
   `(font-lock-warning-face              ((t (:foreground ,type))))

   ;; --- Plugins --------------
   ;; + COMPLETION -------------
   `(completions-annotations ((t (:inherit 'shadow))))
   `(completions-highlight   ((t (:foreground ,bg :background ,fg))))
   `(ffap                    ((t (:foreground ,bg :background ,fg))))
   
   ;; + ISEARCH ----------------
   `(isearch      ((t (:foreground ,bg :background ,fg   :weight normal))))
   `(isearch-fail ((t (:foreground ,bg :background ,type :bold t))))

   ;; + PULSE ------------------
   `(pulse-highlight-start-face ((t (:background ,white))))
   
   ;; + DIRED ------------------
   `(warning ((t (:background nil :foreground ,keyword))))
   
   ;; + SHOW PAREN -------------
   `(show-paren-match            ((t (:background ,fg   :foreground ,bg))))
   `(show-paren-match-expression ((t (:background ,fg   :foreground ,bg))))
   `(show-paren-mismatch         ((t (:background ,type :foreground ,bg))))
   
   ;; + TREE SITTER ------------
   `(tree-sitter-hl-face:embedded      ((t (:foreground ,type))))
   `(tree-sitter-hl-face:function.call ((t (:foreground ,gray :italic nil))))
   `(tree-sitter-hl-face:type          ((t (:foreground ,type))))
   `(tree-sitter-hl-face:variable      ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:number        ((t (:foreground ,string))))
   `(tree-sitter-hl-face:operator      ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:property      ((t (:foreground ,fg :italic nil))))
   `(tree-sitter-hl-face:punctuation   ((t (:foreground ,fg))))
   
   ;; + IVY --------------------
   `(ivy-completions-annotations ((t (:foreground ,black))))
   `(ivy-minibuffer-match-face-1 ((t (:background nil :foreground ,nil))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,type :foreground ,black))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,type :foreground ,black))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,type :foreground ,black))))
   `(ivy-current-match ((t (:background ,fg :foreground ,black))))
   `(ivy-prompt-match  ((t (:background ,fg :foreground ,black))))
   
   ;; + SWIPER -----------------
   `(swiper-background-match-face-1 ((t (:background ,nil :foreground ,nil))))
   `(swiper-background-match-face-2 ((t (:background ,type :foreground ,black))))
   `(swiper-background-match-face-3 ((t (:background ,type :foreground ,black))))
   `(swiper-background-match-face-4 ((t (:background ,type :foreground ,black))))

   `(swiper-match-face-1 ((t (:background ,nil :foreground ,nil))))
   `(swiper-match-face-2 ((t (:background ,type :foreground ,black))))
   `(swiper-match-face-3 ((t (:background ,type :foreground ,black))))
   `(swiper-match-face-4 ((t (:background ,type :foreground ,black))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'excalibur-metal)
