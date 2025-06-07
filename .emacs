;; --- Custom File -------------
(setq custom-file "emacs-custom.el")
(load custom-file t)

;; --- Decoration --------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'excalibur t)
;;(load-theme 'excalibur-metal t)

(set-frame-font "Iosevka 14" nil t)

(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(make-face 'font-lock-important-face)

(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
           ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
           )))
      fixme-modes)

(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)

;; --- Operating System --------
(setq xkazu0x-linux (featurep 'x))
(setq xkazu0x-win32 (not xkazu0x-linux))

(when xkazu0x-linux
  (setq xkazu0x-build "build.sh")
  (setq xkazu0x-build-release "build.sh release")
  (setq xkazu0x-run "run.sh"))

(when xkazu0x-win32
  (setq xkazu0x-build "build.bat")
  (setq xkazu0x-build-release "build.bat release")
  (setq xkazu0x-run "run.bat"))

;; --- Build Project -----------
(defun find-project-directory-recursive()
  "Recursively search for a makefile."
  (interactive)
  (if (file-exists-p xkazu0x-build) t
    (cd "../")
    (find-project-directory-recursive)))

(defun find-project-directory()
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (cd find-project-from-directory)
  (find-project-directory-recursive)
  (setq last-compilation-directory default-directory))

(defun build-without-asking()
  "Build."
  (interactive)
  (if (find-project-directory) (compile xkazu0x-build)
    (other-window 1)))
(define-key global-map "\em" 'build-without-asking)

(defun build-release-without-asking()
  "Build release."
  (interactive)
  (if (find-project-directory) (compile xkazu0x-build-release)
    (other-window 1)))
(define-key global-map "\e," 'build-release-without-asking)

(defun run-without-asking()
  "Run the current build."
  (interactive)
  (if (find-project-directory) (compile xkazu0x-run)
    (other-window 1)))
(define-key global-map "\ek" 'run-without-asking)

;; --- Key Binding -------------
(defun duplicate-line()
  (interactive)
  (let ((column (- (point) (point-at-bol)))
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'duplicate-line)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-unset-key [mouse-2])

(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(define-key global-map [pgup] 'forward-page)
(define-key global-map [pgdown] 'backward-page)
(define-key global-map [C-next] 'scroll-other-window)
(define-key global-map [C-prior] 'scroll-other-window-down)

(define-key global-map "\eb" 'compile)

(define-key global-map [f9] 'first-error)
(define-key global-map [f10] 'previous-error)
(define-key global-map [f11] 'next-error)

(define-key global-map "\eN" 'previous-error)
(define-key global-map "\en" 'next-error)

(define-key global-map "\eu" 'undo)
(define-key global-map "\e6" 'upcase-word)
(define-key global-map "\e^" 'captilize-word)

(define-key global-map "\e[" 'start-kbd-macro)
(define-key global-map "\e]" 'end-kbd-macro)
(define-key global-map "\e'" 'call-last-kbd-macro)

(define-key global-map "\ec" 'comment-region)
(define-key global-map "\eC" 'uncomment-region)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; --- Basic -------------------
(setq undo-limit (* 16 1024 1024))
(setq undo-strong-limit (* 24 1024 1024))
(setq undo-outer-limit (* 64 1024 1024))

(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;;(ido-mode 1)
;;(ido-everywhere 1)
(global-display-line-numbers-mode 0)
(global-hl-line-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)

(line-number-mode)
(column-number-mode)
(display-time-mode 1)
(size-indication-mode 0)

(setq display-line-numbers-type 'relative)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fset #'display-startup-echo-area-message #'ignore)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; disable backups/lockfiles
(setq create-lockfiles nil
      make-backup-files nil
      ;; in case if it is enabled
      version-control t
      backup-by-copying t
      delete-old-versions t
      kept-old-versions 5
      kept-new-versions 5)

(setq auto-save-default nil)

;; use utf-8
;; (prefer-coding-system 'utf-8)
;; (setq coding-system-for-read 'utf-8)
;; (setq coding-system-for-write 'utf-8)
;; (set-language-environment "UTF-8")
;; (set-selection-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (setq-default buffer-file-coding-system 'utf-8)

(setq mouse-wheel-progressive-speed nil)
(setq scroll-margin 8)
(setq scroll-conservatively 100000)
(setq scroll-preserve-screen-position 'always)

(setq disabled-command-function nil)

(setq search-highlight t)
(setq query-replace-highlight t)

(setq-default truncate-lines t)

(setq use-short-answers t)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq initial-scratch-message "")

(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; --- Tune Garbage Collector --
;; the default settings are too conservative on modern machines making EMX
;; spend too much time collecting garbage in alloc-heavy code.
(setq gc-cons-threshold (* 4 1024 1024))
(setq gc-cons-percentage 0.3)

;; --- Package Manager ---------
(eval-and-compile
  (require 'package)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("gnu" . "https://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (setq package-native-compile t)
  (setq native-comp-async-report-warnings-errors nil)
  (setq async-bytecomp-allowed-packages nil)
  (package-initialize)
  (defvar init-el-package-archives-refreshed nil)
  (defun init-el-install-package (package-name)
    (unless (package-installed-p package-name)
      (unless init-el-package-archives-refreshed
        (package-refresh-contents)
        (setq init-el-package-archives-refreshed t)
      (package-install package-name))))
  (defmacro init-el-with-eval-after-load (feature &rest body)
    (declare (indent 1) (debug t))
    (require feature)
    `(with-eval-after-load ',feature ,@body))
  (defmacro init-el-require-package (package-name &optional feature-name)
    (init-el-install-package package-name)
    (require (or feature-name package-name))
    `(init-el-install-package ',package-name)))

;; --- Lang Modes --------------
;;(add-to-list 'load-path "~/.emacs.d/modes/")
;;(init-el-with-eval-after-load c3-mode)
;;(init-el-with-eval-after-load hlsl-mode)
;;(init-el-with-eval-after-load odin-mode)

;;(init-el-require-package glsl-mode)
;;(init-el-require-package go-mode)
;;(init-el-require-package lua-mode)

(setq auto-mode-alist
      (append
       '(("\\.cpp$"    . c++-mode)
         ("\\.hin$"    . c++-mode)
         ("\\.cin$"    . c++-mode)
         ("\\.inl$"    . c++-mode)
         ("\\.rdc$"    . c++-mode)
         ("\\.h$"    . c++-mode)
         ("\\.c$"   . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.c8$"   . c++-mode)
         ("\\.txt$" . indented-text-mode)
         ("\\.emacs$" . emacs-lisp-mode)
         ("\\.gen$" . gen-mode)
         ("\\.ms$" . fundamental-mode)
         ("\\.m$" . objc-mode)
         ("\\.mm$" . objc-mode)
         ) auto-mode-alist))

(defconst xkazu0x-c-style
  '((c-electric-pound-behavior   . nil)
    (c-tab-always-indent         . t)
    (c-comment-only-line-offset  . 0)
    (c-hanging-braces-alist      . ((class-open)
                                    (class-close)
                                    (defun-open)
                                    (defun-close)
                                    (inline-open)
                                    (inline-close)
                                    (brace-list-open)
                                    (brace-list-close)
                                    (brace-list-intro)
                                    (brace-list-entry)
                                    (block-open)
                                    (block-close)
                                    (substatement-open)
                                    (statement-case-open)
                                    (class-open)))
    (c-hanging-colons-alist      . ((inher-intro)
                                    (case-label)
                                    (label)
                                    (access-label)
                                    (access-key)
                                    (member-init-intro)))
    (c-cleanup-list              . (scope-operator
                                    list-close-comma
                                    defun-close-semi))
    (c-offsets-alist             . ((arglist-close         .  c-lineup-arglist)
                                    (label                 . -4)
                                    (access-label          . -4)
                                    (substatement-open     .  0)
                                    (statement-case-intro  .  4)
                                    (statement-block-intro .  4)
                                    (case-label            .  4)
                                    (block-open            .  0)
                                    (inline-open           .  0)
                                    (topmost-intro-cont    .  0)
                                    (knr-argdecl-intro     . -4)
                                    (brace-list-open       .  0)
                                    (brace-list-intro      .  4)))
    (c-echo-syntactic-information-p . t))
  "xkazu0x C style")

(defun xkazu0x-c-hook ()
  (c-add-style "excalibur" xkazu0x-c-style t)
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-offset 'member-init-intro '++)
  (c-toggle-auto-hungry-state -1)
  (define-key c++-mode-map "\C-m" 'newline-and-indent)
  (setq c-hanging-semi&comma-criteria '((lambda () 'stop)))
  (setq dabbrev-case-replace t)
  (setq dabbrev-case-fold-search t)
  (setq dabbrev-upcase-means-case-search t)
  (abbrev-mode 1))
  
(add-hook 'c-mode-common-hook 'xkazu0x-c-hook)

;; --- Packages ----------------
;; + IVY +
(use-package ivy
  :diminish ivy-mode
  :config
  (ivy-mode 1))

;; + SWIPER +
(use-package swiper
  :ensure t
  :config)
(global-set-key (kbd "C-s") 'swiper)

;; + COMPANY +
;; (init-el-require-package company)
;; (global-company-mode)
;; (setq company-idle-delay t)

;; + UNDO TREE +
;; (init-el-require-package undo-tree)
;; (global-undo-tree-mode)
;; (setq undo-tree-visualizer-timestamps t)
;; (setq undo-tree-visualizer-lazy-drawing nil)
;; (setq undo-tree-auto-save-history t)
;; (let ((undo-dir (expand-file-name "undo" user-emacs-directory)))
;;   (setq undo-tree-history-directory-alist (list (cons "." undo-dir))))

;; + DUMB JUMP +
;;(init-el-require-package dumb-jump)

;; + DABBREV +
;; (init-el-with-eval-after-load dabbrev
;;   (setq dabbrev-case-replace nil)
;;   (setq dabbrev-case-distinction nil))

;; + WHITESPACE +
;; (init-el-with-eval-after-load whitespace
;;   (setq whitespace-style '(face trailing lines-tail empty space-before-tab)))

;; + VERTICO +
;; (use-package vertico
;; 	:ensure t
;; 	:config
;; 	(setq vertico-cycle t)
;; 	(setq vertico-resize nil)
;; 	(vertico-mode 1))

;; + MARGINALIA +
;; (use-package marginalia
;;   :ensure t
;;   :config
;;   (marginalia-mode 1))

;; + TREE SITTER LANGS +
;; (use-package tree-sitter-langs
;;   :ensure t)

;; + TREE SITTER +
;; (use-package tree-sitter
;;   :ensure t
;;   :after tree-sitter-langs
;;   :config
;;   (global-tree-sitter-mode)
;;   (global-font-lock-mode t)
;;   (setq treesit-font-lock-level t)
;;   (setq font-lock-maximum-decoration t)
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
