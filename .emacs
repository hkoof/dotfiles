(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(comment-style (quote extra-line))
 '(current-language-environment "ASCII")
 '(fill-column 80)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(inhibit-splash-screen t)
 '(ps-default-bg (quote (46 52 54)))
 '(ps-default-fg "white")
 '(py-indent-offset 4)
 '(py-tab-always-indent t)
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(setq font-lock-maximum-decoration
  '((c-mode    . 3) 
    (c++-mode  . 3)
    (java-mode . 3)
    (jde-mode  . 3)
    (t         . 3))
)

(global-font-lock-mode t)
(show-paren-mode t)
(column-number-mode t)

(defun my-c-mode-common-hook ()
  (c-set-style "k&r")
;;  (setq tab-width 4
;;		;; this will make sure spaces are used instead of tabs
;;		indent-tabs-mode nil
;;		)
  (setq c-basic-offset 4)
  (c-set-offset 'case-label '4)
  (c-set-offset 'comment-intro '0)
  )
;;  (c-toggle-auto-hungry-state t))


(defun hindent ()                                     ;; maak een nieuwe functie zonder parameters
  (interactive)                                       ;; die vanuit de editor kan worden aangeroepen
  (shell-command-on-region (point-min) (point-max)    ;; doe een shell commando op een hele buffer
                           "/home/heiko/bin/hindent"  ;; het uit te voeren shell commando
                           (current-buffer)           ;; gebruik de huidige buffer
                           t))                        ;; vervang de tekst in de buffer met de uitvoer


(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))


(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(setq compile-command "make")
(define-key ctl-x-map "\M-m" 'compile)
(define-key ctl-x-map "\M-i" 'hindent)
(define-key ctl-x-map "t" 'complete-tag)
(define-key ctl-x-map "\M-." 'goto-line)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(5 . 0))
(global-set-key [f11] 'fullscreen)
;; (server-start)
(set-language-environment "UTF-8")  ;; om rare character als \x044 te vertalen in compilatie-window