(deftheme excalibur "EXCALIBUR")

(let ((black    "#000000")
      (white    "#ffffff")
      (gray     "#898776")
      (fg       "#bab5a1")
      (bg       "#1c1b17")
      (line     "#2a2822")
      (cursor   "#d4d1c4")
      (keyword  "#667a73")
      (type     "#667a73")
      (constant "#919782")
      (string   "#919782")
      (number   "#919782")
      (function "#898776")
      (comment  "#898776"))
  
  (custom-theme-set-variables
   'excalibur
   '(frame-background-mode (quote dark)))
  
  (custom-theme-set-faces
   'excalibur

   ;; ==========================================
   ;; === Built-in =============================
   ;; --- Basic Colors -------------------------
   `(border              ((t (:background ,fg       :foreground ,bg))))
   `(cursor              ((t (:background ,cursor))))
   `(default             ((t (:background ,bg       :foreground ,fg))))
   `(fringe              ((t (:background ,bg       :foreground ,gray))))
   `(header-line         ((t (:background ,black    :foreground ,fg))))
   `(help-key-binding    ((t (:background ,fg       :foreground ,bg))))
   `(highlight           ((t (:background ,fg       :foreground ,bg))))
   `(link                ((t (:foreground ,constant :underline t))))
   `(link-visited        ((t (:foreground ,type     :underline t))))
   `(minibuffer-prompt   ((t (:foreground ,fg))))
   `(region              ((t (:background ,fg       :foreground ,bg))))
   `(secondary-selection ((t (:background ,type     :foreground ,bg))))
   `(trailing-whitespace ((t (:background ,cursor   :foreground ,bg))))
   `(vertical-border     ((t (:foreground ,line))))
   
   `(error               ((t (:foreground ,type     :weigth normal))))
   `(warning             ((t (:foreground ,gray     :weight normal))))
   `(success             ((t (:foreground ,constant :weight normal))))
   `(shadow              ((t (:foreground ,gray     :weight normal))))

   ;; --- Compilation -------------------------
   `(compilation-column-number  ((t (:foreground ,fg))))
   `(compilation-line-number    ((t (:foreground ,fg))))
   `(compilation-mode-line-exit ((t (:foreground ,gray))))
   `(compilation-mode-line-fail ((t (:foreground ,type))))
   `(compilation-mode-line-run  ((t (:foreground ,constant))))
   
   ;;`(compilation-error          ((t (:foreground ,type))))
   ;;`(compilation-warning        ((t (:foreground ,gray))))
   ;;`(compilation-info           ((t (:foreground ,constant))))

   ;; --- Font-Lock ----------------------------
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
   `(font-lock-number-face               ((t (:foreground ,number))))
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

   ;; --- ISearch ------------------------------
   `(match          ((t (:background ,type     :foreground ,bg))))
   `(isearch        ((t (:background ,type     :foreground ,bg :weight normal))))
   `(isearch-fail   ((t (:background ,constant :foreground ,bg :weight normal))))
   `(lazy-highlight ((t (:background ,fg       :foreground ,bg))))

   ;; --- Line-Number --------------------------
   `(line-number              ((t (:background ,bg :foreground ,gray))))
   `(line-number-current-line ((t (:background ,bg :foreground ,fg))))
   
   ;; --- Mode Line ------------
   `(mode-line           ((t ,(list :background fg   :foreground bg))))
   `(mode-line-highlight ((t ,(list :background type :foreground bg))))
   `(mode-line-inactive  ((t ,(list :background line :foreground fg))))
      
   ;; ==========================================
   ;; === Third-Party ==========================
   ;; --- hl-line ------------------------------
   `(hl-line ((t (:background ,line))))
   
   ;; --- Ivy ----------------------------------
   `(ivy-action                  ((t (:foreground ,type))))
   `(ivy-completions-annotations ((t (:foreground ,gray))))
   `(ivy-confirm-face            ((t (:foreground ,constant))))
   `(ivy-current-match           ((t (:background ,fg   :foreground ,black))))
   `(ivy-match-required-face     ((t (:background ,bg   :foreground ,cursor))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,nil  :foreground ,nil))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,type :foreground ,black))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,type :foreground ,black))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,type :foreground ,black))))
   `(ivy-prompt-match            ((t (:background ,fg   :foreground ,black))))
   
   ;; --- Show-Paren ---------------------------
   `(show-paren-match            ((t (:background ,fg   :foreground ,bg))))
   `(show-paren-match-expression ((t (:background ,fg   :foreground ,bg))))
   `(show-paren-mismatch         ((t (:background ,type :foreground ,bg))))
   
   ;; --- Swiper -------------------------------
   `(swiper-background-match-face-1 ((t (:background ,nil  :foreground ,nil))))
   `(swiper-background-match-face-2 ((t (:background ,type :foreground ,black))))
   `(swiper-background-match-face-3 ((t (:background ,type :foreground ,black))))
   `(swiper-background-match-face-4 ((t (:background ,type :foreground ,black))))

   `(swiper-match-face-1 ((t (:background ,nil  :foreground ,nil))))
   `(swiper-match-face-2 ((t (:background ,type :foreground ,black))))
   `(swiper-match-face-3 ((t (:background ,type :foreground ,black))))
   `(swiper-match-face-4 ((t (:background ,type :foreground ,black))))
   
   ;; --- Tree-Sitter --------------------------
   `(tree-sitter-hl-face:embedded      ((t (:foreground ,type))))
   `(tree-sitter-hl-face:function.call ((t (:foreground ,function :italic nil))))
   `(tree-sitter-hl-face:type          ((t (:foreground ,type))))
   `(tree-sitter-hl-face:variable      ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:number        ((t (:foreground ,number))))
   `(tree-sitter-hl-face:operator      ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:property      ((t (:foreground ,fg :italic nil))))
   `(tree-sitter-hl-face:punctuation   ((t (:foreground ,fg))))
   ))

;;;###autoload
(when load-file-name
  (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide 'excalibur)
