;; --- Custom File ---------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; --- Decoration ----------------------------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'excalibur t)
;;(load-theme 'excalibur-metal t)

(set-frame-font "Iosevka 13" nil t)

(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(make-face 'font-lock-warr-face)
(make-face 'font-lock-important-face)

(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
	   ("\\<\\(WARNING\\)" 1 'font-lock-warr-face t)
	   ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t))))
      fixme-modes)

(modify-face 'font-lock-fixme-face     "Red"        nil nil t nil t nil nil)
(modify-face 'font-lock-note-face      "Dark Green" nil nil t nil t nil nil)
(modify-face 'font-lock-warr-face      "Yellow"     nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow"       nil nil t nil t nil nil)

;; --- Lang Modes ----------------------------------------------
(setq auto-mode-alist
      (append
       '(("\\.cpp$"   . c++-mode)
         ("\\.hin$"   . c++-mode)
         ("\\.cin$"   . c++-mode)
         ("\\.inl$"   . c++-mode)
         ("\\.rdc$"   . c++-mode)
         ("\\.h$"     . c++-mode)
         ("\\.c$"     . c++-mode)
         ("\\.cc$"    . c++-mode)
         ("\\.c8$"    . c++-mode)
         ("\\.txt$"   . indented-text-mode)
         ("\\.emacs$" . emacs-lisp-mode)
         ("\\.gen$"   . gen-mode)
         ("\\.ms$"    . fundamental-mode)
         ("\\.m$"     . objc-mode)
         ("\\.mm$"    . objc-mode))
       auto-mode-alist))

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
  (c-add-style "Caliburn" xkazu0x-c-style t)
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-offset 'member-init-intro '++)
  (c-toggle-auto-hungry-state -1)
  (setq c-hanging-semi&comma-criteria '((lambda () 'stop)))
  (setq dabbrev-case-replace t)
  (setq dabbrev-case-fold-search t)
  (setq dabbrev-upcase-means-case-search t)
  (abbrev-mode 1))
  
(add-hook 'c-mode-common-hook 'xkazu0x-c-hook)

;; --- Operating System ----------------------------------------
(setq xkazu0x-linux (featurep 'x))
(setq xkazu0x-win32 (not xkazu0x-linux))

;; --- Build Project -------------------------------------------
(when xkazu0x-linux
  (setq xkazu0x-run   "run.sh")
  (setq xkazu0x-build "build.sh"))

(when xkazu0x-win32
  (setq xkazu0x-run   "run.bat")
  (setq xkazu0x-build "build.bat"))

(defun find-project-directory-recursive()
  (interactive)
  (if (file-exists-p xkazu0x-build) t
    (cd "../")
    (find-project-directory-recursive)))

(defun find-project-directory()
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (cd find-project-from-directory)
  (find-project-directory-recursive)
  (setq last-compilation-directory default-directory))

(defun run-project()
  (interactive)
  (if (find-project-directory) (compile xkazu0x-run)
    (other-window 1)))

(defun build-project()
  (interactive)
  (if (find-project-directory) (compile xkazu0x-build)
    (other-window 1)))

(defun build-project-debug()
  (interactive)
  (if (find-project-directory) (compile (concat xkazu0x-build " debug"))
    (other-window 1)))

(defun build-project-release()
  (interactive)
  (if (find-project-directory) (compile (concat xkazu0x-build " release"))
    (other-window 1)))

;; --- Key Binding ---------------------------------------------
(global-unset-key [mouse-2])
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "<f5>") 'run-project)

(global-set-key (kbd "<f6>") 'build-project)
(global-set-key (kbd "<f7>") 'build-project-debug)
(global-set-key (kbd "<f8>") 'build-project-release)

(global-set-key (kbd "M-m") 'build-project)
(global-set-key (kbd "M-,") 'build-project-debug)
(global-set-key (kbd "M-.") 'build-project-release)

(global-set-key (kbd "<f9>") 'first-error)
(global-set-key (kbd "<f10>") 'previous-error)
(global-set-key (kbd "<f11>") 'next-error)

(global-set-key (kbd "M-h") 'split-window-horizontally)
(global-set-key (kbd "M-v") 'split-window-vertically)

(global-set-key (kbd "M-w") 'other-window)
(global-set-key (kbd "M-q") 'delete-window)

(global-set-key (kbd "M-l") 'comment-region)
(global-set-key (kbd "M-L") 'uncomment-region)

(global-set-key (kbd "M-u") 'undo)
(global-set-key (kbd "M-6") 'upcase-word)
(global-set-key (kbd "M-^") 'capitalize-word)

(global-set-key (kbd "M-[") 'start-kbd-macro)
(global-set-key (kbd "M-]") 'end-kbd-macro)
(global-set-key (kbd "M-'") 'call-last-kbd-macro)

(global-set-key (kbd "C-q") 'kill-ring-save)

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

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; --- Basics --------------------------------------------------
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(setq undo-limit (* 16 1024 1024))
(setq undo-strong-limit (* 24 1024 1024))
(setq undo-outer-limit (* 64 1024 1024))

;;(ido-mode 1)
;;(ido-everywhere 1)
(global-display-line-numbers-mode 1)
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

;; (prefer-coding-system 'utf-8)
;; (setq coding-system-for-read 'utf-8)
;; (setq coding-system-for-write 'utf-8)
;; (set-language-environment "UTF-8")
;; (set-selection-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (setq-default buffer-file-coding-system 'utf-8)

(setq mouse-wheel-progressive-speed nil)
(setq scroll-margin 16)
(setq scroll-conservatively 100000)
(setq scroll-preserve-screen-position 'always)

(setq disabled-command-function nil)

(setq search-highlight t)
(setq query-replace-highlight t)

(setq-default truncate-lines nil)

(setq use-short-answers t)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq initial-scratch-message "")

(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; --- Package Manager -----------------------------------------
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; --- Packages ------------------------------------------------
(use-package ivy
  :ensure t
  :config (ivy-mode 1))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))
