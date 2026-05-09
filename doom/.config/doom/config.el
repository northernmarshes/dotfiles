;; Czcionka
;;(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'semi-light)
 ;;     doom-big-font (font-spec :family "Fira Code" :size 24)) ;; big font-spec
(set-face-attribute 'default nil :height 140)
;; Wybór motywu
(setq doom-theme 'doom-nord) ;;

; (use-package ef-themes
;   :config
;   (load-theme 'ef-dark)) ;; ef-summer / ef-light / ef-dark

; Ciemne
; doom-one – klasyczny ciemny, elegancki.
; doom-one-light – jasna odmiana doom-one.
; doom-tomorrow-night – ciemny, kontrastowy.
; doom-gruvbox – ciemne kolory w stylu Gruvbox.
; doom-palenight – fioletowo-niebieski, nowoczesny.
; doom-vibrant – mocne, żywe kolory.
; Jasne
; doom-solarized-light – jasny Solarized.
; doom-challenger-deep – ciemny, ale nie tak kontrastowy jak Dracula.
; doom-outrun-electric – neonowy, futurystyczny.
; doom-Iosvkem – inspirowany klasycznym Emacsem i minimalizmem.
; Specjalne / minimalistyczne
; doom-molokai – styl Monokai, ciemny i kontrastowy.
; doom-nova – pastelowy, przyjazny dla oczu.
; doom-peacock – kolorowy i energetyczny.

;; Wyłącz potwierdzanie przy wyjściu
(setq confirm-kill-emacs nil)
;; -----------------------------
;; Fish shell → Emacs: import PATH
;; -----------------------------
;;(use-package! exec-path-from-shell
;;  :init
;;  (setq exec-path-from-shell-arguments '("-l")) ; dodaj -l dla fish
;;  (setq exec-path-from-shell-variables
;;        '("PATH" "VIRTUAL_ENV" "PYENV_ROOT"))
;;  :config
;;  (exec-path-from-shell-initialize))

;; -----------------------------
;; Python Virtualenv
;; -----------------------------
;;(use-package! pyvenv
;;  :config
;;  (pyvenv-activate "/home/edna/venv")
;;  ;; Dodaj venv/bin do exec-path PO aktywacji
;;  (add-to-list 'exec-path (concat (file-name-as-directory pyvenv-virtual-env) "bin")))

;; -----------------------------
;; LSP z WYMUSZONYM pylsp
;; -----------------------------
;;(after! lsp-mode
  ;; KLUCZOWE: wymuś użycie pylsp dla Pythona
;;  (setq lsp-pyright-disable-language-services t  ; wyłącz pyright jeśli zainstalowany
;;        lsp-pylsp-server-command '("pylsp")      ; jawne wskazanie pylsp
;;        lsp-log-io t)                            ; debug - zobacz co się dzieje

  ;; Konfiguracja pylsp
;;  (setq lsp-pylsp-plugins-flake8-enabled t
;;        lsp-pylsp-plugins-autopep8-enabled t
;;        lsp-pylsp-plugins-yapf-enabled nil
;;        lsp-pylsp-plugins-rope-completion-enabled t))

;; Priorytet pylsp przed innymi serwerami Pythona
;;(after! lsp-pyright
;;  (setq lsp-disabled-clients '(pyright)))

;; Automatyczne LSP w Pythonie
;;(add-hook 'python-mode-hook #'lsp-deferred)

;; -----------------------------
;; Debug: szczegółowa diagnostyka
;; -----------------------------
;;(defun my/check-pylsp ()
;;  "Sprawdź czy pylsp jest dostępny"
;;  (interactive)
;;  (message "PATH: %s" (getenv "PATH"))
;;  (message "exec-path: %s" exec-path)
;;  (message "pylsp location: %s" (executable-find "pylsp"))
;;  (message "python3 location: %s" (executable-find "python3"))
;;  (message "Active venv: %s" pyvenv-virtual-env))

;; Automatyczne sprawdzenie przy starcie
;;(add-hook 'emacs-startup-hook #'my/check-pylsp)

;; -----------------------------
;; Corfu (bez zmian)
;; -----------------------------
;;(after! corfu
;;  (setq corfu-auto t
;;        corfu-auto-delay 0.1
;;        corfu-auto-prefix 1))
