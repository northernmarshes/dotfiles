;; ---------- Minimal UI ----------
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

(setq inhibit-startup-screen t)
(global-display-line-numbers-mode 1)

;; ---------- Theme ----------
(load-theme 'doom-one t)

;; ---------- Which-key ----------
(which-key-mode)

;; ---------- Vim keybindings ----------
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

;; ---------- Completion ----------
(vertico-mode)
(marginalia-mode)

;; ---------- Org ----------
(require 'org)

(setq org-startup-indented t
      org-hide-emphasis-markers t
      org-pretty-entities t
      org-ellipsis " ▾")

;; Pretty Org
(require 'org-modern)
(global-org-modern-mode)

;; Better folding visuals
(add-hook 'org-mode-hook #'visual-line-mode)

;; Optional: nicer bullets
; (setq org-modern-star ["◉" "○" "✸" "✿"])
