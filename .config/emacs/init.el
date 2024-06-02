;;; no-name --- self-explanatory  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;;  It's a personal Emacs config.

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)

;; Editing

; https://github.com/meow-edit/meow/discussions/584
;(transient-define-prefix dispatch-goto-menu () "This isn't documentation"
;  [["Move"
;    ("e" "bottom" end-of-buffer)
;    ("g" "top" beginning-of-buffer)
;    ("d" "definition (xref)" xref-find-definitions)
;    ("h" "beginning of line" beginning-of-line)
;    ("l" "end of line" end-of-line)
;    ("s" "first non-blank-line" beginning-of-line-text)]
;   ["Buffer"
;    ("n" "next buffer" next-buffer)
;    ("p" "previous buffer" previous-buffer)
;    ("b" "bury buffer" bury-buffer)
;    ("u" "unbury buffer" unbury-buffer)
;    "Avy"
;    ("c" "goto char" avy-goto-char)
;    ("L" "got line" avy-goto-line)]
;   ["LSP"
;    ("r" "references" lsp-ui-peek-find-references)
;    "Files"
;    ("f" "file at point" find-file-at-point)
;    ("a" "last file" pop-global-mark)]])


(require 'meow)                         ; req into use-package?

(use-package meow
  :ensure t
  :config
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-dvp)
  (setq meow-expand-exclude-mode-list nil) ; org, see meow github issue #110
  (setq meow-use-clipboard t)
  (meow-leader-define-key
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument))
  (meow-normal-define-key
   '("?" . meow-cheatsheet)
   '("/" . meow-describe-key)
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("*" . meow-expand-0)
   '("=" . meow-expand-9)
   '("!" . meow-expand-8)
   '("[" . meow-expand-7)
   '("]" . meow-expand-6)
   '("{" . meow-expand-5)
   '("+" . meow-expand-4)
   '("}" . meow-expand-3)
   '(")" . meow-expand-2)
   '("(" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("<" . meow-beginning-of-thing)
   '(">" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-line)
   '("E" . meow-goto-line)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-join)
   '("k" . meow-kill)
   '("l" . meow-till)
   '("m" . meow-mark-word)
   '("M" . meow-mark-symbol)
   '("n" . meow-next)
   '("N" . meow-next-expand)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-prev)
   '("P" . meow-prev-expand)
   '("q" . meow-quit)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-search)
   '("t" . meow-right)
   '("T" . meow-right-expand)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("x" . meow-save)
   '("X" . meow-sync-grab)
   '("y" . meow-yank)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("L" . apropos)                     ; L stands for L
   '("<escape>" . ignore))
  (meow-global-mode 1))


;; Dev
; go through meow--setup recommendations

(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)    ; binding convention advises against C-c C-p
  :config
  (projectile-mode 1))


(use-package flycheck                   ; github issue 213 weird
  :config                               ; conflict prefix C-! with org [timestamp]
  (global-flycheck-mode))
;; https://emacs.stackexchange.com/questions/74222/how-can-i-set-tex-lacheck-as-default-checker


(use-package company
  :config
  (global-company-mode))


(use-package magit
  :init
  (setq magit-repository-directories
        '(("/ft2/clone/" . 1))))


(use-package magit-org-todos
  :config
  (magit-org-todos-autoinsert))


(use-package diff-hl
  :config
  (global-diff-hl-mode))


;; Util?

(use-package vterm)


(use-package openwith
  :init
  (setq openwith-associations '(("\\.pdf" "zathura" (file))))
  :config
  (openwith-mode t))


(use-package ivy
  :config
  (ivy-mode))

(global-set-key (kbd "C-s") 'swiper)


(use-package which-key
  :init
  (setq which-key-sort-order 'which-key-description-order)
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode))


(defun split-and-follow-horizontally ()
  "Create a new window below, and focus it."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-and-follow-vertically ()
  "Create a new window to starboard, and focus it."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)


(defun reload-init ()
  "Reload config, ie init.el."
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))


(setq-default indent-tabs-mode nil)


;; Org
;  magit-org-todo in section magit

(use-package org
  :init
  (setq org-startup-folded 'content)
  (setq org-agenda-files "/ft2/wekstm/.agenda-files")
  :bind
  ("C-c h" . org-time-stamp-inactive)    ; see comment use-package flycheck
  ("C-c c" . org-capture)
  :config
  (setq org-todo-keywords
        '((sequence "PRELIMINARY" "INVESTIGATE" "|" "ASSIGNED")
          (sequence "TODO" "|" "DONE")))
  (setq org-capture-templates
        '(("g" "And here we gay again!"  ; this has the advantage that the chord is cgi
           plain (file+headline "/ft2/wekstm/recluse.org" "P")
           "*** %?"
           :empty-lines-after 1))))


;; Languages
; add something to latex here, also python and clojure
; the checker thing


;; Misc

(require 'calendar)                     ; req into use-package?

(use-package calendar
  :init
  (setq calendar-week-start-day 1)
  :hook
  (calendar-load-hook . (lambda () (calendar-set-date-style 'european))))


(setq make-backup-files nil)


;; Aesthetics

;(menu-bar-mode   -1)       ; The method via push is slightly faster, as measured via
;(tool-bar-mode   -1)       ; via emacs-init-time, 1.221939 v 1.091236 s
                            ; Credit to Eshan Ramesh's init ( esrh.me )
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(scroll-bar-mode -1)
;(setq emacs-startup-hook (vterm))
(setq inhibit-splash-screen   t)
(setq inhibit-startup-message t)
(setq-default frame-title-format '("%b"))

(global-display-line-numbers-mode)


(use-package telephone-line
  :ensure t
  :init
  (setq telephone-line-lhs
        '((accent . (telephone-line-meow-tag-segment
                     telephone-line-vc-segment))
          (nil    . (telephone-line-flycheck-segment))))
  (setq telephone-line-rhs
        '((nil    . (telephone-line-major-mode-segment))
          (accent . (telephone-line-projectile-buffer-segment
                     telephone-line-airline-position-segment))))
  (setq telephone-line-primary-left-separator    'telephone-line-identity-right)
  (setq telephone-line-primary-right-separator   'telephone-line-identity-left)
  (setq telephone-line-secondary-left-separator  'telephone-line-identity-hollow-left)
  (setq telephone-line-secondary-right-separator 'telephone-line-identity-hollow-right)
  :config
  (telephone-line-mode 1))


;; Ultimately we want all five of these themes, cycle through them
;; modify the pastel theme such that org/meow interaction isn't broken
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config))

;(use-package catppuccin-theme
;  :init
;  (setq catppuccin-flavor 'macchiato)
;  :config
;  (load-theme 'catppuccin))
  

;; Auto-generated

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("d77d6ba33442dd3121b44e20af28f1fae8eeda413b2c3d3b9f1315fbda021992" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" default))
 '(package-selected-packages
   '(openwith vterm python-mode clojure-mode catppuccin-theme diff-hl counsel magit-org-todos flycheck org-edna org-ql org-roam-ui org-roam org-super-agenda doom-themes avy swiper which-key company mu4e-alert ivy magit meow telephone-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background unspecified)))))

(provide 'init)
;;; init.el ends here
