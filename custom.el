; -*-Emacs-Lisp-*-
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-mode-case-fold t)
 '(auto-save-file-name-transforms (list (list ".*" (concat estarter-dotfiles-dir "auto-save-list/") t)))
 '(backup-directory-alist (list (cons "." (concat estarter-dotfiles-dir "backups/"))))
 '(backward-delete-char-untabify-method nil)
 '(bookmark-default-file "~/.emacs.d/.emacs.bmk")
 '(css-indent-offset estarter-tab-width)
 '(delete-by-moving-to-trash t)
 '(echo-keystrokes 0.1)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fill-column 80)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(imenu-auto-rescan t)
 '(indent-tabs-mode estarter-indent-tabs-mode)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote emacs-lisp-mode))
 '(js2-basic-offset estarter-tab-width)
 '(js2-highlight-level 3)
 '(js2-mirror-mode nil)
 '(message-log-max t)
 '(mode-require-final-newline nil)
 '(mouse-wheel-mode t)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(org-startup-truncated nil)
 '(python-guess-indent nil)
 '(python-indent estarter-tab-width)
 '(ruby-indent-tabs-mode estarter-indent-tabs-mode)
 '(ruby-insert-encoding-magic-comment nil)
 '(save-place t nil (saveplace))
 '(save-place-file "/Users/medikoo/.emacs.d/places")
 '(shift-select-mode nil)
 '(tab-stop-list (let ((list (list estarter-tab-width))) (while (< (car (last list)) 200) (nconc list (list (+ estarter-tab-width (car (last list)))))) list))
 '(tab-width estarter-tab-width)
 '(truncate-partial-width-windows nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vc-make-backup-files t)
 '(visible-bell t)
 '(whitespace-line-column fill-column)
 '(whitespace-style (quote (trailing lines-tail indentation space-after-tab space-before-tab))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )