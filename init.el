;; init.el --- Where everything begins
;;
;; Copyright (C) 2010, 2011 Mariusz Nowak <mariusz+emacs@medikoo.com>
;; Author: Mariusz Nowak <mariusz+emacs@medikoo.com>
;; Inpired and initially based on Phil Hagelberg's Emacs Starter kit
;; https://github.com/technomancy/emacs-starter-kit

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.	 See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, see <http://www.gnu.org/licenses/>.

;;; Commentary
;;
;; This setup is inspired by and have parts copied from Emacs Starter Kit:
;; http://github.com/technomancy/emacs-starter-kit
;;
;; This is the first thing to get loaded.

;; Configure interface
(menu-bar-mode -1)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set coding system
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Set environment variables
(setq my-dotfiles-dir (file-name-directory (or (buffer-file-name)
			load-file-name)))
(setq my-elisp-dir (let ((path (symbol-file 'add-hook 'defun)))
		(substring path 0 (+ 1 (string-match "/lisp/" path)))))
(setq my-vendor-dir (concat my-dotfiles-dir "vendor/"))
(setq my-vendor-user-dir (concat my-vendor-dir "user/"))
(setq my-custom-file-default (concat my-dotfiles-dir "custom.el.default"))
(setq custom-file (concat my-dotfiles-dir "custom.el"))
(if (and (not (file-exists-p custom-file))
		(file-exists-p my-custom-file-default))
	(copy-file my-custom-file-default custom-file))
(add-to-list 'load-path my-vendor-dir)
(add-to-list 'load-path my-vendor-user-dir)

;; Compile when needed
(defun my-recompile-all ()
	(let ((noninteractive t))
		(byte-recompile-directory my-dotfiles-dir 0)))
(my-recompile-all)
(add-hook 'kill-emacs-hook 'my-recompile-all)

;; Generate and load autoloads
(require 'cl)
(setq generated-autoload-file (concat my-dotfiles-dir "loaddefs.el"))
(update-directory-autoloads my-vendor-dir my-vendor-user-dir)
(load generated-autoload-file)

;; Load needed modules (ones that won't go automatically through autoload)
(autoload 'paredit-mode "paredit"
	"Minor mode for pseudo-structurally editing Lisp code." t)
(require 'show-point-mode)
(require 'saveplace)
(require 'my-screen/el-screen)

;; Turn on helpful modes
(blink-cursor-mode 1)
(auto-compression-mode t)
(recentf-mode 1)
(show-paren-mode 1)
(sml-modeline-mode)
(color-theme-initialize)
(if (and (not (file-exists-p (concat my-vendor-dir "snippets")))
		(file-exists-p (concat my-vendor-dir "snippets.default")))
	(my-directory-copy (concat my-vendor-dir "snippets.default")
		(concat my-vendor-dir "snippets")))
(require 'yasnippet)
(yas/initialize)

;; Fixes for broken or not working properly functions
(load (concat my-dotfiles-dir "fix"))

;; Seed the random-number generator
(random t)

;; Make life easier
(defalias 'yes-or-no-p 'y-or-n-p)

;; Customize key bindings
(load (concat my-dotfiles-dir "keys"))

;; Major Mode-specific customizations
(load (concat my-dotfiles-dir "mode-helpers"))
(load (concat my-dotfiles-dir "modes"))

;; System-specific customizations
(load (concat my-dotfiles-dir (symbol-name system-type)) 'noerror)

;; Defaults
(setq my-tab-width 2)
(setq my-indent-tabs-mode t)
(setq my-color-theme 'color-theme-my-charcoal-black)
(setq my-frame-alpha 97)

;; User-specific customizations
(yas/load-directory (concat my-vendor-dir "snippets"))
(load (concat my-dotfiles-dir "config.el") 'noerror)
(load custom-file 'noerror)

;; Load color theme
(funcall my-color-theme)
;; Emacs's win.el will override some face values
;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3434
;; so we're loading it later again through `window-setup-hook'
(add-hook 'window-setup-hook my-color-theme)

;; Set frame alpha
(modify-all-frames-parameters (list (cons 'alpha my-frame-alpha)))

;; Load screen manager
(el-screen-init)
