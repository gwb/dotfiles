;;; prot-simple.el --- Common commands for my dotemacs -*- lexical-binding: t -*-

;; Copyright (C) 2020  Protesilaos Stavrou

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://protesilaos.com/dotemacs
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Common commands for my Emacs: <https://protesilaos.com/dotemacs/>.

;;; Code:

(defgroup prot-simple ()
  "Generic utilities for my dotemacs."
  :group 'editing)

;;; Commands

;;;; General commands

(declare-function symbol-at-point "thingatpt")

;;;###autoload
(defun prot-simple-describe-symbol (&optional arg)
    "Run `describe-symbol' for the `symbol-at-point'.

With an optional ARG prefix argument (\\[universal-argument]),
switch to the *Help* window.  If that is already focused, switch
to the most recently used window instead."
    (interactive "P")
    (let ((symbol (symbol-at-point)))
      (when symbol
        (describe-symbol symbol)))
    (when arg
      (let ((help (get-buffer-window "*Help*")))
        (when (window-live-p help)
          (if (not (eq (selected-window) help))
              (select-window help)
            (select-window (get-mru-window)))))))

;;;; Comands for lines

;;;###autoload
(defun prot-simple-new-line-below (&optional arg)
  "Create an empty line below the current one.
Move the point to the absolute beginning.  Adapt indentation by
passing optional prefix ARG (\\[universal-argument]).  Also see
`prot-simple-new-line-above'."
  (interactive "P")
  (end-of-line)
  (if arg
      (newline-and-indent)
    (newline)))

;;;###autoload
(defun prot-simple-new-line-above (&optional arg)
  "Create an empty line above the current one.
Move the point to the absolute beginning.  Adapt indentation by
passing optional prefix ARG (\\[universal-argument])."
  (interactive "P")
  (let ((indent (or arg nil)))
    (if (or (bobp)
            (line-number-at-pos 1))
        (progn
          (beginning-of-line)
          (newline)
          (forward-line -1))
      (forward-line -1)
      (prot-simple-new-line-below indent))))

;;;###autoload
(defun prot-simple-copy-line-or-region (&optional arg)
  "Kill-save the current line or active region.
With optional ARG (\\[universal-argument]) duplicate the target
instead.  When region is active, also apply context-aware
indentation while duplicating."
  (interactive "P")
  (let* ((rbeg (region-beginning))
         (rend (region-end))
         (pbol (point-at-bol))
         (peol (point-at-eol))
         (indent (if (eq (or rbeg rend) pbol) nil arg)))
    (if arg
        (progn
          (if (use-region-p)
              (progn
                (copy-region-as-kill rbeg rend)
                (when (eq (point) rbeg)
                  (exchange-point-and-mark))
                (prot-simple-new-line-below indent))
            (copy-region-as-kill pbol peol)
            (prot-simple-new-line-below))
          (yank))
      (copy-region-as-kill pbol peol)
      (message "Current line copied"))))

;;;###autoload
(defun prot-simple-yank-replace-line-or-region ()
  "Replace line or region with latest kill.
This command can then be followed by the standard
`yank-pop' (default is bound to \\[yank-pop])."
  (interactive)
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (delete-region (point-at-bol) (point-at-eol)))
  (yank))

;;;###autoload
(defun prot-simple-multi-line-next ()
  "Move point 15 lines down."
  (interactive)
  (forward-line 15))

;;;###autoload
(defun prot-simple-multi-line-prev ()
  "Move point 15 lines up."
  (interactive)
  (forward-line -15))

;;;###autoload
(defun prot-simple-kill-line-backward ()
  "Kill from point to the beginning of the line."
  (interactive)
  (kill-line 0))

;;;; Commands for text insertion or manipulation

;; Got those numbers from `string-to-char'
(defcustom prot-simple-insert-pair-alist
  '(("' Single quote" . (39 39))           ; ' '
    ("\" Double quotes" . (34 34))         ; " "
    ("` Elisp quote" . (96 39))            ; ` '
    ("‘ Single apostrophe" . (8216 8217))  ; ‘ ’
    ("“ Double apostrophes" . (8220 8221)) ; “ ”
    ("( Parentheses" . (40 41))            ; ( )
    ("{ Curly brackets" . (123 125))       ; { }
    ("[ Square brackets" . (91 93))        ; [ ]
    ("< Angled brackets" . (60 62))        ; < >
    ("« Εισαγωγικά Gr quote" . (171 187))  ; « »
    ("= Equals signs" . (61 61))           ; = =
    ("* Asterisks" . (42 42))              ; * *
    ("_ underscores" . (95 95)))           ; _ _
  "Alist of pairs for use with `prot-simple-insert-pair-completion'."
  :type 'alist
  :group 'prot-simple)

;;;###autoload
(defun prot-simple-insert-pair-completion (&optional num)
  "Insert pair from `prot-simple-insert-pair-alist'.
With optional NUM numeric argument, insert pair to NUMth
constructs.  A negative number counts backwards."
  (interactive "p")
  (let* ((data prot-simple-insert-pair-alist)
         (chars (mapcar #'car data))
         (choice (completing-read "Select character: " chars nil t))
         (left (cadr (assoc choice data)))
         (right (caddr (assoc choice data)))
         (n (or num 1)))
    (insert-pair n left right)))

;;;; Commands for object transposition

(defmacro prot-simple-transpose (name scope &optional doc)
  "Macro to produce transposition functions.
NAME is the function's symbol.  SCOPE is the text object to
operate on.  Optional DOC is the function's docstring.

Transposition over an active region will swap the object at
mark (region beginning) with the one at point (region end)"
  `(defun ,name (arg)
     ,doc
     (interactive "p")
     (let ((x (format "%s-%s" "transpose" ,scope)))
       (if (use-region-p)
           (funcall (intern x) 0)
         (funcall (intern x) arg)))))

(prot-simple-transpose
 prot-simple-transpose-lines
 "lines"
 "Transpose lines or swap over active region.")

(prot-simple-transpose
 prot-simple-transpose-paragraphs
 "paragraphs"
 "Transpose paragraphs or swap over active region.")

(prot-simple-transpose
 prot-simple-transpose-sentences
 "sentences"
 "Transpose sentences or swap over active region.")

(prot-simple-transpose
 prot-simple-transpose-sexps
 "sexps"
 "Transpose balanced expressions or swap over active region.")

;;;###autoload
(defun prot-simple-transpose-chars ()
  "Always transposes the two characters before point.
There is no 'dragging' the character forward.  This is the
behaviour of `transpose-chars' when point is at the end of the
line."
  (interactive)
  (transpose-chars -1)
  (forward-char))

;;;###autoload
(defun prot-simple-transpose-words (arg)
  "Transpose ARG words.

If region is active, swap the word at mark (region beginning)
with the one at point (region end).

Otherwise, and while inside a sentence, this behaves as the
built-in `transpose-words', dragging forward the word behind the
point.  The difference lies in its behaviour at the end or
beginnning of a line, where it will always transpose the word at
point with the one behind or ahead of it (effectively the
last/first two words)."
  (interactive "p")
  (cond
   ((use-region-p)
    (transpose-words 0))
   ((eq (point) (point-at-eol))
    (transpose-words -1))
   ((eq (point) (point-at-bol))
    (forward-word 1)
    (transpose-words 1))
   (t
    (transpose-words arg))))

;;;; Commands for marking syntactic constructs

(defmacro prot-simple-mark (name object &optional docstring)
  "Produce function for marking small syntactic constructs.
NAME is how the function should be called.  OBJECT is its scope.
Optional DOCSTRING describes the resulting function.

This is a slightly modified version of the built-in `mark-word'."
  `(defun ,name (&optional arg allow-extend)
     ,docstring
     (interactive "P\np")
     (let ((x (format "%s-%s" "forward" ,object)))
       (cond ((and allow-extend
                   (or (and (eq last-command this-command) (mark t))
                       (region-active-p)))
              (setq arg (if arg (prefix-numeric-value arg)
                          (if (< (mark) (point)) -1 1)))
              (set-mark
               (save-excursion
                 (goto-char (mark))
                 (funcall (intern x) arg)
                 (point))))
             (t
              (let ((bounds (bounds-of-thing-at-point (intern ,object))))
                (unless (consp bounds)
                  (user-error "No %s at point" ,object))
                (if (>= (prefix-numeric-value arg) 0)
                    (goto-char (car bounds))
                  (goto-char (cdr bounds)))
                (push-mark
                 (save-excursion
                   (funcall (intern x) (prefix-numeric-value arg))
                   (point)))
                (activate-mark)))))))

(prot-simple-mark
 prot-simple-mark-word
 "word"
 "Mark the whole word at point.
This function is a slightly modified version of the built-in
`mark-word', that I intend to use only in special circumstances,
such as when recording a keyboard macro where precision is
required.  For a general purpose utility, use `prot-simple-mark-symbol'
instead.")

(prot-simple-mark
 prot-simple-mark-symbol
 "symbol"
 "Mark the whole symbol at point.
With optional ARG, mark the current symbol and any remaining
ARGth symbols away from point.  A negative argument moves
backward. Repeated invocations of this command mark the next
symbol in the direction originally specified.

In the absence of a symbol and if a word is present at point,
this command will operate on it as described above.")

;;;###autoload
(defun prot-simple-mark-sexp-backward (&optional arg)
  "Mark previous or ARGth balanced expression[s].
Just a convenient backward-looking `mark-sexp'."
  (interactive "P")
  (if arg
      (mark-sexp (- arg) t)
    (mark-sexp (- 1) t)))

;;;###autoload
(defun prot-simple-mark-construct-dwim (&optional arg)
  "Mark symbol or balanced expression at point.
A do-what-I-mean wrapper for `prot-simple-mark-sexp-backward',
`mark-sexp', and `prot-simple-mark-symbol'.

When point is over a symbol, mark the entirety of it.  Regular
words are interpreted as symbols when an actual symbol is not
present.

For balanced expressions, a backward match will happen when point
is to the right of the closing delimiter.  A forward match is the
fallback condition and should work when point is before a
balanced expression, with or without whitespace in between it an
the opening delimiter.

Optional ARG will mark a total of ARGth objects while counting
the current one (so 3 would be 1+2 more).  A negative count moves
the mark backward (though that would invert the backward-moving
sexp matching of `prot-simple-mark-sexp-backward', so be mindful of
where the point is).  Repeated invocations of this command
incrementally mark objects in the direction originally
specified."
  (interactive "P")
  (cond
   ((symbol-at-point)
    (prot-simple-mark-symbol arg t))
   ((eq (point) (cdr (bounds-of-thing-at-point 'sexp)))
    (prot-simple-mark-sexp-backward arg))
   (t
    (mark-sexp arg t))))

;;;; Commands for code navigation (work in progress)

;;;###autoload
(defun prot-simple-downward-list (&optional arg)
  "Like `backward-up-list' but defaults to a forward motion.
With optional ARG, move that many times in the given
direction (negative is forward due to this being a
'backward'-facing command)."
  (interactive "P")
  (backward-up-list (or arg -1)))

(provide 'prot-simple)
;;; prot-simple.el ends here