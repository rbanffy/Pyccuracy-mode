; A (rather minimal) major mode for Emacs to edit Pyccuracy tests
; by Ricardo Banffy (http://dieblinkenlights.com/blog_en)
;
; Hacked together from django-mode and with a huge help from
; http://www.emacswiki.org/emacs/ModeTutorial
; and, most probably, the folks at #emacs

; TODO: Make the syntax regexps automatically from the language files
; TODO: Recognize through a special comment (or the file header) the language file that should be used
; TODO: Make a YASnippet thingie for completion through the language files

; Allows the user to run their own code when the module is run
(defvar pyccuracy-mode-hook nil)

; Sets the default mode for .acc files
(add-to-list 'auto-mode-alist '("\\.acc\\'" . pyccuracy-mode))

; Syntax highlight table
(defconst pyccuracy-font-lock-keywords
  (list
   ; "As a" "I want to" "So that" "Given" "Scenario" "Then" "When"
   '("\\(As a\\|Given\\|I want to\\|S\\(?:cenario\\|o that\\)\\|[TW]hen\\)" . font-lock-keyword-face)
   '("\\(\"\\w*\"\\)" . font-lock-string-face)
   '("\\(#.*\\)" . font-lock-comment-face))
   "Minimal highlighting expressions for Pyccuracy mode")

(defvar pyccuracy-mode-syntax-table
  (let ((pyccuracy-mode-syntax-table (make-syntax-table)))
    pyccuracy-mode-syntax-table)
  "Syntax table for pyccuracy-mode")

(defun pyccuracy-mode ()
  "Major mode for editing Pyccuracy tests"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table pyccuracy-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '(pyccuracy-font-lock-keywords))
  (setq major-mode 'pyccuracy-mode)
  (setq mode-name "Pyccuracy")
  (run-hooks 'pyccuracy-mode-hook))

(provide 'pyccuracy-mode)
