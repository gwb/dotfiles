;;; modus-themes.el --- Highly accessible themes (WCAG AAA) -*- lexical-binding:t -*-

;; Copyright (C) 2019-2021  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://gitlab.com/protesilaos/modus-themes
;; Version: 1.0.2
;; Package-Requires: ((emacs "26.1"))
;; Keywords: faces, theme, accessibility

;; This file is part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The Modus themes conform with the highest standard for color-contrast
;; accessibility between background and foreground values (WCAG AAA).
;; This file contains all customisation options, helper functions,
;; interactive commands, and face specifications.  Please refer to the
;; official Info manual for further documentation (distributed with the
;; themes, or available at: <https://protesilaos.com/modus-themes>).
;;
;; The themes share the following customization options, all of which
;; are disabled by default (nil):
;;
;;     modus-themes-slanted-constructs             (boolean)
;;     modus-themes-bold-constructs                (boolean)
;;     modus-themes-variable-pitch-headings        (boolean)
;;     modus-themes-no-mixed-fonts                 (boolean)
;;     modus-themes-headings                       (alist)
;;     modus-themes-scale-headings                 (boolean)
;;     modus-themes-fringes                        (choice)
;;     modus-themes-lang-checkers                  (choice)
;;     modus-themes-org-blocks                     (choice)
;;     modus-themes-org-habit                      (choice)
;;     modus-themes-prompts                        (choice)
;;     modus-themes-mode-line                      (choice)
;;     modus-themes-diffs                          (choice)
;;     modus-themes-syntax                         (choice)
;;     modus-themes-intense-hl-line                (boolean)
;;     modus-themes-paren-match                    (choice)
;;     modus-themes-region                         (choice)
;;     modus-themes-links                          (choice)
;;     modus-themes-completions                    (choice)
;;
;; The default scale for headings is as follows (it can be customized as
;; well---remember, no scaling takes place by default):
;;
;;     modus-themes-scale-1 1.05
;;     modus-themes-scale-2 1.1
;;     modus-themes-scale-3 1.15
;;     modus-themes-scale-4 1.2
;;     modus-themes-scale-5 1.3
;;
;; There also exist two unique customization options for overriding
;; color palette values.  The specifics are documented in the manual.
;; The symbols are:
;;
;;     modus-themes-operandi-color-overrides       (alist)
;;     modus-themes-vivendi-color-overrides        (alist)
;;
;; Below is the list of explicitly supported packages or face groups
;; (there are implicitly supported packages as well, which inherit from
;; font-lock or some basic group).  You are encouraged to report any
;; missing package or change you would like to see.
;;
;;     ace-window
;;     ag
;;     alert
;;     all-the-icons
;;     annotate
;;     anzu
;;     apropos
;;     apt-sources-list
;;     artbollocks-mode
;;     auctex and TeX
;;     auto-dim-other-buffers
;;     avy
;;     awesome-tray
;;     binder
;;     bm
;;     bongo
;;     boon
;;     breakpoint (provided by built-in gdb-mi.el)
;;     buffer-expose
;;     calendar and diary
;;     calfw
;;     centaur-tabs
;;     cfrs
;;     change-log and log-view (`vc-print-log' and `vc-print-root-log')
;;     cider
;;     circe
;;     color-rg
;;     column-enforce-mode
;;     company-mode
;;     company-posframe
;;     compilation-mode
;;     completions
;;     consult
;;     counsel
;;     counsel-css
;;     counsel-notmuch
;;     counsel-org-capture-string
;;     cov
;;     cperl-mode
;;     csv-mode
;;     ctrlf
;;     custom (M-x customize)
;;     dap-mode
;;     dashboard (emacs-dashboard)
;;     deadgrep
;;     debbugs
;;     define-word
;;     deft
;;     dictionary
;;     diff-hl
;;     diff-mode
;;     dim-autoload
;;     dir-treeview
;;     dired
;;     dired-async
;;     dired-git
;;     dired-git-info
;;     dired-narrow
;;     dired-subtree
;;     diredc
;;     diredfl
;;     diredp (dired+)
;;     disk-usage
;;     doom-modeline
;;     dynamic-ruler
;;     easy-jekyll
;;     easy-kill
;;     ebdb
;;     ediff
;;     eglot
;;     el-search
;;     eldoc
;;     eldoc-box
;;     elfeed
;;     elfeed-score
;;     emms
;;     enhanced-ruby-mode
;;     epa
;;     equake
;;     erc
;;     eros
;;     ert
;;     eshell
;;     eshell-fringe-status
;;     eshell-git-prompt
;;     eshell-prompt-extras (epe)
;;     eshell-syntax-highlighting
;;     evil (evil-mode)
;;     evil-goggles
;;     evil-snipe
;;     evil-visual-mark-mode
;;     eww
;;     exwm
;;     eyebrowse
;;     fancy-dabbrev
;;     flycheck
;;     flycheck-color-mode-line
;;     flycheck-indicator
;;     flycheck-posframe
;;     flymake
;;     flyspell
;;     flyspell-correct
;;     flx
;;     freeze-it
;;     frog-menu
;;     focus
;;     fold-this
;;     font-lock (generic syntax highlighting)
;;     forge
;;     fountain (fountain-mode)
;;     geiser
;;     git-commit
;;     git-gutter (and variants)
;;     git-lens
;;     git-rebase
;;     git-timemachine
;;     git-walktree
;;     gnus
;;     golden-ratio-scroll-screen
;;     helm
;;     helm-ls-git
;;     helm-switch-shell
;;     helm-xref
;;     helpful
;;     highlight-blocks
;;     highlight-defined
;;     highlight-escape-sequences (`hes-mode')
;;     highlight-indentation
;;     highlight-numbers
;;     highlight-symbol
;;     highlight-tail
;;     highlight-thing
;;     hl-defined
;;     hl-fill-column
;;     hl-line-mode
;;     hl-todo
;;     hydra
;;     hyperlist
;;     ibuffer
;;     icomplete
;;     ido-mode
;;     iedit
;;     iflipb
;;     imenu-list
;;     indium
;;     info
;;     info-colors
;;     interaction-log
;;     ioccur
;;     isearch, occur, etc.
;;     ivy
;;     ivy-posframe
;;     jira (org-jira)
;;     journalctl-mode
;;     js2-mode
;;     julia
;;     jupyter
;;     kaocha-runner
;;     keycast
;;     line numbers (`display-line-numbers-mode' and global variant)
;;     lsp-mode
;;     lsp-ui
;;     macrostep
;;     magit
;;     magit-imerge
;;     make-mode
;;     man
;;     marginalia
;;     markdown-mode
;;     markup-faces (`adoc-mode')
;;     mentor
;;     messages
;;     minibuffer-line
;;     minimap
;;     modeline
;;     mood-line
;;     mpdel
;;     mu4e
;;     mu4e-conversation
;;     multiple-cursors
;;     neotree
;;     no-emoji
;;     notmuch
;;     num3-mode
;;     nxml-mode
;;     objed
;;     orderless
;;     org
;;     org-journal
;;     org-noter
;;     org-pomodoro
;;     org-recur
;;     org-roam
;;     org-superstar
;;     org-table-sticky-header
;;     org-tree-slide
;;     org-treescope
;;     origami
;;     outline-mode
;;     outline-minor-faces
;;     package (M-x list-packages)
;;     page-break-lines
;;     paradox
;;     paren-face
;;     parrot
;;     pass
;;     pdf-tools
;;     persp-mode
;;     perspective
;;     phi-grep
;;     phi-search
;;     pkgbuild-mode
;;     pomidor
;;     popup
;;     powerline
;;     powerline-evil
;;     prism (see "Note for prism.el" in the manual)
;;     proced
;;     prodigy
;;     racket-mode
;;     rainbow-blocks
;;     rainbow-identifiers
;;     rainbow-delimiters
;;     rcirc
;;     recursion-indicator
;;     regexp-builder (also known as `re-builder')
;;     rg
;;     ripgrep
;;     rmail
;;     ruler-mode
;;     sallet
;;     selectrum
;;     semantic
;;     sesman
;;     shell-script-mode
;;     show-paren-mode
;;     shr
;;     side-notes
;;     sieve-mode
;;     skewer-mode
;;     smart-mode-line
;;     smartparens
;;     smerge
;;     spaceline
;;     speedbar
;;     spell-fu
;;     stripes
;;     suggest
;;     switch-window
;;     swiper
;;     swoop
;;     sx
;;     symbol-overlay
;;     tab-bar-mode
;;     tab-line-mode
;;     syslog-mode
;;     table (built-in table.el)
;;     telephone-line
;;     term
;;     tomatinho
;;     transient (pop-up windows like Magit's)
;;     trashed
;;     treemacs
;;     tty-menu
;;     tuareg
;;     typescript
;;     undo-tree
;;     vc (built-in mode line status for version control)
;;     vc-annotate (C-x v g)
;;     vdiff
;;     vimish-fold
;;     visible-mark
;;     visual-regexp
;;     volatile-highlights
;;     vterm
;;     wcheck-mode
;;     web-mode
;;     wgrep
;;     which-function-mode
;;     which-key
;;     whitespace-mode
;;     window-divider-mode
;;     winum
;;     writegood-mode
;;     woman
;;     xah-elisp-mode
;;     xref
;;     xterm-color (and ansi-colors)
;;     yaml-mode
;;     yasnippet
;;     ztree
;;
;; For a complete view of the project, also refer to the following files
;; (should be distributed in the same repository/directory as the
;; current item):
;;
;; - modus-operandi-theme.el    (Light theme)
;; - modus-vivendi-theme.el     (Dark theme)

;;; Code:



(require 'cl-lib)

(defgroup modus-themes ()
  "Options for `modus-operandi', `modus-vivendi'."
  :group 'faces
  :prefix "modus-themes-"
  :tag "Modus Themes")

;;; Variables for each theme variant

;;;; Modus Operandi

(define-obsolete-variable-alias
  'modus-operandi-theme-default-colors-alist
  'modus-themes-colors-operandi
  "1.0.0")

(define-obsolete-variable-alias
  'modus-themes-colors-operandi
  'modus-themes-operandi-colors
  "1.1.0")

(defconst modus-themes-operandi-colors
  '(;; base values
    (bg-main . "#ffffff") (fg-main . "#000000")
    (bg-dim . "#f8f8f8") (fg-dim . "#282828")
    (bg-alt . "#f0f0f0") (fg-alt . "#505050")
    ;; specifically for on/off states and must be combined with
    ;; themselves, though the backgrounds are also meant to be used with
    ;; other "active" values, defined further below
    (bg-active . "#d7d7d7") (fg-active . "#0a0a0a")
    (bg-inactive . "#efefef") (fg-inactive . "#404148")
    ;; these special values are intended as alternatives to the base
    ;; values for cases where we need to avoid confusion between the
    ;; highlighted constructs; they must either be used as pairs based
    ;; on their name or each can be combined with {fg,bg}-{main,alt,dim}
    ;; always in accordance with their role as background or foreground
    (bg-special-cold . "#dde3f4") (fg-special-cold . "#093060")
    (bg-special-mild . "#c4ede0") (fg-special-mild . "#184034")
    (bg-special-warm . "#f0e0d4") (fg-special-warm . "#5d3026")
    (bg-special-calm . "#f8ddea") (fg-special-calm . "#61284f")
    ;; foregrounds that can be combined with bg-main, bg-dim, bg-alt
    (red . "#a60000")
    (red-alt . "#972500")
    (red-alt-other . "#a0132f")
    (red-faint . "#7f1010")
    (red-alt-faint . "#702f00")
    (red-alt-other-faint . "#7f002f")
    (green . "#005e00")
    (green-alt . "#315b00")
    (green-alt-other . "#145c33")
    (green-faint . "#104410")
    (green-alt-faint . "#30440f")
    (green-alt-other-faint . "#0f443f")
    (yellow . "#813e00")
    (yellow-alt . "#70480f")
    (yellow-alt-other . "#863927")
    (yellow-faint . "#5f4400")
    (yellow-alt-faint . "#5d5000")
    (yellow-alt-other-faint . "#5e3a20")
    (blue . "#0031a9")
    (blue-alt . "#2544bb")
    (blue-alt-other . "#0000c0")
    (blue-faint . "#002f88")
    (blue-alt-faint . "#003f78")
    (blue-alt-other-faint . "#1f0f6f")
    (magenta . "#721045")
    (magenta-alt . "#8f0075")
    (magenta-alt-other . "#5317ac")
    (magenta-faint . "#752f50")
    (magenta-alt-faint . "#702565")
    (magenta-alt-other-faint . "#5f3f7f")
    (cyan . "#00538b")
    (cyan-alt . "#30517f")
    (cyan-alt-other . "#005a5f")
    (cyan-faint . "#12506f")
    (cyan-alt-faint . "#354f6f")
    (cyan-alt-other-faint . "#2e584f")
    ;; these foreground values can only be combined with bg-main and are
    ;; thus not suitable for general purpose highlighting
    (red-intense . "#b60000")
    (orange-intense . "#904200")
    (green-intense . "#006800")
    (yellow-intense . "#605b00")
    (blue-intense . "#1f1fce")
    (magenta-intense . "#a8007f")
    (purple-intense . "#7f10d0")
    (cyan-intense . "#005f88")
    ;; those foregrounds are meant exclusively for bg-active, bg-inactive
    (red-active . "#8a0000")
    (green-active . "#004c2e")
    (yellow-active . "#702d1f")
    (blue-active . "#0030b4")
    (magenta-active . "#5c2092")
    (cyan-active . "#003f8a")
    ;; the "subtle" values below be combined with fg-dim, while the
    ;; "intense" should be paired with fg-main
    (red-subtle-bg . "#f2b0a2")
    (red-intense-bg . "#ff8892")
    (green-subtle-bg . "#aecf90")
    (green-intense-bg . "#5ada88")
    (yellow-subtle-bg . "#e4c340")
    (yellow-intense-bg . "#f5df23")
    (blue-subtle-bg . "#b5d0ff")
    (blue-intense-bg . "#6aaeff")
    (magenta-subtle-bg . "#f0d3ff")
    (magenta-intense-bg . "#d5baff")
    (cyan-subtle-bg . "#c0efff")
    (cyan-intense-bg . "#42cbd4")
    ;; those background values must be combined with fg-main and should
    ;; only be used for indicators that are placed on the fringes
    (red-fringe-bg . "#f08290")
    (green-fringe-bg . "#62c86a")
    (yellow-fringe-bg . "#dbba3f")
    (blue-fringe-bg . "#82afff")
    (magenta-fringe-bg . "#e0a3ff")
    (cyan-fringe-bg . "#2fcddf")
    ;; those background values should only be used for graphs or similar
    ;; applications where colored blocks are expected to be positioned
    ;; next to each other
    (red-graph-0-bg . "#ef6f79")
    (red-graph-1-bg . "#ff9f9f")
    (green-graph-0-bg . "#49d239")
    (green-graph-1-bg . "#6dec6d")
    (yellow-graph-0-bg . "#efec08")
    (yellow-graph-1-bg . "#dbff4e")
    (blue-graph-0-bg . "#55a2f0")
    (blue-graph-1-bg . "#7fcfff")
    (magenta-graph-0-bg . "#ba86ef")
    (magenta-graph-1-bg . "#e7afff")
    (cyan-graph-0-bg . "#30d3f0")
    (cyan-graph-1-bg . "#6fefff")
    ;; the following are for cases where both the foreground and the
    ;; background need to have a similar hue and so must be combined
    ;; with themselves, even though the foregrounds can be paired with
    ;; any of the base backgrounds
    (red-refine-bg . "#ffcccc") (red-refine-fg . "#780000")
    (green-refine-bg . "#aceaac") (green-refine-fg . "#004c00")
    (yellow-refine-bg . "#fff29a") (yellow-refine-fg . "#604000")
    (blue-refine-bg . "#8ac7ff") (blue-refine-fg . "#002288")
    (magenta-refine-bg . "#ffccff") (magenta-refine-fg . "#770077")
    (cyan-refine-bg . "#8eecf4") (cyan-refine-fg . "#004850")
    ;; the "nuanced" backgrounds can be combined with all of the above
    ;; foregrounds, as well as those included here, while the "nuanced"
    ;; foregrounds can in turn also be combined with bg-main, bg-dim,
    ;; bg-alt
    (red-nuanced-bg . "#fff1f0") (red-nuanced-fg . "#5f0000")
    (green-nuanced-bg . "#ecf7ed") (green-nuanced-fg . "#004000")
    (yellow-nuanced-bg . "#fff3da") (yellow-nuanced-fg . "#3f3000")
    (blue-nuanced-bg . "#f3f3ff") (blue-nuanced-fg . "#201f55")
    (magenta-nuanced-bg . "#fdf0ff") (magenta-nuanced-fg . "#541f4f")
    (cyan-nuanced-bg . "#ebf6fa") (cyan-nuanced-fg . "#0f3360")
    ;; the following are reserved for specific cases
    ;;
    ;; bg-hl-line is between bg-dim and bg-alt, so it should
    ;; work with all accents that cover those two, plus bg-main
    ;;
    ;; bg-hl-alt and bg-hl-alt-intense should only be used when no
    ;; other greyscale or fairly neutral background is available to
    ;; properly draw attention to a given construct
    ;;
    ;; bg-header is between bg-active and bg-inactive, so it
    ;; can be combined with any of the "active" values, plus the
    ;; "special" and base foreground colors
    ;;
    ;; bg-paren-match, bg-paren-match-intense, bg-region and
    ;; bg-tab-active must be combined with fg-main, while
    ;; bg-tab-inactive should be combined with fg-dim
    ;;
    ;; bg-tab-bar is only intended for the bar that holds the tabs and
    ;; can only be combined with fg-main
    ;;
    ;; fg-tab-active is meant to be combined with bg-tab-active,
    ;; though only for styling special elements, such as underlining
    ;; the current tab
    ;;
    ;; fg-escape-char-construct and fg-escape-char-backslash can
    ;; be combined bg-main, bg-dim, bg-alt
    ;;
    ;; fg-lang-error, fg-lang-warning, fg-lang-note can be
    ;; combined with bg-main, bg-dim, bg-alt
    ;;
    ;; fg-mark-sel, fg-mark-del, fg-mark-alt can be combined
    ;; with bg-main, bg-dim, bg-alt, bg-hl-line
    ;;
    ;; fg-unfocused must be combined with fg-main
    ;;
    ;; fg-docstring, fg-comment-yellow can be combined with
    ;; bg-main, bg-dim, bg-alt
    ;;
    ;; the window divider colors apply to faces with just an fg value
    ;;
    ;; all pairs are combinable with themselves
    (bg-hl-line . "#f2eff3")
    (bg-hl-line-intense . "#e0e0e0")
    (bg-hl-alt . "#fbeee0")
    (bg-hl-alt-intense . "#e8dfd1")
    (bg-paren-match . "#e0af82")
    (bg-paren-match-intense . "#c488ff")
    (bg-region . "#bcbcbc")

    (bg-tab-bar . "#d5d5d5")
    (bg-tab-active . "#f6f6f6")
    (bg-tab-inactive . "#bdbdbd")
    (fg-tab-active . "#30169e")

    (fg-escape-char-construct . "#8b1030")
    (fg-escape-char-backslash . "#654d0f")

    (fg-lang-error . "#9f004f")
    (fg-lang-warning . "#604f0f")
    (fg-lang-note . "#4040ae")
    (fg-lang-underline-error . "#ef4f54")
    (fg-lang-underline-warning . "#cf9f00")
    (fg-lang-underline-note . "#3f6fef")

    (fg-window-divider-inner . "#888888")
    (fg-window-divider-outer . "#585858")

    (fg-unfocused . "#56576d")

    (fg-docstring . "#2a486a")
    (fg-comment-yellow . "#5f4400")

    (bg-header . "#e5e5e5") (fg-header . "#2a2a2a")

    (bg-whitespace . "#fff8fc") (fg-whitespace . "#645060")

    (bg-diff-heading . "#b7c4dd") (fg-diff-heading . "#042665")
    (bg-diff-added . "#d4fad4") (fg-diff-added . "#004500")
    (bg-diff-changed . "#fcefcf") (fg-diff-changed . "#524200")
    (bg-diff-removed . "#ffe8ef") (fg-diff-removed . "#691616")

    (bg-diff-refine-added . "#94cf94") (fg-diff-refine-added . "#002a00")
    (bg-diff-refine-changed . "#cccf8f") (fg-diff-refine-changed . "#302010")
    (bg-diff-refine-removed . "#daa2b0") (fg-diff-refine-removed . "#400000")

    (bg-diff-focus-added . "#bbeabb") (fg-diff-focus-added . "#002c00")
    (bg-diff-focus-changed . "#ecdfbf") (fg-diff-focus-changed . "#392900")
    (bg-diff-focus-removed . "#efcbcf") (fg-diff-focus-removed . "#4a0000")

    (bg-diff-neutral-0 . "#979797") (fg-diff-neutral-0 . "#040404")
    (bg-diff-neutral-1 . "#b0b0b0") (fg-diff-neutral-1 . "#252525")
    (bg-diff-neutral-2 . "#cccccc") (fg-diff-neutral-2 . "#3a3a3a")

    (bg-mark-sel . "#a0f0cf") (fg-mark-sel . "#005040")
    (bg-mark-del . "#ffccbb") (fg-mark-del . "#840040")
    (bg-mark-alt . "#f5d88f") (fg-mark-alt . "#782900"))
  "The entire palette of `modus-themes'.
Each element has the form (NAME . HEX) with the former as a
symbol and the latter as a string.")

;;;; Modus Vivendi

(define-obsolete-variable-alias
  'modus-vivendi-theme-default-colors-alist
  'modus-themes-colors-vivendi
  "1.0.0")

(define-obsolete-variable-alias
  'modus-themes-colors-vivendi
  'modus-themes-vivendi-colors
  "1.1.0")

(defconst modus-themes-vivendi-colors
  '(;; base values
    (bg-main . "#000000") (fg-main . "#ffffff")
    (bg-dim . "#110b11") (fg-dim . "#e0e6f0")
    (bg-alt . "#181a20") (fg-alt . "#a8a8a8")
    ;; specifically for on/off states and must be combined with
    ;; themselves, though the backgrounds are also meant to be used with
    ;; other "active" values, defined further below
    (bg-active . "#323232") (fg-active . "#f4f4f4")
    (bg-inactive . "#1e1e1e") (fg-inactive . "#bfc0c4")
    ;; these special values are intended as alternatives to the base
    ;; values for cases where we need to avoid confusion between the
    ;; highlighted constructs; they must either be used as pairs based
    ;; on their name or each can be combined with {fg,bg}-{main,alt,dim}
    ;; always in accordance with their role as background or foreground
    (bg-special-cold . "#203448") (fg-special-cold . "#c6eaff")
    (bg-special-mild . "#00322e") (fg-special-mild . "#bfebe0")
    (bg-special-warm . "#382f27") (fg-special-warm . "#f8dec0")
    (bg-special-calm . "#392a48") (fg-special-calm . "#fbd6f4")
    ;; foregrounds that can be combined with bg-main, bg-dim, bg-alt
    (red . "#ff8059")
    (red-alt . "#f4923b")
    (red-alt-other . "#ff9977")
    (red-faint . "#ffa0a0")
    (red-alt-faint . "#f5aa80")
    (red-alt-other-faint . "#ff9fbf")
    (green . "#44bc44")
    (green-alt . "#80d200")
    (green-alt-other . "#00cd68")
    (green-faint . "#88cf88")
    (green-alt-faint . "#a8cf88")
    (green-alt-other-faint . "#88cfaf")
    (yellow . "#eecc00")
    (yellow-alt . "#cfdf30")
    (yellow-alt-other . "#f0ce43")
    (yellow-faint . "#d2b580")
    (yellow-alt-faint . "#cabf77")
    (yellow-alt-other-faint . "#d0ba95")
    (blue . "#2fafff")
    (blue-alt . "#79a8ff" )
    (blue-alt-other . "#00bcff")
    (blue-faint . "#92baff")
    (blue-alt-faint . "#a4b0ff")
    (blue-alt-other-faint . "#8fc5ff")
    (magenta . "#feacd0")
    (magenta-alt . "#f78fe7")
    (magenta-alt-other . "#b6a0ff")
    (magenta-faint . "#e0b2d6")
    (magenta-alt-faint . "#ef9fe4")
    (magenta-alt-other-faint . "#d0b4ff")
    (cyan . "#00d3d0")
    (cyan-alt . "#4ae8fc")
    (cyan-alt-other . "#6ae4b9")
    (cyan-faint . "#a0bfdf")
    (cyan-alt-faint . "#90c4ed")
    (cyan-alt-other-faint . "#a4d0bb")
    ;; these foreground values can only be combined with bg-main and are
    ;; thus not suitable for general purpose highlighting
    (red-intense . "#fe6060")
    (orange-intense . "#fba849")
    (green-intense . "#4fe42f")
    (yellow-intense . "#f0dd60")
    (blue-intense . "#4fafff")
    (magenta-intense . "#ff62d4")
    (purple-intense . "#9f80ff")
    (cyan-intense . "#3fdfd0")
    ;; those foregrounds are meant exclusively for bg-active, bg-inactive
    (red-active . "#ffa7ba")
    (green-active . "#70d73f")
    (yellow-active . "#dbbe5f")
    (blue-active . "#34cfff")
    (magenta-active . "#d5b1ff")
    (cyan-active . "#00d8b4")
    ;; the "subtle" values below be combined with fg-dim, while the
    ;; "intense" should be paired with fg-main
    (red-subtle-bg . "#762422")
    (red-intense-bg . "#a4202a")
    (green-subtle-bg . "#2f4a00")
    (green-intense-bg . "#006800")
    (yellow-subtle-bg . "#604200")
    (yellow-intense-bg . "#874900")
    (blue-subtle-bg . "#10387c")
    (blue-intense-bg . "#2a40b8")
    (magenta-subtle-bg . "#49366e")
    (magenta-intense-bg . "#7042a2")
    (cyan-subtle-bg . "#00415e")
    (cyan-intense-bg . "#005f88")
    ;; those background values must be combined with fg-main and should
    ;; only be used for indicators that are placed on the fringes
    (red-fringe-bg . "#8f1f4b")
    (green-fringe-bg . "#006700")
    (yellow-fringe-bg . "#6f4f00")
    (blue-fringe-bg . "#3f33af")
    (magenta-fringe-bg . "#6f2f89")
    (cyan-fringe-bg . "#004f8f")
    ;; those background values should only be used for graphs or similar
    ;; applications where colored blocks are expected to be positioned
    ;; next to each other
    (red-graph-0-bg . "#af0404")
    (red-graph-1-bg . "#801f2f")
    (green-graph-0-bg . "#24ba2f")
    (green-graph-1-bg . "#0f8f07")
    (yellow-graph-0-bg . "#ffd03e")
    (yellow-graph-1-bg . "#d7d800")
    (blue-graph-0-bg . "#406fff")
    (blue-graph-1-bg . "#2f50c8")
    (magenta-graph-0-bg . "#af7bee")
    (magenta-graph-1-bg . "#7f59cf")
    (cyan-graph-0-bg . "#47dcfa")
    (cyan-graph-1-bg . "#0bc0df")
    ;; the following are for cases where both the foreground and the
    ;; background need to have a similar hue and so must be combined
    ;; with themselves, even though the foregrounds can be paired with
    ;; any of the base backgrounds
    (red-refine-bg . "#77002a") (red-refine-fg . "#ffb9ab")
    (green-refine-bg . "#00422a") (green-refine-fg . "#9ff0cf")
    (yellow-refine-bg . "#693200") (yellow-refine-fg . "#e2d980")
    (blue-refine-bg . "#242679") (blue-refine-fg . "#8ec6ff")
    (magenta-refine-bg . "#71206a") (magenta-refine-fg . "#ffcaf0")
    (cyan-refine-bg . "#004065") (cyan-refine-fg . "#8ae4f2")
    ;; the "nuanced" backgrounds can be combined with all of the above
    ;; foregrounds, as well as those included here, while the "nuanced"
    ;; foregrounds can in turn also be combined with bg-main, bg-dim,
    ;; bg-alt
    (red-nuanced-bg . "#2c0614") (red-nuanced-fg . "#ffcccc")
    (green-nuanced-bg . "#001904") (green-nuanced-fg . "#b8e2b8")
    (yellow-nuanced-bg . "#221000") (yellow-nuanced-fg . "#dfdfb0")
    (blue-nuanced-bg . "#0f0e39") (blue-nuanced-fg . "#bfd9ff")
    (magenta-nuanced-bg . "#230631") (magenta-nuanced-fg . "#e5cfef")
    (cyan-nuanced-bg . "#041529") (cyan-nuanced-fg . "#a8e5e5")
    ;; the following are reserved for specific cases
    ;;
    ;; bg-hl-line is between bg-dim and bg-alt, so it should
    ;; work with all accents that cover those two, plus bg-main
    ;;
    ;; bg-hl-alt and bg-hl-alt-intense should only be used when no
    ;; other greyscale or fairly neutral background is available to
    ;; properly draw attention to a given construct
    ;;
    ;; bg-header is between bg-active and bg-inactive, so it
    ;; can be combined with any of the "active" values, plus the
    ;; "special" and base foreground colors
    ;;
    ;; bg-paren-match, bg-paren-match-intense, bg-region and
    ;; bg-tab-active must be combined with fg-main, while
    ;; bg-tab-inactive should be combined with fg-dim
    ;;
    ;; bg-tab-bar is only intended for the bar that holds the tabs and
    ;; can only be combined with fg-main
    ;;
    ;; fg-tab-active is meant to be combined with bg-tab-active,
    ;; though only for styling special elements, such as underlining
    ;; the current tab
    ;;
    ;; fg-escape-char-construct and fg-escape-char-backslash can
    ;; be combined bg-main, bg-dim, bg-alt
    ;;
    ;; fg-lang-error, fg-lang-warning, fg-lang-note can be
    ;; combined with bg-main, bg-dim, bg-alt
    ;;
    ;; fg-mark-sel, fg-mark-del, fg-mark-alt can be combined
    ;; with bg-main, bg-dim, bg-alt, bg-hl-line
    ;;
    ;; fg-unfocused must be combined with fg-main
    ;;
    ;; fg-docstring, fg-comment-yellow can be combined with
    ;; bg-main, bg-dim, bg-alt
    ;;
    ;; the window divider colors apply to faces with just an fg value
    ;;
    ;; all pairs are combinable with themselves
    (bg-hl-line . "#151823")
    (bg-hl-line-intense . "#2f2f2f")
    (bg-hl-alt . "#181732")
    (bg-hl-alt-intense . "#282e46")
    (bg-paren-match . "#5f362f")
    (bg-paren-match-intense . "#7416b5")
    (bg-region . "#3c3c3c")

    (bg-tab-bar . "#2c2c2c")
    (bg-tab-active . "#0e0e0e")
    (bg-tab-inactive . "#3d3d3d")
    (fg-tab-active . "#5ac3cf")

    (fg-escape-char-construct . "#e7a59a")
    (fg-escape-char-backslash . "#abab00")

    (fg-lang-error . "#ef8690")
    (fg-lang-warning . "#b0aa00")
    (fg-lang-note . "#9d9def")
    (fg-lang-underline-error . "#ff4a6f")
    (fg-lang-underline-warning . "#d0de00")
    (fg-lang-underline-note . "#5f6fff")

    (fg-window-divider-inner . "#646464")
    (fg-window-divider-outer . "#969696")

    (fg-unfocused . "#93959b")

    (fg-docstring . "#b0d6f5")
    (fg-comment-yellow . "#cab98f")

    (bg-header . "#212121") (fg-header . "#dddddd")

    (bg-whitespace . "#170016") (fg-whitespace . "#a4959f")

    (bg-diff-heading . "#304466") (fg-diff-heading . "#dadffe")
    (bg-diff-added . "#0a280a") (fg-diff-added . "#94ba94")
    (bg-diff-changed . "#2a2000") (fg-diff-changed . "#b0ba9f")
    (bg-diff-removed . "#40160f") (fg-diff-removed . "#c6adaa")

    (bg-diff-refine-added . "#005a36") (fg-diff-refine-added . "#e0f6e0")
    (bg-diff-refine-changed . "#585800") (fg-diff-refine-changed . "#ffffcc")
    (bg-diff-refine-removed . "#852828") (fg-diff-refine-removed . "#ffd9eb")

    (bg-diff-focus-added . "#203d20") (fg-diff-focus-added . "#b4ddb4")
    (bg-diff-focus-changed . "#4a3a10") (fg-diff-focus-changed . "#d0daaf")
    (bg-diff-focus-removed . "#5e2526") (fg-diff-focus-removed . "#eebdba")

    (bg-diff-neutral-0 . "#575757") (fg-diff-neutral-0 . "#fcfcfc")
    (bg-diff-neutral-1 . "#454545") (fg-diff-neutral-1 . "#dddddd")
    (bg-diff-neutral-2 . "#313131") (fg-diff-neutral-2 . "#bfbfbf")

    (bg-mark-sel . "#002f2f") (fg-mark-sel . "#60cfa2")
    (bg-mark-del . "#5a0000") (fg-mark-del . "#ff99aa")
    (bg-mark-alt . "#3f2210") (fg-mark-alt . "#f0aa20"))
  "The entire palette of `modus-vivendi-theme'.
Each element has the form (NAME . HEX) with the former as a
symbol and the latter as a string.")



;;; Custom faces

;; These faces are used internally to ensure consistency between various
;; groups.  Their properties are assigned in `modus-themes-faces'.
(defface modus-theme-subtle-red nil nil)
(defface modus-theme-subtle-green nil nil)
(defface modus-theme-subtle-yellow nil nil)
(defface modus-theme-subtle-blue nil nil)
(defface modus-theme-subtle-magenta nil nil)
(defface modus-theme-subtle-cyan nil nil)
(defface modus-theme-subtle-neutral nil nil)
(defface modus-theme-intense-red nil nil)
(defface modus-theme-intense-green nil nil)
(defface modus-theme-intense-yellow nil nil)
(defface modus-theme-intense-blue nil nil)
(defface modus-theme-intense-magenta nil nil)
(defface modus-theme-intense-cyan nil nil)
(defface modus-theme-intense-neutral nil nil)
(defface modus-theme-refine-red nil nil)
(defface modus-theme-refine-green nil nil)
(defface modus-theme-refine-yellow nil nil)
(defface modus-theme-refine-blue nil nil)
(defface modus-theme-refine-magenta nil nil)
(defface modus-theme-refine-cyan nil nil)
(defface modus-theme-active-red nil nil)
(defface modus-theme-active-green nil nil)
(defface modus-theme-active-yellow nil nil)
(defface modus-theme-active-blue nil nil)
(defface modus-theme-active-magenta nil nil)
(defface modus-theme-active-cyan nil nil)
(defface modus-theme-fringe-red nil nil)
(defface modus-theme-fringe-green nil nil)
(defface modus-theme-fringe-yellow nil nil)
(defface modus-theme-fringe-blue nil nil)
(defface modus-theme-fringe-magenta nil nil)
(defface modus-theme-fringe-cyan nil nil)
(defface modus-theme-nuanced-red nil nil)
(defface modus-theme-nuanced-green nil nil)
(defface modus-theme-nuanced-yellow nil nil)
(defface modus-theme-nuanced-blue nil nil)
(defface modus-theme-nuanced-magenta nil nil)
(defface modus-theme-nuanced-cyan nil nil)
(defface modus-theme-special-cold nil nil)
(defface modus-theme-special-mild nil nil)
(defface modus-theme-special-warm nil nil)
(defface modus-theme-special-calm nil nil)
(defface modus-theme-diff-added nil nil)
(defface modus-theme-diff-changed nil nil)
(defface modus-theme-diff-removed nil nil)
(defface modus-theme-diff-refine-added nil nil)
(defface modus-theme-diff-refine-changed nil nil)
(defface modus-theme-diff-refine-removed nil nil)
(defface modus-theme-diff-focus-added nil nil)
(defface modus-theme-diff-focus-changed nil nil)
(defface modus-theme-diff-focus-removed nil nil)
(defface modus-theme-diff-heading nil nil)
(defface modus-theme-pseudo-header nil nil)
(defface modus-theme-mark-alt nil nil)
(defface modus-theme-mark-del nil nil)
(defface modus-theme-mark-sel nil nil)
(defface modus-theme-mark-symbol nil nil)
(defface modus-theme-heading-1 nil nil)
(defface modus-theme-heading-2 nil nil)
(defface modus-theme-heading-3 nil nil)
(defface modus-theme-heading-4 nil nil)
(defface modus-theme-heading-5 nil nil)
(defface modus-theme-heading-6 nil nil)
(defface modus-theme-heading-7 nil nil)
(defface modus-theme-heading-8 nil nil)
(defface modus-theme-hl-line nil nil)
(defface modus-theme-bold nil nil)
(defface modus-theme-slant nil nil)
(defface modus-theme-variable-pitch nil nil)
(defface modus-theme-graph-red-0 nil nil)
(defface modus-theme-graph-red-1 nil nil)
(defface modus-theme-graph-green-0 nil nil)
(defface modus-theme-graph-green-1 nil nil)
(defface modus-theme-graph-yellow-0 nil nil)
(defface modus-theme-graph-yellow-1 nil nil)
(defface modus-theme-graph-blue-0 nil nil)
(defface modus-theme-graph-blue-1 nil nil)
(defface modus-theme-graph-magenta-0 nil nil)
(defface modus-theme-graph-magenta-1 nil nil)
(defface modus-theme-graph-cyan-0 nil nil)
(defface modus-theme-graph-cyan-1 nil nil)
(defface modus-theme-lang-note nil nil)
(defface modus-theme-lang-warning nil nil)
(defface modus-theme-lang-error nil nil)



;;; Customization options

;;;; Current customization options (>= 1.0.0)

(defcustom modus-themes-operandi-color-overrides nil
  "Override colors in the Modus Operandi palette.

For form, see `modus-themes-operandi-colors'."
  :group 'modus-themes
  :package-version '(modus-themes . "1.1.0")
  :version "28.1"
  :type '(alist :key-type symbol :value-type color))

(defcustom modus-themes-vivendi-color-overrides nil
  "Override colors in the Modus Vivendi palette.

For form, see `modus-themes-vivendi-colors'."
  :group 'modus-themes
  :package-version '(modus-themes . "1.1.0")
  :version "28.1"
  :type '(alist :key-type symbol :value-type color))

;; The byte compiler complains when a defcustom isn't a top level form
(let* ((names (mapcar (lambda (pair)
                        (symbol-name (car pair)))
                      modus-themes-operandi-colors))
       (colors (mapcar #'intern (sort names #'string<))))
  (put 'modus-themes-operandi-color-overrides
       'custom-options (copy-sequence colors))
  (put 'modus-themes-vivendi-color-overrides
       'custom-options (copy-sequence colors)))

(defcustom modus-themes-slanted-constructs nil
  "Use slanted text in more code constructs (italics or oblique)."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'boolean)

(defcustom modus-themes-bold-constructs nil
  "Use bold text in more code constructs."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'boolean)

(defcustom modus-themes-variable-pitch-headings nil
  "Use proportional fonts (variable-pitch) in headings."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'boolean)

(defcustom modus-themes-no-mixed-fonts nil
  "Disable inheritance from `fixed-pitch' in some faces.

This is done by default to allow spacing-sensitive constructs,
such as Org tables and code blocks, to remain monospaced when
users opt for something like the command `variable-pitch-mode'.
The downside with the default is that users need to explicitly
configure the font family of `fixed-pitch' in order to get a
consistent experience.  That may be something they do not want to
do.  Hence this option to disable any kind of technique for
mixing fonts."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'boolean)

(defcustom modus-themes-headings
  '((t . nil))
  "Alist of styles for headings, with optional value per level.

To control faces per level from 1-8, use something like this:

  (setq modus-themes-headings
        '((1 . highlight)
          (2 . line)
          (t . rainbow-line-no-bold)))

To set a uniform value for all heading levels, use this pattern:

  (setq modus-themes-headings
        '((t . rainbow-line-no-bold)))

The default uses a fairly desaturated foreground value in
combination with a bold typographic weight.  To specify this
style for a given level N (assuming you wish to have another
fallback option), just specify the value t like this:

  (setq modus-themes-headings
        '((1 . t)
          (2 . line)
          (t . rainbow-line-no-bold)))

A description of all possible values:

+ `no-bold' retains the default text color while removing the
  typographic weight.

+ `line' is the same as the default plus an overline over the
  heading.

+ `line-no-bold' is the same as `line' without bold weight.

+ `rainbow' uses a more colorful foreground in combination with
  bold weight.

+ `rainbow-line' is the same as `rainbow' plus an overline.

+ `rainbow-line-no-bold' is the same as `rainbow-line' without
  the bold weight.

+ `highlight' retains the default style of a fairly desaturated
  foreground combined with a bold weight and add to it a subtle
  accented background.

+ `highlight-no-bold' is the same as `highlight' without a bold
  weight.

+ `rainbow-highlight' is the same as `highlight' but with a more
  colorful foreground.

+ `rainbow-highlight-no-bold' is the same as `rainbow-highlight'
  without a bold weight.

+ `section' retains the default looks and adds to them both an
  overline and a slightly accented background.  It is, in effect,
  a combination of the `line' and `highlight' values.

+ `section-no-bold' is the same as `section' without a bold
  weight.

+ `rainbow-section' is the same as `section' but with a more
  colorful foreground.

+ `rainbow-section-no-bold' is the same as `rainbow-section'
  without a bold weight."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type
  '(alist
    :key-type symbol
    :value-type
    (choice (const :tag "Fairly desaturated foreground with bold weight (default)" t)
            (const :tag "Like the default without bold weight" no-bold)
            (const :tag "Like the default plus overline" line)
            (const :tag "Like `line' without bold weight" line-no-bold)
            (const :tag "Like the default but with more colorful foreground" rainbow)
            (const :tag "Like `rainbow' plus overline" rainbow-line)
            (const :tag "Like `rainbow' without bold weight" rainbow-no-bold)
            (const :tag "Like `rainbow-line' without bold weight" rainbow-line-no-bold)
            (const :tag "Like the default plus subtle background" highlight)
            (const :tag "Like `highlight' without bold weight" highlight-no-bold)
            (const :tag "Like `highlight' with more colorful foreground" rainbow-highlight)
            (const :tag "Like `rainbow-highlight' without bold weight" rainbow-highlight-no-bold)
            (const :tag "Like `highlight' plus overline" section)
            (const :tag "Like `section' without bold weight" section-no-bold)
            (const :tag "Like `section' with more colorful foreground" rainbow-section)
            (const :tag "Like `rainbow-section' without bold weight" rainbow-section-no-bold))))

(defcustom modus-themes-scale-headings nil
  "Use font scaling for headings."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'boolean)

(defcustom modus-themes-scale-1 1.05
  "Font size that is slightly larger than the base value.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).

For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'number)

(defcustom modus-themes-scale-2 1.1
  "Font size slightly larger than `modus-themes-scale-1'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).

For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'number)

(defcustom modus-themes-scale-3 1.15
  "Font size slightly larger than `modus-themes-scale-2'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).

For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'number)

(defcustom modus-themes-scale-4 1.2
  "Font size slightly larger than `modus-themes-scale-3'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).

For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'number)

(defcustom modus-themes-scale-5 1.3
  "Font size slightly larger than `modus-themes-scale-4'.
The default is a floating point that is interpreted as a multiple
of the base font size.  However, the variable also accepts an
integer, understood as an absolute height (e.g. a value of 140 is
the same as setting the font at 14 point size).

For more on the matter, read the documentation of
`set-face-attribute', specifically the ':height' section."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'number)

(defcustom modus-themes-fringes nil
  "Define the visibility of fringes.

Nil means the fringes have no background color.  Option `subtle'
will apply a greyscale value that is visible yet close to the
main buffer background color.  Option `intense' will use a more
pronounced greyscale value."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "No visible fringes (default)" nil)
          (const :tag "Subtle greyscale background" subtle)
          (const :tag "Intense greyscale background" intense)))

(defcustom modus-themes-lang-checkers nil
  "Control the style of spelling and code checkers/linters.

Nil (the default) applies a color-coded underline to the affected
text, while it leaves the original foreground in tact.  If the
display spec of Emacs has support for it, the underline's style
is that of a wave, otherwise it is a straight line.

Options `subtle-foreground' and `intense-foreground' add a
color-coded underline while also changing the text's foreground
accordingly.  The style of the underline is the same as with the
default option.

Option `straight-underline' is like the default but always
applies a straight line under the affected text.  Same principle
for `subtle-foreground-straight-underline' and its counterpart
`intense-foreground-straight-underline'.

Option `colored-background' uses a straight underline, a
background, and a foreground.  All are color-coded.  This is the
most intense combination of face properties."
  :group 'modus-themes
  :package-version '(modus-themes . "1.1.0")
  :version "28.1"
  :type '(choice
          (const :tag "Only color-coded wavy underline (default)" nil)
          (const :tag "Like the default, but with a straight underline" straight-underline)
          (const :tag "Color-coded wavy underline; subtle foreground" subtle-foreground)
          (const :tag "Combines `straight-underline' and `subtle-foreground'" subtle-foreground-straight-underline)
          (const :tag "Color-coded wavy underline; intense foreground" intense-foreground)
          (const :tag "Combines `straight-underline' and `intense-foreground'" intense-foreground-straight-underline)
          (const :tag "Color-coded background, foreground, straight underline" colored-background)))

(defcustom modus-themes-org-blocks nil
  "Use a subtle gray or color-coded background for Org blocks.

Nil means that the block will have no background of its own and
will use the default that applies to the rest of the buffer.

Option `grayscale' (or `greyscale') will apply a subtle neutral
gray background to the block's contents.  It also affects the
begin and end lines of the block: their background will be
extended to the edge of the window for Emacs version >= 27 where
the ':extend' keyword is recognized by `set-face-attribute'.

Option `rainbow' will use an accented background for the contents
of the block.  The exact color will depend on the programming
language and is controlled by the `org-src-block-faces'
variable (refer to the theme's source code for the current
association list)."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "No Org block background (default)" nil)
          (const :tag "Subtle gray block background" grayscale)
          (const :tag "Subtle gray block background (alt spelling)" greyscale)
          (const :tag "Color-coded background per programming language" rainbow)))

(defcustom modus-themes-org-habit nil
  "Control the presentation of the `org-habit' graph.

The default is meant to conform with the original aesthetic of
`org-habit'.  It employs all four color codes that correspond to
the org-habit states---clear, ready, alert, and overdue---while
distinguishing between their present and future variants.  This
results in a total of eight colors in use: red, yellow, green,
blue, in tinted and shaded versions.  They cover the full set of
information provided by the `org-habit' consistency graph.

Option `simplified' is like the default except that it removes
the dichotomy between current and future variants by applying
uniform color-coded values.  It applies a total of four colors:
red, yellow, green, blue.  They produce a simplified consistency
graph that is more legible (or less \"busy\") than the default.
The intent is to shift focus towards the distinction between the
four states of a habit task, rather than each state's
present/future outlook.

Option `traffic-light' further reduces the available colors to
red, yellow, and green.  As in `simplified', present and future
variants appear uniformly, but differently from it, the 'clear'
state is rendered in a green hue, instead of the original blue.
This is meant to capture the use-case where a habit task being
\"too early\" is less important than it being \"too late\".  The
difference between ready and clear states is attenuated by
painting both of them using shades of green.  This option thus
highlights the alert and overdue states."
  :group 'modus-themes
  :package-version '(modus-themes . "1.1.0")
  :version "28.1"
  :type '(choice
          (const :tag "Respect the original design of org-habit (default)" nil)
          (const :tag "Like the default, but do not distinguish between present and future variants" simplified)
          (const :tag "Like `simplified', but only use red, yellow, green" traffic-light)))

(defcustom modus-themes-mode-line nil
  "Adjust the overall style of the mode line.

Nil is a two-dimensional rectangle with a border around it.  The
active and the inactive modelines use different shades of
greyscale values for the background and foreground.

A `3d' value will apply a three-dimensional effect to the active
modeline.  The inactive modelines remain two-dimensional and are
toned down a bit, relative to the nil value.

The `moody' option is meant to optimize the modeline for use with
the library of the same name.  This practically means to remove
the box effect and rely on underline and overline properties
instead.  It also tones down the inactive modelines.  Despite its
intended purpose, this option can also be used without the
`moody' library."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Two-dimensional box (default)" nil)
          (const :tag "Three-dimensional style for the active mode line" 3d)
          (const :tag "No box effects, which are optimal for use with the `moody' library" moody)))

(defcustom modus-themes-diffs nil
  "Adjust the overall styles of diffs.

Nil means to use fairly intense color combinations for diffs.
For example, you get a rich green background with a green
foreground for added lines.  Word-wise or 'refined' diffs follow
the same pattern but use different shades of those colors to
remain distinct.

A `desaturated' value follows the same principles as with the nil
option, while it tones down all relevant colors.

Option `fg-only' will remove all accented backgrounds, except
from word-wise changes.  It instead uses color-coded foreground
values to differentiate between added/removed/changed lines.  If
a background is necessary, such as with `ediff', then a subtle
greyscale value is used.

Option `bg-only' applies a background but does not override the
text's foreground.  This makes it suitable for a non-nil value
passed to `diff-font-lock-syntax' (note: Magit does not support
syntax highlighting in diffs as of 2020-11-25, version
20201116.1057)."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Intensely colored backgrounds (default)" nil)
          (const :tag "Slightly accented backgrounds with tinted text" desaturated)
          (const :tag "No backgrounds, except for refined diffs" fg-only)
          (const :tag "Apply color-coded backgrounds; keep syntax colors in tact" bg-only)))

(defcustom modus-themes-completions nil
  "Apply special styles to the UI of completion frameworks.

This concerns Icomplete, Ivy, Helm, Selectrum, Ido, as well as
any other tool meant to enhance their experience.  The effect
will vary depending on the completion framework.

Nil means to remain faithful to the metaphors that each UI
establishes.  For example, Icomplete and Ido only use foreground
colors to style their matches, whereas Ivy or Helm rely on an
aesthetic that combines colored backgrounds with appropriate text
color.

Option `moderate' will apply a combination of background and
foreground that is fairly subtle.  For Icomplete and the like,
this constitutes a departure from their standard style.  While
Ivy, Helm, and the others, will use less pronounced colors for
applicable contexts.

Option `opinionated' will apply color combinations that refashion
the completion UI.  So Icomplete et al will now use styles that
resemble the defaults of Ivy and co., while the latter group will
revert to an even more nuanced aesthetic."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Respect the framework's established aesthetic (default)" nil)
          (const :tag "Subtle backgrounds for various elements" moderate)
          (const :tag "Radical alternative to the framework's looks" opinionated)))

(defcustom modus-themes-prompts nil
  "Use subtle or intense styles for minibuffer and REPL prompts.

Nil means to only use an accented foreground color.

Options `subtle' and `intense' will change both the background
and the foreground values.  The latter has a more pronounced
effect than the former."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "No prompt background (default)" nil)
          (const :tag "Subtle accented background for the prompt" subtle)
          (const :tag "Intense background and foreground for the prompt" intense)))

(defcustom modus-themes-intense-hl-line nil
  "Use a more prominent background for command `hl-line-mode'."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type 'boolean)

(defcustom modus-themes-paren-match nil
  "Choose the style of matching parentheses or delimiters.

Nil means to use a subtle tinted background color (the default).

Option `intense' applies a saturated background color.

Option `subtle-bold' is the same as the default, but also makes
use of bold typographic weight (inherits the `bold' face).

Option `intense-bold' is the same as `intense', while it also
uses a bold weight."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Sublte tinted background (default)" nil)
          (const :tag "Like the default, but also use bold typographic weight" subtle-bold)
          (const :tag "Intense saturated background" intense)
          (const :tag "Like `intense' but with bold weight" intense-bold)))

(defcustom modus-themes-syntax nil
  "Control the overall style of code syntax highlighting.

Nil (the default) means to use colors on the cyan-blue-magenta
side of the spectrum.  There is little to no use of greens,
yellows, and reds.

Option `faint' is like the default in terms of the choice of
palette but applies desaturated color values.

Option `yellow-comments' applies a yellow tint to comments.  The
rest of the syntax is the same as the default.

Option `green-strings' replaces the blue/cyan/cold color variants
in strings with greener alternatives.  The rest of the syntax
remains the same.

Option `yellow-comments-green-strings' combines yellow comments
with green strings and the rest of the default syntax
highlighting style.

Option `alt-syntax' expands the color palette and applies new
color combinations.  Strings are green.  Doc strings are magenta
tinted.  Comments are gray.

Option `alt-syntax-yellow-comments' combines `alt-syntax' with
`yellow-comments'."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Balanced use of blue, cyan, magenta, purple variants (default)" nil)
          (const :tag "Like the default, but with desaturated color values" faint)
          (const :tag "Apply yellow tint to comments, keep the default style for the rest" yellow-comments)
          (const :tag "Use green for strings, keep the default style for the rest" green-strings)
          (const :tag "Use green for strings, yellow for comments, keep the default style for the rest" yellow-comments-green-strings)
          (const :tag "Refashion syntax highlighting with more colors, gray comments" alt-syntax)
          (const :tag "Like `alt-syntax' but with yellow comments" alt-syntax-yellow-comments)))

(defcustom modus-themes-links nil
  "Set the style of links.

Nil means to use an underline that is the same color as the
foreground.

Option `faint' applies desaturated colors to the link's text and
underline.

Option `neutral-underline' applies a subtle grey underline, while
retaining the link's foreground.

Option `faint-neutral-underline' combines a desaturated text
color with a subtle grey underline.

Option `no-underline' removes link underlines altogether."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Undeline link using the same color as the text (default)" nil)
          (const :tag "Like the default, but apply less intense colors to links" faint)
          (const :tag "Change the color of link underlines to a neutral grey" neutral-underline)
          (const :tag "Desaturated foreground with neutral grey underline" faint-neutral-underline)
          (const :tag "Remove underline property from links, keeping their foreground as-is" no-underline)))

(defcustom modus-themes-region nil
  "Change the overall appearance of the active region.

Nil (the default) means to only use a prominent gray background
with a neutral foreground.  The foreground overrides all syntax
highlighting.  The region extends to the edge of the window.

Option `no-extend' preserves the default aesthetic but prevents
the region from extending to the edge of the window.

Option `bg-only' applies a faint tinted background that is
distinct from all others used in the theme, while it does not
override any existing colors.  It extends to the edge of the
window.

Option `bg-only-no-extend' is a combination of the `bg-only' and
`no-extend' options."
  :group 'modus-themes
  :package-version '(modus-themes . "1.0.0")
  :version "28.1"
  :type '(choice
          (const :tag "Intense background; overrides colors; extends to edge of window (default)" nil)
          (const :tag "As with the default, but does not extend" no-extend)
          (const :tag "Subtle background; preserves colors; extends to edge of window" bg-only)
          (const :tag "As with the `subtle' option, but does not extend" bg-only-no-extend)))



;;;; Deprecated customization options (prior to 1.0.0)

;;;;; Modus Operandi obsolete options

(make-obsolete 'modus-operandi-theme-override-colors-alist nil "1.0.0")
(make-obsolete 'modus-operandi-theme-slanted-constructs 'modus-themes-slanted-constructs "1.0.0")
(make-obsolete 'modus-operandi-theme-bold-constructs 'modus-themes-bold-constructs "1.0.0")
(make-obsolete 'modus-operandi-theme-proportional-fonts 'modus-themes-variable-pitch-headings "1.0.0")
(make-obsolete 'modus-operandi-theme-variable-pitch-headings 'modus-themes-variable-pitch-headings "1.0.0")
(make-obsolete 'modus-operandi-theme-no-mixed-fonts 'modus-themes-no-mixed-fonts "1.0.0")
(make-obsolete 'modus-operandi-theme-rainbow-headings 'modus-themes-headings "1.0.0")
(make-obsolete 'modus-operandi-theme-section-headings 'modus-themes-headings "1.0.0")
(make-obsolete 'modus-operandi-theme-headings 'modus-themes-headings "1.0.0")
(make-obsolete 'modus-operandi-theme-scale-headings 'modus-themes-scale-headings "1.0.0")
(make-obsolete 'modus-operandi-theme-scale-1 'modus-themes-scale-1 "1.0.0")
(make-obsolete 'modus-operandi-theme-scale-2 'modus-themes-scale-2 "1.0.0")
(make-obsolete 'modus-operandi-theme-scale-3 'modus-themes-scale-3 "1.0.0")
(make-obsolete 'modus-operandi-theme-scale-4 'modus-themes-scale-4 "1.0.0")
(make-obsolete 'modus-operandi-theme-scale-5 'modus-themes-scale-5 "1.0.0")
(make-obsolete 'modus-operandi-theme-visible-fringes 'modus-themes-fringes "1.0.0")
(make-obsolete 'modus-operandi-theme-fringes 'modus-themes-fringes "1.0.0")
(make-obsolete 'modus-operandi-theme-distinct-org-blocks 'modus-themes-org-blocks "1.0.0")
(make-obsolete 'modus-operandi-theme-rainbow-org-src-blocks 'modus-themes-org-blocks "1.0.0")
(make-obsolete 'modus-operandi-theme-org-blocks 'modus-themes-org-blocks "1.0.0")
(make-obsolete 'modus-operandi-theme-3d-modeline 'modus-themes-mode-line "1.0.0")
(make-obsolete 'modus-operandi-theme-mode-line 'modus-themes-mode-line "1.0.0")
(make-obsolete 'modus-operandi-theme-subtle-diffs 'modus-themes-diffs "1.0.0")
(make-obsolete 'modus-operandi-theme-diffs 'modus-themes-diffs "1.0.0")
(make-obsolete 'modus-operandi-theme-intense-standard-completions 'modus-themes-completions "1.0.0")
(make-obsolete 'modus-operandi-theme-completions 'modus-themes-completions "1.0.0")
(make-obsolete 'modus-operandi-theme-prompts 'modus-themes-prompts "1.0.0")
(make-obsolete 'modus-operandi-theme-intense-hl-line 'modus-themes-intense-hl-line "1.0.0")
(make-obsolete 'modus-operandi-theme-intense-paren-match 'modus-themes-paren-match "1.0.0")
(make-obsolete 'modus-operandi-theme-faint-syntax 'modus-themes-syntax "1.0.0")
(make-obsolete 'modus-operandi-theme-comments 'modus-themes-syntax "1.0.0")
(make-obsolete 'modus-operandi-theme-syntax 'modus-themes-syntax "1.0.0")
(make-obsolete 'modus-operandi-theme-no-link-underline 'modus-themes-links "1.0.0")
(make-obsolete 'modus-operandi-theme-links 'modus-themes-links "1.0.0")

;;;;; Modus Vivendi obsolete options

(make-obsolete 'modus-vivendi-theme-override-colors-alist nil "1.0.0")
(make-obsolete 'modus-vivendi-theme-slanted-constructs 'modus-themes-slanted-constructs "1.0.0")
(make-obsolete 'modus-vivendi-theme-bold-constructs 'modus-themes-bold-constructs "1.0.0")
(make-obsolete 'modus-vivendi-theme-proportional-fonts 'modus-themes-variable-pitch-headings "1.0.0")
(make-obsolete 'modus-vivendi-theme-variable-pitch-headings 'modus-themes-variable-pitch-headings "1.0.0")
(make-obsolete 'modus-vivendi-theme-no-mixed-fonts 'modus-themes-no-mixed-fonts "1.0.0")
(make-obsolete 'modus-vivendi-theme-rainbow-headings 'modus-themes-headings "1.0.0")
(make-obsolete 'modus-vivendi-theme-section-headings 'modus-themes-headings "1.0.0")
(make-obsolete 'modus-vivendi-theme-headings 'modus-themes-headings "1.0.0")
(make-obsolete 'modus-vivendi-theme-scale-headings 'modus-themes-scale-headings "1.0.0")
(make-obsolete 'modus-vivendi-theme-scale-1 'modus-themes-scale-1 "1.0.0")
(make-obsolete 'modus-vivendi-theme-scale-2 'modus-themes-scale-2 "1.0.0")
(make-obsolete 'modus-vivendi-theme-scale-3 'modus-themes-scale-3 "1.0.0")
(make-obsolete 'modus-vivendi-theme-scale-4 'modus-themes-scale-4 "1.0.0")
(make-obsolete 'modus-vivendi-theme-scale-5 'modus-themes-scale-5 "1.0.0")
(make-obsolete 'modus-vivendi-theme-visible-fringes 'modus-themes-fringes "1.0.0")
(make-obsolete 'modus-vivendi-theme-fringes 'modus-themes-fringes "1.0.0")
(make-obsolete 'modus-vivendi-theme-distinct-org-blocks 'modus-themes-org-blocks "1.0.0")
(make-obsolete 'modus-vivendi-theme-rainbow-org-src-blocks 'modus-themes-org-blocks "1.0.0")
(make-obsolete 'modus-vivendi-theme-org-blocks 'modus-themes-org-blocks "1.0.0")
(make-obsolete 'modus-vivendi-theme-3d-modeline 'modus-themes-mode-line "1.0.0")
(make-obsolete 'modus-vivendi-theme-mode-line 'modus-themes-mode-line "1.0.0")
(make-obsolete 'modus-vivendi-theme-subtle-diffs 'modus-themes-diffs "1.0.0")
(make-obsolete 'modus-vivendi-theme-diffs 'modus-themes-diffs "1.0.0")
(make-obsolete 'modus-vivendi-theme-intense-standard-completions 'modus-themes-completions "1.0.0")
(make-obsolete 'modus-vivendi-theme-completions 'modus-themes-completions "1.0.0")
(make-obsolete 'modus-vivendi-theme-prompts 'modus-themes-prompts "1.0.0")
(make-obsolete 'modus-vivendi-theme-intense-hl-line 'modus-themes-intense-hl-line "1.0.0")
(make-obsolete 'modus-vivendi-theme-intense-paren-match 'modus-themes-paren-match "1.0.0")
(make-obsolete 'modus-vivendi-theme-faint-syntax 'modus-themes-syntax "1.0.0")
(make-obsolete 'modus-vivendi-theme-comments 'modus-themes-syntax "1.0.0")
(make-obsolete 'modus-vivendi-theme-syntax 'modus-themes-syntax "1.0.0")
(make-obsolete 'modus-vivendi-theme-no-link-underline 'modus-themes-links "1.0.0")
(make-obsolete 'modus-vivendi-theme-links 'modus-themes-links "1.0.0")



;;; Internal functions

(defun modus-themes--palette (theme)
  "Return color palette for Modus theme THEME.
THEME is a symbol, either `modus-operandi' or `modus-vivendi'."
  (pcase theme
    ('modus-operandi
     (append modus-themes-operandi-color-overrides
             modus-themes-operandi-colors))
    ('modus-vivendi
     (append modus-themes-vivendi-color-overrides
             modus-themes-vivendi-colors))
    (_theme
     (error "'%s' is not a Modus theme" theme))))

(defvar modus-themes-faces)
(defvar modus-themes-custom-variables)

(defmacro modus-themes-theme (name)
  "Bind NAME's color palette around face specs and variables.

NAME should be the proper name of a Modus theme, either
`modus-operandi' or `modus-vivendi'.

Face specifications are passed to `custom-theme-set-faces'.
While variables are handled by `custom-theme-set-variables'.
Those are stored in `modus-themes-faces' and
`modus-themes-custom-variables' respectively."
  (declare (indent 0))
  (let ((palette-sym (gensym))
        (colors (mapcar #'car modus-themes-operandi-colors)))
    `(let* ((class '((class color) (min-colors 89)))
            (,palette-sym (modus-themes--palette ',name))
            ,@(mapcar (lambda (color)
                        (list color `(alist-get ',color ,palette-sym)))
                      colors))
       (custom-theme-set-faces ',name ,@modus-themes-faces)
       (custom-theme-set-variables ',name ,@modus-themes-custom-variables))))

(defun modus-themes--current-theme ()
  "Return current theme."
  (car custom-enabled-themes))

;; Helper functions that are meant to ease the implementation of the
;; above customization options.
(defun modus-themes--bold-weight ()
  "Conditional use of a heavier text weight."
  (when modus-themes-bold-constructs
    (list :inherit 'bold)))

(defun modus-themes--mixed-fonts ()
  "Conditional application of `fixed-pitch' inheritance."
  (unless modus-themes-no-mixed-fonts
    (list :inherit 'fixed-pitch)))

(defun modus-themes--slant ()
  "Conditional use of italics for slant attribute."
  (if modus-themes-slanted-constructs
      (list 'italic)
    (list 'normal)))

(defun modus-themes--variable-pitch ()
  "Conditional use of `variable-pitch' in headings."
  (when modus-themes-variable-pitch-headings
    (list :inherit 'variable-pitch)))

(defun modus-themes--fringe (mainbg subtlebg intensebg)
  "Conditional use of background colors for fringes.
MAINBG is the default.  SUBTLEBG should be a subtle greyscale
value.  INTENSEBG must be a more pronounced greyscale color."
  (pcase modus-themes-fringes
    ('intense (list :background intensebg))
    ('subtle (list :background subtlebg))
    (_ (list :background mainbg))))

(defun modus-themes--lang-check (underline subtlefg intensefg bg)
  "Conditional use of foreground colors for language checkers.
UNDERLINE is a color-code value for the affected text's underline
property.  SUBTLEFG and INTENSEFG follow the same color-coding
pattern and represent a value that is faint or vibrant
respectively.  BG is a color-coded background."
  (pcase modus-themes-lang-checkers
    ('colored-background
     (list :underline underline :background bg :foreground intensefg))
    ('intense-foreground
     (list :underline (list :color underline :style 'wave) :foreground intensefg))
    ('intense-foreground-straight-underline
     (list :underline underline :foreground intensefg))
    ('subtle-foreground
     (list :underline (list :color underline :style 'wave) :foreground subtlefg))
    ('subtle-foreground-straight-underline
     (list :underline underline :foreground subtlefg))
    ('straight-underline
     (list :underline underline))
    (_ (list :underline (list :color underline :style 'wave)))))

(defun modus-themes--prompt (mainfg subtlebg subtlefg intensebg intensefg)
  "Conditional use of background colors for prompts.
MAINFG is the prompt's standard foreground.  SUBTLEBG should be a
subtle accented background that works with SUBTLEFG.  INTENSEBG
must be a more pronounced accented color that should be
combinable with INTENSEFG."
  (pcase modus-themes-prompts
    ('intense (list :background intensebg :foreground intensefg))
    ('subtle (list :background subtlebg :foreground subtlefg))
    (_ (list :background nil :foreground mainfg))))

(defun modus-themes--paren (normalbg intensebg)
  "Conditional use of intense colors for matching parentheses.
NORMALBG should be the special palette color 'bg-paren-match' or
something similar.  INTENSEBG must be easier to discern next to
other backgrounds, such as the special palette color
'bg-paren-match-intense'."
  (pcase modus-themes-paren-match
    ('subtle-bold (list :inherit 'bold :background normalbg))
    ('intense-bold (list :inherit 'bold :background intensebg))
    ('intense (list :background intensebg))
    (_ (list :background normalbg))))

(defun modus-themes--syntax-foreground (fg faint)
  "Apply foreground value to code syntax.
FG is the default.  FAINT is typically the same color in its
desaturated version."
  (pcase modus-themes-syntax
    ('faint (list :foreground faint))
    (_ (list :foreground fg))))

(defun modus-themes--syntax-extra (fg faint alt)
  "Apply foreground value to code syntax.
FG is the default.  FAINT is typically the same color in its
desaturated version.  ALT is another hue."
  (pcase modus-themes-syntax
    ('faint (list :foreground faint))
    ('alt-syntax (list :foreground alt))
    ('alt-syntax-yellow-comments (list :foreground alt))
    (_ (list :foreground fg))))

(defun modus-themes--syntax-string (fg faint green alt)
  "Apply foreground value to strings in code syntax.
FG is the default.  FAINT is typically the same color in its
desaturated version.  GREEN is a color variant in that side of
the spectrum.  ALT is another hue."
  (pcase modus-themes-syntax
    ('faint (list :foreground faint))
    ('green-strings (list :foreground green))
    ('yellow-comments-green-strings (list :foreground alt))
    ('alt-syntax (list :foreground alt))
    ('alt-syntax-yellow-comments (list :foreground alt))
    (_ (list :foreground fg))))

(defun modus-themes--syntax-docstring (fg faint green alt)
  "Apply foreground value to strings in code syntax.
FG is the default.  FAINT is typically the same color in its
desaturated version.  GREEN is a color variant in that side of
the spectrum.  ALT is another hue."
  (pcase modus-themes-syntax
    ('faint (list :foreground faint))
    ('green-strings (list :foreground green))
    ('yellow-comments-green-strings (list :foreground green))
    ('alt-syntax (list :foreground alt))
    ('alt-syntax-yellow-comments (list :foreground alt))
    (_ (list :foreground fg))))

(defun modus-themes--syntax-comment (fg yellow)
  "Apply foreground value to strings in code syntax.
FG is the default.  YELLOW is a color variant of that name."
  (pcase modus-themes-syntax
    ('yellow-comments (list :foreground yellow))
    ('yellow-comments-green-strings (list :foreground yellow))
    ('alt-syntax-yellow-comments (list :foreground yellow))
    (_ (list :foreground fg))))

(defun modus-themes--heading-p (key)
  "Query style of KEY in `modus-themes-headings'."
  (cdr (assoc key modus-themes-headings)))

(defun modus-themes--heading (level fg fg-alt bg border)
  "Conditional styles for `modus-themes-headings'.

LEVEL is the heading's position in their order.  FG is the
default text color.  FG-ALT is an accented, more saturated value
than the default.  BG is a nuanced, typically accented,
background that can work well with either of the foreground
values.  BORDER is a color value that combines well with the
background and alternative foreground."
  (let* ((key (modus-themes--heading-p `,level))
         (style (or key (modus-themes--heading-p t)))
         (var (when modus-themes-variable-pitch-headings
                'variable-pitch))
         (varbold (if var
                      (append (list 'bold) (list var))
                    'bold)))
    (pcase style
      ('no-bold
       (list :inherit `,var :foreground fg))
      ('line
       (list :inherit `,varbold :foreground fg :overline border))
      ('line-no-bold
       (list :inherit `,var :foreground fg :overline border))
      ('rainbow
       (list :inherit `,varbold :foreground fg-alt))
      ('rainbow-no-bold
       (list :inherit `,var :foreground fg-alt))
      ('rainbow-line
       (list :inherit `,varbold :foreground fg-alt :overline border))
      ('rainbow-line-no-bold
       (list :inherit `,var :foreground fg-alt :overline border))
      ('highlight
       (list :inherit `,varbold :background bg :foreground fg))
      ('highlight-no-bold
       (list :inherit `,var :background bg :foreground fg))
      ('rainbow-highlight
       (list :inherit `,varbold :background bg :foreground fg-alt))
      ('rainbow-highlight-no-bold
       (list :inherit `,var :background bg :foreground fg-alt))
      ('section
       (list :inherit `,varbold :background bg :foreground fg :overline border :extend t))
      ('section-no-bold
       (list :inherit `,var :background bg :foreground fg :overline border :extend t))
      ('rainbow-section
       (list :inherit `,varbold :background bg :foreground fg-alt :overline border :extend t))
      ('rainbow-section-no-bold
       (list :inherit `,var :background bg :foreground fg-alt :overline border :extend t))
      (_
       (list :inherit `,varbold :foreground fg)))))

(defun modus-themes--org-block (bgblk)
  "Conditionally set the background of Org blocks.
BGBLK applies to a distinct neutral background.  Else blocks have
no background of their own (the default), so they look the same
as the rest of the buffer.

`modus-themes-org-blocks' also accepts a `rainbow' option
which is applied conditionally to `org-src-block-faces' (see the
theme's source code)."
  (if (or (eq modus-themes-org-blocks 'grayscale)
          (eq modus-themes-org-blocks 'greyscale))
      (list :background bgblk :extend t)
    (list :background nil)))

(defun modus-themes--org-block-delim (bgaccent fgaccent bg fg)
  "Conditionally set the styles of Org block delimiters.
BG, FG, BGACCENT, FGACCENT apply a background and foreground
color respectively.

The former pair is a greyscale combination that should be more
distinct than the background of the block.  It is applied to the
default styles or when `modus-themes-org-blocks' is set
to `greyscale'.

The latter pair should be more subtle than the background of the
block, as it is used when `modus-themes-org-blocks' is
set to `rainbow'."
  (pcase modus-themes-org-blocks
    ('grayscale (list :background bg :foreground fg :extend t))
    ('greyscale (list :background bg :foreground fg :extend t))
    ('rainbow (list :background bgaccent :foreground fgaccent))
    (_ (list :background bg :foreground fg))))

(defun modus-themes--org-habit (default &optional traffic simple)
  "Specify background values for `modus-themes-org-habit'.
If no optional TRAFFIC argument is supplied, the DEFAULT is used
instead.  Same for SIMPLE."
  (pcase modus-themes-org-habit
    ('traffic-light (list :background (or traffic default)))
    ('simplified (list :background (or simple default)))
    (_ (list :background default))))

(defun modus-themes--mode-line-attrs
    (fg bg fg-alt bg-alt border border-3d &optional alt-style border-width fg-distant)
  "Color combinations for `modus-themes-mode-line'.

FG and BG are the default colors.  FG-ALT and BG-ALT are meant to
accommodate the options for a 3D modeline or a `moody' compliant
one.  BORDER applies to all permutations of the modeline, except
the three-dimensional effect, where BORDER-3D is used instead.

Optional ALT-STYLE applies an appropriate style to the mode
line's box property.

Optional BORDER-WIDTH specifies an integer for the width of the
rectangle that produces the box effect.

Optional FG-DISTANT should be close to the main background
values.  It is intended to be used as a distant-foreground
property."
  (pcase modus-themes-mode-line
    ('3d
     `(:background ,bg-alt :foreground ,fg-alt
                   :box (:line-width ,(or border-width 1)
                                     :color ,border-3d
                                     :style ,(and alt-style 'released-button))))
    ('moody
     `(:background ,bg-alt :foreground ,fg-alt :underline ,border :overline ,border
                   :distant-foreground ,fg-distant))
    (_
     `(:foreground ,fg :background ,bg :box ,border))))

(defun modus-themes--diff
    (fg-only-bg fg-only-fg mainbg mainfg altbg altfg &optional bg-only-fg)
  "Color combinations for `modus-themes-diffs'.

FG-ONLY-BG should be similar or the same as the main background.
FG-ONLY-FG should be a saturated accent value that can be
combined with the former.

MAINBG must be one of the dedicated backgrounds for diffs while
MAINFG must be the same for the foreground.

ALTBG needs to be a slightly accented background that is meant to
be combined with ALTFG.  Both must be less intense than MAINBG
and MAINFG respectively.

Optional BG-ONLY-FG applies ALTFG else leaves the foreground
unspecified."
  (pcase modus-themes-diffs
    ('fg-only (list :background fg-only-bg :foreground fg-only-fg))
    ('desaturated (list :background altbg :foreground altfg))
    ('bg-only (list :background altbg :foreground (if bg-only-fg altfg 'unspecified)))
    (_ (list :background mainbg :foreground mainfg))))

(defun modus-themes--standard-completions (mainfg subtlebg intensebg intensefg)
  "Combinations for `modus-themes-completions'.

MAINFG is an accented foreground value.  SUBTLEBG is an accented
background value that can be combined with MAINFG.  INTENSEBG and
INTENSEFG are accented colors that are designed to be used in
tandem.

These are intended for Icomplete, Ido, and related."
  (pcase modus-themes-completions
    ('opinionated (list :background intensebg :foreground intensefg))
    ('moderate (list :background subtlebg :foreground mainfg))
    (_ (list :foreground mainfg))))

(defun modus-themes--extra-completions (subtleface intenseface altface &optional altfg bold)
  "Combinations for `modus-themes-completions'.

SUBTLEFACE and INTENSEFACE are custom theme faces that combine a
background and foreground value.  The difference between the two
is a matter of degree.

ALTFACE is a combination of colors that represents a departure
from the UI's default aesthetics.  Optional ALTFG is meant to be
used in tandem with it.

Optional BOLD will apply a heavier weight to the text.

These are intended for Helm, Ivy, etc."
  (pcase modus-themes-completions
    ('opinionated (list :inherit (list altface bold)
                        :foreground (or altfg 'unspecified)))
    ('moderate (list :inherit (list subtleface bold)))
    (_ (list :inherit (list intenseface bold)))))

(defun modus-themes--link (fg fgfaint underline)
  "Conditional application of link styles.
FG is the link's default color for its text and underline
property.  FGFAINT is a desaturated color for the text and
underline.  UNDERLINE is a grey color only for the undeline."
  (pcase modus-themes-links
    ('faint (list :foreground fgfaint :underline t))
    ('neutral-underline (list :foreground fg :underline underline))
    ('faint-neutral-underline (list :foreground fgfaint :underline underline))
    ('no-underline (list :foreground fg :underline nil))
    (_ (list :foreground fg :underline t))))

(defun modus-themes--link-color (fg fgfaint)
  "Extends `modus-themes--link'.
FG is the main foreground.  FGFAINT is the desaturated one."
  (pcase modus-themes-links
    ('faint (list :foreground fgfaint))
    ('faint-neutral-underline (list :foreground fgfaint))
    (_ (list :foreground fg))))

(defun modus-themes--scale (amount)
  "Scale heading by AMOUNT.
AMOUNT is a customization option."
  (when modus-themes-scale-headings
    (list :height amount)))

(defun modus-themes--region (bg fg bgsubtle)
  "Apply `modus-themes-region' styles.

BG and FG are the main values that are used by default.  BGSUBTLE
is a subtle background value that can be combined with all colors
used to fontify text and code syntax."
  (pcase modus-themes-region
    ('bg-only (list :background bgsubtle))
    ('bg-only-no-extend (list :background bgsubtle :extend nil))
    ('no-extend (list :background bg :foreground fg :extend nil))
    (_ (list :background bg :foreground fg))))



;;;; Utilities for DIY users

;; This is the WCAG formula: https://www.w3.org/TR/WCAG20-TECHS/G18.html
(defun modus-themes-wcag-formula (hex)
  "Get WCAG value of color value HEX.
The value is defined in hexadecimal RGB notation, such as those in
`modus-themes-operandi-colors' and `modus-themes-vivendi-colors'."
  (cl-loop for k in '(0.2126 0.7152 0.0722)
           for x in (color-name-to-rgb hex)
           sum (* k (if (<= x 0.03928)
                        (/ x 12.92)
                      (expt (/ (+ x 0.055) 1.055) 2.4)))))

;;;###autoload
(defun modus-themes-contrast (c1 c2)
  "Measure WCAG contrast ratio between C1 and C2.
C1 and C2 are color values written in hexadecimal RGB."
  (let ((ct (/ (+ (modus-themes-wcag-formula c1) 0.05)
               (+ (modus-themes-wcag-formula c2) 0.05))))
    (max ct (/ ct))))

(defun modus-themes-current-palette ()
  "Return current color palette."
  (modus-themes--palette (modus-themes--current-theme)))

;;;###autoload
(defun modus-themes-color (color)
  "Return color value for COLOR from current palette.
COLOR is a key in `modus-themes-operandi-colors' or
`modus-themes-vivendi-colors'."
  (alist-get color (modus-themes-current-palette)))

;;;###autoload
(defun modus-themes-color-alts (light-color dark-color)
  "Return color value from current palette.
When Modus Operandi is enabled, return color value for color
LIGHT-COLOR.  When Modus Vivendi is enabled, return color value
for DARK-COLOR.  LIGHT-COLOR and DARK-COLOR are keys in
`modus-themes-operandi-colors' or `modus-themes-vivendi-colors'."
  (let* ((theme (modus-themes--current-theme))
         (color (pcase theme
                  ('modus-operandi light-color)
                  ('modus-vivendi dark-color)
                  (_theme
                   (error "'%s' is not a Modus theme" theme)))))
    (alist-get color (modus-themes--palette theme))))

(defmacro modus-themes-with-colors (&rest body)
  "Evaluate BODY with colors from current palette bound.
For colors bound, see `modus-themes-operandi-colors' or
`modus-themes-vivendi-colors'."
  (declare (indent 0))
  (let ((palette-sym (gensym))
        (colors (mapcar #'car modus-themes-operandi-colors)))
    `(let* ((class '((class color) (min-colors 89)))
            (,palette-sym (modus-themes-current-palette))
            ,@(mapcar (lambda (color)
                        (list color `(alist-get ',color ,palette-sym)))
                      colors))
       (ignore class ,@colors)          ; Silence unused variable warnings
       ,@body)))

;;;; Commands

(defvar modus-themes-after-load-theme-hook nil
  "Hook that runs after the `modus-themes-toggle' routines.")

;;;###autoload
(defun modus-themes-load-operandi ()
  "Load `modus-operandi' and disable `modus-vivendi'.
Also run `modus-themes-after-load-theme-hook'."
  (disable-theme 'modus-vivendi)
  (load-theme 'modus-operandi t)
  (run-hooks 'modus-themes-after-load-theme-hook))

;;;###autoload
(defun modus-themes-load-vivendi ()
  "Load `modus-vivendi' and disable `modus-operandi'.
Also run `modus-themes-after-load-theme-hook'."
  (disable-theme 'modus-operandi)
  (load-theme 'modus-vivendi t)
  (run-hooks 'modus-themes-after-load-theme-hook))

(defun modus-themes--load-prompt ()
  "Helper for `modus-themes-toggle'."
  (let ((theme
         (intern
          (completing-read "Load Modus theme (will disable all others): "
                           '(modus-operandi modus-vivendi) nil t))))
    (mapc #'disable-theme custom-enabled-themes)
    (pcase theme
      ('modus-operandi (modus-themes-load-operandi))
      ('modus-vivendi (modus-themes-load-vivendi)))))

;;;###autoload
(defun modus-themes-toggle ()
  "Toggle between `modus-operandi' and `modus-vivendi' themes.
Also runs `modus-themes-after-load-theme-hook' at its last stage
by virtue of calling either of `modus-themes-load-operandi' and
`modus-themes-load-vivendi' functions."
  (interactive)
  (pcase (modus-themes--current-theme)
    ('modus-operandi (modus-themes-load-vivendi))
    ('modus-vivendi (modus-themes-load-operandi))
    (_ (modus-themes--load-prompt))))



;;;; Face specifications

(defconst modus-themes-faces
  '(
;;;; custom faces
    ;; these bespoke faces are inherited by other constructs below
;;;;; subtle colored backgrounds
    `(modus-theme-subtle-red ((,class :background ,red-subtle-bg :foreground ,fg-dim)))
    `(modus-theme-subtle-green ((,class :background ,green-subtle-bg :foreground ,fg-dim)))
    `(modus-theme-subtle-yellow ((,class :background ,yellow-subtle-bg :foreground ,fg-dim)))
    `(modus-theme-subtle-blue ((,class :background ,blue-subtle-bg :foreground ,fg-dim)))
    `(modus-theme-subtle-magenta ((,class :background ,magenta-subtle-bg :foreground ,fg-dim)))
    `(modus-theme-subtle-cyan ((,class :background ,cyan-subtle-bg :foreground ,fg-dim)))
    `(modus-theme-subtle-neutral ((,class :background ,bg-inactive :foreground ,fg-inactive)))
;;;;; intense colored backgrounds
    `(modus-theme-intense-red ((,class :background ,red-intense-bg :foreground ,fg-main)))
    `(modus-theme-intense-green ((,class :background ,green-intense-bg :foreground ,fg-main)))
    `(modus-theme-intense-yellow ((,class :background ,yellow-intense-bg :foreground ,fg-main)))
    `(modus-theme-intense-blue ((,class :background ,blue-intense-bg :foreground ,fg-main)))
    `(modus-theme-intense-magenta ((,class :background ,magenta-intense-bg :foreground ,fg-main)))
    `(modus-theme-intense-cyan ((,class :background ,cyan-intense-bg :foreground ,fg-main)))
    `(modus-theme-intense-neutral ((,class :background ,bg-active :foreground ,fg-main)))
;;;;; refined background and foreground combinations
    ;; general purpose styles that use an accented foreground against an
    ;; accented background
    `(modus-theme-refine-red ((,class :background ,red-refine-bg :foreground ,red-refine-fg)))
    `(modus-theme-refine-green ((,class :background ,green-refine-bg :foreground ,green-refine-fg)))
    `(modus-theme-refine-yellow ((,class :background ,yellow-refine-bg :foreground ,yellow-refine-fg)))
    `(modus-theme-refine-blue ((,class :background ,blue-refine-bg :foreground ,blue-refine-fg)))
    `(modus-theme-refine-magenta ((,class :background ,magenta-refine-bg :foreground ,magenta-refine-fg)))
    `(modus-theme-refine-cyan ((,class :background ,cyan-refine-bg :foreground ,cyan-refine-fg)))
;;;;; "active" combinations, mostly for use on the mode line
    `(modus-theme-active-red ((,class :background ,red-active :foreground ,bg-active)))
    `(modus-theme-active-green ((,class :background ,green-active :foreground ,bg-active)))
    `(modus-theme-active-yellow ((,class :background ,yellow-active :foreground ,bg-active)))
    `(modus-theme-active-blue ((,class :background ,blue-active :foreground ,bg-active)))
    `(modus-theme-active-magenta ((,class :background ,magenta-active :foreground ,bg-active)))
    `(modus-theme-active-cyan ((,class :background ,cyan-active :foreground ,bg-active)))
;;;;; nuanced backgrounds
    ;; useful for adding an accented background that is suitable for all
    ;; main foreground colors (intended for use in Org source blocks)
    `(modus-theme-nuanced-red ((,class :background ,red-nuanced-bg :extend t)))
    `(modus-theme-nuanced-green ((,class :background ,green-nuanced-bg :extend t)))
    `(modus-theme-nuanced-yellow ((,class :background ,yellow-nuanced-bg :extend t)))
    `(modus-theme-nuanced-blue ((,class :background ,blue-nuanced-bg :extend t)))
    `(modus-theme-nuanced-magenta ((,class :background ,magenta-nuanced-bg :extend t)))
    `(modus-theme-nuanced-cyan ((,class :background ,cyan-nuanced-bg :extend t)))
;;;;; fringe-specific combinations
    `(modus-theme-fringe-red ((,class :background ,red-fringe-bg :foreground ,fg-main)))
    `(modus-theme-fringe-green ((,class :background ,green-fringe-bg :foreground ,fg-main)))
    `(modus-theme-fringe-yellow ((,class :background ,yellow-fringe-bg :foreground ,fg-main)))
    `(modus-theme-fringe-blue ((,class :background ,blue-fringe-bg :foreground ,fg-main)))
    `(modus-theme-fringe-magenta ((,class :background ,magenta-fringe-bg :foreground ,fg-main)))
    `(modus-theme-fringe-cyan ((,class :background ,cyan-fringe-bg :foreground ,fg-main)))
;;;;; special base values
    ;; these are closer to the grayscale than the accents defined above
    ;; and should only be used when the next closest alternative would be
    ;; a greyscale value than an accented one
    `(modus-theme-special-cold ((,class :background ,bg-special-cold :foreground ,fg-special-cold)))
    `(modus-theme-special-mild ((,class :background ,bg-special-mild :foreground ,fg-special-mild)))
    `(modus-theme-special-warm ((,class :background ,bg-special-warm :foreground ,fg-special-warm)))
    `(modus-theme-special-calm ((,class :background ,bg-special-calm :foreground ,fg-special-calm)))
;;;;; diff-specific combinations
    ;; intended for `diff-mode' or equivalent
    `(modus-theme-diff-added
      ((,class ,@(modus-themes--diff
                  bg-main green
                  bg-diff-focus-added fg-diff-focus-added
                  green-nuanced-bg fg-diff-added))))
    `(modus-theme-diff-changed
      ((,class ,@(modus-themes--diff
                  bg-main yellow
                  bg-diff-focus-changed fg-diff-focus-changed
                  yellow-nuanced-bg fg-diff-changed))))
    `(modus-theme-diff-removed
      ((,class ,@(modus-themes--diff
                  bg-main red
                  bg-diff-focus-removed fg-diff-focus-removed
                  red-nuanced-bg fg-diff-removed))))
    `(modus-theme-diff-refine-added
      ((,class ,@(modus-themes--diff
                  bg-diff-added fg-diff-added
                  bg-diff-refine-added fg-diff-refine-added
                  bg-diff-focus-added fg-diff-focus-added))))
    `(modus-theme-diff-refine-changed
      ((,class ,@(modus-themes--diff
                  bg-diff-changed fg-diff-changed
                  bg-diff-refine-changed fg-diff-refine-changed
                  bg-diff-focus-changed fg-diff-focus-changed))))
    `(modus-theme-diff-refine-removed
      ((,class ,@(modus-themes--diff
                  bg-diff-removed fg-diff-removed
                  bg-diff-refine-removed fg-diff-refine-removed
                  bg-diff-focus-removed fg-diff-focus-removed))))
    `(modus-theme-diff-focus-added
      ((,class ,@(modus-themes--diff
                  bg-dim green
                  bg-diff-focus-added fg-diff-focus-added
                  bg-diff-added fg-diff-added))))
    `(modus-theme-diff-focus-changed
      ((,class ,@(modus-themes--diff
                  bg-dim yellow
                  bg-diff-focus-changed fg-diff-focus-changed
                  bg-diff-changed fg-diff-changed))))
    `(modus-theme-diff-focus-removed
      ((,class ,@(modus-themes--diff
                  bg-dim red
                  bg-diff-focus-removed fg-diff-focus-removed
                  bg-diff-removed fg-diff-removed))))
    `(modus-theme-diff-heading
      ((,class ,@(modus-themes--diff
                  bg-alt blue-alt
                  bg-diff-heading fg-diff-heading
                  cyan-nuanced-bg cyan-nuanced-fg t))))
;;;;; mark indicators
    ;; color combinations intended for Dired, Ibuffer, or equivalent
    `(modus-theme-pseudo-header ((,class :inherit bold :foreground ,fg-main)))
    `(modus-theme-mark-alt ((,class :inherit bold :background ,bg-mark-alt :foreground ,fg-mark-alt)))
    `(modus-theme-mark-del ((,class :inherit bold :background ,bg-mark-del :foreground ,fg-mark-del)))
    `(modus-theme-mark-sel ((,class :inherit bold :background ,bg-mark-sel :foreground ,fg-mark-sel)))
    `(modus-theme-mark-symbol ((,class :inherit bold :foreground ,blue-alt)))
;;;;; heading levels
    ;; styles for regular headings used in Org, Markdown, Info, etc.
    `(modus-theme-heading-1
      ((,class ,@(modus-themes--heading
                  1 fg-main magenta-alt-other magenta-nuanced-bg bg-region)
               ,@(modus-themes--scale modus-themes-scale-4))))
    `(modus-theme-heading-2
      ((,class ,@(modus-themes--heading
                  2 fg-special-warm magenta-alt red-nuanced-bg bg-region)
               ,@(modus-themes--scale modus-themes-scale-3))))
    `(modus-theme-heading-3
      ((,class ,@(modus-themes--heading
                  3 fg-special-cold blue blue-nuanced-bg bg-region)
               ,@(modus-themes--scale modus-themes-scale-2))))
    `(modus-theme-heading-4
      ((,class ,@(modus-themes--heading
                  4 fg-special-mild cyan cyan-nuanced-bg bg-region)
               ,@(modus-themes--scale modus-themes-scale-1))))
    `(modus-theme-heading-5
      ((,class ,@(modus-themes--heading
                  5 fg-special-calm green-alt-other green-nuanced-bg bg-region))))
    `(modus-theme-heading-6
      ((,class ,@(modus-themes--heading
                  6 yellow-nuanced-fg yellow-alt-other yellow-nuanced-bg bg-region))))
    `(modus-theme-heading-7
      ((,class ,@(modus-themes--heading
                  7 red-nuanced-fg red-alt red-nuanced-bg bg-region))))
    `(modus-theme-heading-8
      ((,class ,@(modus-themes--heading
                  8 fg-dim magenta bg-alt bg-region))))
;;;;; graph-specific faces
    `(modus-theme-graph-red-0 ((,class :background ,red-graph-0-bg)))
    `(modus-theme-graph-red-1 ((,class :background ,red-graph-1-bg)))
    `(modus-theme-graph-green-0 ((,class :background ,green-graph-0-bg)))
    `(modus-theme-graph-green-1 ((,class :background ,green-graph-1-bg)))
    `(modus-theme-graph-yellow-0 ((,class :background ,yellow-graph-0-bg)))
    `(modus-theme-graph-yellow-1 ((,class :background ,yellow-graph-1-bg)))
    `(modus-theme-graph-blue-0 ((,class :background ,blue-graph-0-bg)))
    `(modus-theme-graph-blue-1 ((,class :background ,blue-graph-1-bg)))
    `(modus-theme-graph-magenta-0 ((,class :background ,magenta-graph-0-bg)))
    `(modus-theme-graph-magenta-1 ((,class :background ,magenta-graph-1-bg)))
    `(modus-theme-graph-cyan-0 ((,class :background ,cyan-graph-0-bg)))
    `(modus-theme-graph-cyan-1 ((,class :background ,cyan-graph-1-bg)))
;;;;; language checkers
    `(modus-theme-lang-error ((,class ,@(modus-themes--lang-check fg-lang-underline-error fg-lang-error red red-nuanced-bg))))
    `(modus-theme-lang-note ((,class ,@(modus-themes--lang-check fg-lang-underline-note fg-lang-note blue-alt blue-nuanced-bg))))
    `(modus-theme-lang-warning ((,class ,@(modus-themes--lang-check fg-lang-underline-warning fg-lang-warning yellow yellow-nuanced-bg))))
;;;;; other custom faces
    `(modus-theme-bold ((,class ,@(modus-themes--bold-weight))))
    `(modus-theme-hl-line ((,class :background ,(if modus-themes-intense-hl-line
                                                    bg-hl-line-intense bg-hl-line)
                                   :extend t)))
    `(modus-theme-slant ((,class :inherit italic :slant ,@(modus-themes--slant))))
    `(modus-theme-variable-pitch ((,class ,@(modus-themes--variable-pitch))))
;;;; standard faces
;;;;; absolute essentials
    `(default ((,class :background ,bg-main :foreground ,fg-main)))
    `(cursor ((,class :background ,fg-main)))
    `(fringe ((,class ,@(modus-themes--fringe bg-main bg-inactive bg-active)
                      :foreground ,fg-main)))
    `(vertical-border ((,class :foreground ,fg-window-divider-inner)))
;;;;; basic and/or ungrouped styles
    `(bold ((,class :weight bold)))
    `(bold-italic ((,class :inherit (bold italic))))
    `(buffer-menu-buffer ((,class :inherit bold)))
    `(comint-highlight-input ((,class :inherit bold)))
    `(comint-highlight-prompt ((,class :inherit modus-theme-bold
                                       ,@(modus-themes--prompt
                                          cyan
                                          blue-nuanced-bg blue-alt
                                          blue-refine-bg fg-main))))
    `(error ((,class :inherit bold :foreground ,red)))
    `(escape-glyph ((,class :foreground ,fg-escape-char-construct)))
    `(file-name-shadow ((,class :foreground ,fg-unfocused)))
    `(header-line ((,class :background ,bg-header :foreground ,fg-header)))
    `(header-line-highlight ((,class :inherit modus-theme-active-blue)))
    `(help-argument-name ((,class :inherit modus-theme-slant :foreground ,cyan)))
    `(homoglyph ((,class :foreground ,red-alt-faint)))
    `(ibuffer-locked-buffer ((,class :foreground ,yellow-alt-other-faint)))
    `(italic ((,class :slant italic)))
    `(nobreak-hyphen ((,class :foreground ,fg-escape-char-construct)))
    `(nobreak-space ((,class :foreground ,fg-escape-char-construct :underline t)))
    `(minibuffer-prompt ((,class ,@(modus-themes--prompt
                                    cyan-alt-other
                                    cyan-nuanced-bg cyan
                                    cyan-refine-bg fg-main))))
    `(mm-command-output ((,class :foreground ,red-alt-other)))
    `(mm-uu-extract ((,class :background ,bg-dim :foreground ,fg-special-mild)))
    `(next-error ((,class :inherit modus-theme-subtle-red)))
    `(rectangle-preview ((,class :inherit modus-theme-special-mild)))
    `(region ((,class ,@(modus-themes--region bg-region fg-main bg-hl-alt-intense))))
    `(secondary-selection ((,class :inherit modus-theme-special-cold)))
    `(shadow ((,class :foreground ,fg-alt)))
    `(success ((,class :inherit bold :foreground ,green)))
    `(trailing-whitespace ((,class :background ,red-intense-bg)))
    `(warning ((,class :inherit bold :foreground ,yellow)))
;;;;; buttons, links, widgets
    `(button ((,class ,@(modus-themes--link
                         blue-alt-other blue-alt-other-faint bg-region))))
    `(link ((,class :inherit button)))
    `(link-visited ((,class :inherit button
                            ,@(modus-themes--link-color
                               magenta-alt-other magenta-alt-other-faint))))
    `(tooltip ((,class :background ,bg-special-cold :foreground ,fg-main)))
    `(widget-button ((,class :inherit button)))
    `(widget-button-pressed ((,class :inherit button
                                     ,@(modus-themes--link-color
                                        magenta magenta-faint))))
    `(widget-documentation ((,class :foreground ,green)))
    `(widget-field ((,class :background ,bg-alt :foreground ,fg-dim)))
    `(widget-inactive ((,class :background ,bg-inactive :foreground ,fg-inactive)))
    `(widget-single-line-field ((,class :inherit widget-field)))
;;;;; ag
    `(ag-hit-face ((,class :foreground ,fg-special-cold)))
    `(ag-match-face ((,class :inherit modus-theme-special-calm)))
;;;;; alert
    `(alert-high-face ((,class :inherit bold :foreground ,red-alt)))
    `(alert-low-face ((,class :foreground ,fg-special-mild)))
    `(alert-moderate-face ((,class :inherit bold :foreground ,yellow)))
    `(alert-trivial-face ((,class :foreground ,fg-special-calm)))
    `(alert-urgent-face ((,class :inherit bold :foreground ,red-intense)))
;;;;; all-the-icons
    `(all-the-icons-blue ((,class :foreground ,blue)))
    `(all-the-icons-blue-alt ((,class :foreground ,blue-alt)))
    `(all-the-icons-cyan ((,class :foreground ,cyan)))
    `(all-the-icons-cyan-alt ((,class :foreground ,cyan-alt)))
    `(all-the-icons-dblue ((,class :foreground ,blue-alt-other)))
    `(all-the-icons-dcyan ((,class :foreground ,cyan-alt-other)))
    `(all-the-icons-dgreen ((,class :foreground ,green-alt-other)))
    `(all-the-icons-dired-dir-face ((,class :foreground ,blue)))
    `(all-the-icons-dmaroon ((,class :foreground ,magenta-alt-other)))
    `(all-the-icons-dorange ((,class :foreground ,red-alt-other)))
    `(all-the-icons-dpink ((,class :foreground ,magenta)))
    `(all-the-icons-dpurple ((,class :foreground ,magenta-alt)))
    `(all-the-icons-dred ((,class :foreground ,red)))
    `(all-the-icons-dsilver ((,class :foreground ,fg-special-cold)))
    `(all-the-icons-dyellow ((,class :foreground ,yellow)))
    `(all-the-icons-green ((,class :foreground ,green)))
    `(all-the-icons-lblue ((,class :foreground ,blue-refine-fg)))
    `(all-the-icons-lcyan ((,class :foreground ,cyan-refine-fg)))
    `(all-the-icons-lgreen ((,class :foreground ,green-refine-fg)))
    `(all-the-icons-lmaroon ((,class :foreground ,magenta-refine-fg)))
    `(all-the-icons-lorange ((,class :foreground ,red-refine-fg)))
    `(all-the-icons-lpink ((,class :foreground ,magenta-refine-fg)))
    `(all-the-icons-lpurple ((,class :foreground ,magenta-refine-fg)))
    `(all-the-icons-lred ((,class :foreground ,red-refine-fg)))
    `(all-the-icons-lsilver ((,class :foreground ,fg-special-cold)))
    `(all-the-icons-lyellow ((,class :foreground ,yellow-refine-fg)))
    `(all-the-icons-maroon ((,class :foreground ,magenta)))
    `(all-the-icons-orange ((,class :foreground ,red-alt)))
    `(all-the-icons-pink ((,class :foreground ,magenta)))
    `(all-the-icons-purple ((,class :foreground ,magenta-alt)))
    `(all-the-icons-purple-alt ((,class :foreground ,magenta-alt-other)))
    `(all-the-icons-red ((,class :foreground ,red)))
    `(all-the-icons-red-alt ((,class :foreground ,red-alt)))
    `(all-the-icons-silver ((,class :foreground ,fg-special-cold)))
    `(all-the-icons-yellow ((,class :foreground ,yellow)))
;;;;; annotate
    `(annotate-annotation ((,class :inherit modus-theme-subtle-blue)))
    `(annotate-annotation-secondary ((,class :inherit modus-theme-subtle-green)))
    `(annotate-highlight ((,class :background ,blue-nuanced-bg :underline ,blue-intense)))
    `(annotate-highlight-secondary ((,class :background ,green-nuanced-bg :underline ,green-intense)))
;;;;; anzu
    `(anzu-match-1 ((,class :inherit modus-theme-subtle-cyan)))
    `(anzu-match-2 ((,class :inherit modus-theme-subtle-green)))
    `(anzu-match-3 ((,class :inherit modus-theme-subtle-yellow)))
    `(anzu-mode-line ((,class :inherit bold :foreground ,green-active)))
    `(anzu-mode-line-no-match ((,class :inherit bold :foreground ,red-active)))
    `(anzu-replace-highlight ((,class :inherit modus-theme-refine-yellow :underline t)))
    `(anzu-replace-to ((,class :inherit (modus-theme-intense-green bold))))
;;;;; apropos
    `(apropos-function-button ((,class :inherit button
                                       ,@(modus-themes--link-color
                                          magenta-alt-other magenta-alt-other-faint))))
    `(apropos-keybinding ((,class :inherit bold :foreground ,cyan)))
    `(apropos-misc-button ((,class :inherit button
                                   ,@(modus-themes--link-color
                                      cyan-alt-other cyan-alt-other-faint))))
    `(apropos-property ((,class :inherit modus-theme-bold :foreground ,magenta-alt)))
    `(apropos-symbol ((,class :inherit modus-theme-bold :foreground ,blue-alt-other)))
    `(apropos-user-option-button ((,class :inherit button
                                          ,@(modus-themes--link-color
                                             green-alt-other green-alt-other-faint))))
    `(apropos-variable-button ((,class :inherit button
                                       ,@(modus-themes--link-color
                                          blue blue-faint))))
;;;;; apt-sources-list
    `(apt-sources-list-components ((,class :foreground ,cyan)))
    `(apt-sources-list-options ((,class :foreground ,yellow)))
    `(apt-sources-list-suite ((,class :foreground ,green)))
    `(apt-sources-list-type ((,class :foreground ,magenta)))
    `(apt-sources-list-uri ((,class :foreground ,blue)))
;;;;; artbollocks-mode
    `(artbollocks-face ((,class :inherit modus-theme-lang-note)))
    `(artbollocks-lexical-illusions-face ((,class :background ,bg-alt :foreground ,red-alt :underline t)))
    `(artbollocks-passive-voice-face ((,class :inherit modus-theme-lang-warning)))
    `(artbollocks-weasel-words-face ((,class :inherit modus-theme-lang-error)))
;;;;; auctex and Tex
    `(font-latex-bold-face ((,class :inherit bold :foreground ,fg-special-calm)))
    `(font-latex-doctex-documentation-face ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(font-latex-doctex-preprocessor-face ((,class :inherit modus-theme-bold :foreground ,red-alt-other)))
    `(font-latex-italic-face ((,class :inherit italic :foreground ,fg-special-calm)))
    `(font-latex-math-face ((,class :foreground ,cyan-alt-other)))
    `(font-latex-script-char-face ((,class :foreground ,cyan-alt-other)))
    `(font-latex-sectioning-0-face ((,class :inherit modus-theme-variable-pitch :foreground ,blue-nuanced-fg)))
    `(font-latex-sectioning-1-face ((,class :inherit (bold modus-theme-variable-pitch) :foreground ,blue-nuanced-fg)))
    `(font-latex-sectioning-2-face ((,class :inherit (bold modus-theme-variable-pitch) :foreground ,blue-nuanced-fg)))
    `(font-latex-sectioning-3-face ((,class :inherit (bold modus-theme-variable-pitch) :foreground ,blue-nuanced-fg)))
    `(font-latex-sectioning-4-face ((,class :inherit (bold modus-theme-variable-pitch) :foreground ,blue-nuanced-fg)))
    `(font-latex-sectioning-5-face ((,class :inherit modus-theme-variable-pitch :foreground ,blue-nuanced-fg)))
    `(font-latex-sedate-face ((,class :inherit modus-theme-bold :foreground ,magenta-alt-other)))
    `(font-latex-slide-title-face ((,class :inherit (bold modus-theme-variable-pitch) :foreground ,cyan-nuanced-fg
                                           ,@(modus-themes--scale modus-themes-scale-4))))
    `(font-latex-string-face ((,class :inherit font-lock-string-face)))
    `(font-latex-subscript-face ((,class :height 0.95)))
    `(font-latex-superscript-face ((,class :height 0.95)))
    `(font-latex-verbatim-face ((,class :background ,bg-dim :foreground ,fg-special-mild)))
    `(font-latex-warning-face ((,class :inherit font-lock-warning-face)))
    `(tex-match ((,class :foreground ,blue-alt-other)))
    `(tex-verbatim ((,class :background ,bg-dim :foreground ,fg-special-mild)))
    `(texinfo-heading ((,class :foreground ,magenta)))
    `(TeX-error-description-error ((,class :inherit error)))
    `(TeX-error-description-help ((,class :foreground ,blue)))
    `(TeX-error-description-tex-said ((,class :foreground ,blue)))
    `(TeX-error-description-warning ((,class :inherit warning)))
;;;;; auto-dim-other-buffers
    `(auto-dim-other-buffers-face ((,class :background ,bg-alt)))
;;;;; avy
    `(avy-background-face ((,class :background ,bg-dim :foreground ,fg-dim)))
    `(avy-goto-char-timer-face ((,class :inherit (modus-theme-intense-yellow bold))))
    `(avy-lead-face ((,class :inherit (modus-theme-intense-magenta bold))))
    `(avy-lead-face-0 ((,class :inherit (modus-theme-intense-blue bold))))
    `(avy-lead-face-1 ((,class :inherit (modus-theme-intense-red bold))))
    `(avy-lead-face-2 ((,class :inherit (modus-theme-intense-green bold))))
;;;;; aw (ace-window)
    `(aw-background-face ((,class :background ,bg-dim :foreground ,fg-dim)))
    `(aw-key-face ((,class :inherit bold :foreground ,blue-intense)))
    `(aw-leading-char-face ((,class :inherit bold :height 1.5 :background ,bg-main :foreground ,red-intense)))
    `(aw-minibuffer-leading-char-face ((,class :foreground ,magenta-active)))
    `(aw-mode-line-face ((,class :inherit bold)))
;;;;; awesome-tray
    `(awesome-tray-module-awesome-tab-face ((,class :inherit bold :foreground ,red-alt-other)))
    `(awesome-tray-module-battery-face ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(awesome-tray-module-buffer-name-face ((,class :inherit bold :foreground ,yellow-alt-other)))
    `(awesome-tray-module-circe-face ((,class :inherit bold :foreground ,blue-alt)))
    `(awesome-tray-module-date-face ((,class :inherit bold :foreground ,fg-dim)))
    `(awesome-tray-module-evil-face ((,class :inherit bold :foreground ,green-alt)))
    `(awesome-tray-module-git-face ((,class :inherit bold :foreground ,magenta)))
    `(awesome-tray-module-last-command-face ((,class :inherit bold :foreground ,blue-alt-other)))
    `(awesome-tray-module-location-face ((,class :inherit bold :foreground ,yellow)))
    `(awesome-tray-module-mode-name-face ((,class :inherit bold :foreground ,green)))
    `(awesome-tray-module-parent-dir-face ((,class :inherit bold :foreground ,cyan)))
    `(awesome-tray-module-rvm-face ((,class :inherit bold :foreground ,magenta-alt-other)))
;;;;; binder
    `(binder-sidebar-highlight ((,class :inherit modus-theme-subtle-cyan)))
    `(binder-sidebar-marked ((,class :inherit modus-theme-mark-sel)))
    `(binder-sidebar-missing ((,class :inherit modus-theme-subtle-red)))
    `(binder-sidebar-tags ((,class :foreground ,cyan)))
;;;;; bm
    `(bm-face ((,class :inherit modus-theme-subtle-yellow :extend t)))
    `(bm-fringe-face ((,class :inherit modus-theme-fringe-yellow)))
    `(bm-fringe-persistent-face ((,class :inherit modus-theme-fringe-blue)))
    `(bm-persistent-face ((,class :inherit modus-theme-intense-blue :extend t)))
;;;;; bongo
    `(bongo-album-title ((,class :foreground ,cyan-active)))
    `(bongo-artist ((,class :foreground ,magenta-active)))
    `(bongo-currently-playing-track ((,class :inherit bold)))
    `(bongo-elapsed-track-part ((,class :inherit modus-theme-subtle-magenta :underline t)))
    `(bongo-filled-seek-bar ((,class :background ,blue-subtle-bg :foreground ,fg-main)))
    `(bongo-marked-track ((,class :foreground ,fg-mark-alt)))
    `(bongo-marked-track-line ((,class :background ,bg-mark-alt)))
    `(bongo-played-track ((,class :foreground ,fg-unfocused :strike-through t)))
    `(bongo-track-length ((,class :foreground ,blue-alt-other)))
    `(bongo-track-title ((,class :foreground ,blue-active)))
    `(bongo-unfilled-seek-bar ((,class :background ,blue-nuanced-bg :foreground ,fg-main)))
;;;;; boon
    `(boon-modeline-cmd ((,class :inherit modus-theme-active-blue)))
    `(boon-modeline-ins ((,class :inherit modus-theme-active-red)))
    `(boon-modeline-off ((,class :inherit modus-theme-active-yellow)))
    `(boon-modeline-spc ((,class :inherit modus-theme-active-green)))
;;;;; breakpoint (built-in gdb-mi.el)
    `(breakpoint-disabled ((,class :inherit shadow)))
    `(breakpoint-enabled ((,class :inherit bold :foreground ,red)))
;;;;; buffer-expose
    `(buffer-expose-ace-char-face ((,class :inherit bold :foreground ,red-active)))
    `(buffer-expose-mode-line-face ((,class :foreground ,cyan-active)))
    `(buffer-expose-selected-face ((,class :inherit modus-theme-special-mild)))
;;;;; calendar and diary
    `(calendar-month-header ((,class :inherit bold :foreground ,fg-main)))
    `(calendar-today ((,class :underline t)))
    `(calendar-weekday-header ((,class :foreground ,fg-dim)))
    `(calendar-weekend-header ((,class :inherit shadow)))
    `(diary ((,class :background ,green-nuanced-bg :foreground ,cyan-alt-other)))
    `(diary-anniversary ((,class :foreground ,red-alt-other)))
    `(diary-time ((,class :foreground ,blue-alt)))
    `(holiday ((,class :inherit bold :background ,red-nuanced-bg :foreground ,yellow)))
;;;;; calfw
    `(cfw:face-annotation ((,class :foreground ,fg-special-warm)))
    `(cfw:face-day-title ((,class :foreground ,fg-main)))
    `(cfw:face-default-content ((,class :foreground ,green-alt)))
    `(cfw:face-default-day ((,class :inherit (cfw:face-day-title bold))))
    `(cfw:face-disable ((,class :foreground ,fg-unfocused)))
    `(cfw:face-grid ((,class :foreground ,fg-window-divider-outer)))
    `(cfw:face-header ((,class :inherit bold :foreground ,fg-main)))
    `(cfw:face-holiday ((,class :foreground ,magenta-alt-other)))
    `(cfw:face-periods ((,class :foreground ,cyan-alt-other)))
    `(cfw:face-saturday ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(cfw:face-select ((,class :inherit modus-theme-intense-blue)))
    `(cfw:face-sunday ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(cfw:face-title ((,class :inherit modus-theme-variable-pitch
                              :foreground ,fg-special-cold
                              ,@(modus-themes--scale modus-themes-scale-5))))
    `(cfw:face-today ((,class :background ,bg-inactive)))
    `(cfw:face-today-title ((,class :background ,bg-active)))
    `(cfw:face-toolbar ((,class :background ,bg-alt :foreground ,bg-alt)))
    `(cfw:face-toolbar-button-off ((,class :inherit shadow)))
    `(cfw:face-toolbar-button-on ((,class :inherit bold :background ,blue-nuanced-bg
                                          :foreground ,blue-alt)))
;;;;; centaur-tabs
    `(centaur-tabs-active-bar-face ((,class :background ,fg-tab-active)))
    `(centaur-tabs-close-mouse-face ((,class :inherit bold :foreground ,red-active :underline t)))
    `(centaur-tabs-close-selected ((,class :inherit centaur-tabs-selected)))
    `(centaur-tabs-close-unselected ((,class :inherit centaur-tabs-unselected)))
    `(centaur-tabs-modified-marker-selected ((,class :inherit centaur-tabs-selected)))
    `(centaur-tabs-modified-marker-unselected ((,class :inherit centaur-tabs-unselected)))
    `(centaur-tabs-default ((,class :background ,bg-main :foreground ,bg-main)))
    `(centaur-tabs-selected ((,class :inherit bold :background ,bg-tab-active :foreground ,fg-main)))
    `(centaur-tabs-selected-modified ((,class :inherit italic :background ,bg-tab-active :foreground ,fg-main)))
    `(centaur-tabs-unselected ((,class :background ,bg-tab-inactive :foreground ,fg-dim)))
    `(centaur-tabs-unselected-modified ((,class :inherit italic :background ,bg-tab-inactive :foreground ,fg-dim)))
;;;;; cfrs
    `(cfrs-border-color ((,class :background ,fg-window-divider-inner)))
;;;;; change-log and log-view (`vc-print-log' and `vc-print-root-log')
    `(change-log-acknowledgment ((,class :foreground ,green-alt-other-faint)))
    `(change-log-conditionals ((,class :foreground ,magenta-alt)))
    `(change-log-date ((,class :foreground ,magenta-faint)))
    `(change-log-email ((,class :foreground ,blue)))
    `(change-log-file ((,class :inherit bold :foreground ,fg-special-cold)))
    `(change-log-function ((,class :foreground ,green-alt-other)))
    `(change-log-list ((,class :foreground ,magenta-alt-other)))
    `(change-log-name ((,class :foreground ,cyan)))
    `(log-edit-header ((,class :foreground ,fg-special-warm)))
    `(log-edit-summary ((,class :inherit bold :foreground ,blue)))
    `(log-edit-unknown-header ((,class :inherit shadow)))
    `(log-view-commit-body ((,class :foreground ,blue-nuanced-fg)))
    `(log-view-file ((,class :inherit bold :foreground ,fg-special-cold)))
    `(log-view-message ((,class :foreground ,green-alt-other-faint)))
;;;;; cider
    `(cider-debug-code-overlay-face ((,class :background ,bg-alt)))
    `(cider-debug-prompt-face ((,class :foreground ,magenta-alt :underline t)))
    `(cider-deprecated-face ((,class :inherit modus-theme-refine-yellow)))
    `(cider-docview-emphasis-face ((,class :inherit italic :foreground ,fg-special-cold)))
    `(cider-docview-literal-face ((,class :foreground ,blue-alt)))
    `(cider-docview-strong-face ((,class :inherit bold :foreground ,fg-special-cold)))
    `(cider-docview-table-border-face ((,class :inherit shadow)))
    `(cider-enlightened-face ((,class :box (:line-width -1 :color ,yellow-alt :style nil) :background ,bg-dim)))
    `(cider-enlightened-local-face ((,class :inherit bold :foreground ,yellow-alt-other)))
    `(cider-error-highlight-face ((,class :foreground ,red :underline t)))
    `(cider-fragile-button-face ((,class :box (:line-width 3 :color ,fg-alt :style released-button) :foreground ,yellow)))
    `(cider-fringe-good-face ((,class :foreground ,green-active)))
    `(cider-instrumented-face ((,class :box (:line-width -1 :color ,red :style nil) :background ,bg-dim)))
    `(cider-reader-conditional-face ((,class :inherit italic :foreground ,fg-special-warm)))
    `(cider-repl-input-face ((,class :inherit bold)))
    `(cider-repl-prompt-face ((,class :foreground ,cyan-alt-other)))
    `(cider-repl-stderr-face ((,class :inherit bold :foreground ,red)))
    `(cider-repl-stdout-face ((,class :foreground ,blue)))
    `(cider-result-overlay-face ((,class :box (:line-width -1 :color ,blue :style nil) :background ,bg-dim)))
    `(cider-stacktrace-error-class-face ((,class :inherit bold :foreground ,red)))
    `(cider-stacktrace-error-message-face ((,class :inherit italic :foreground ,red-alt-other)))
    `(cider-stacktrace-face ((,class :foreground ,fg-main)))
    `(cider-stacktrace-filter-active-face ((,class :foreground ,cyan-alt :underline t)))
    `(cider-stacktrace-filter-inactive-face ((,class :foreground ,cyan-alt)))
    `(cider-stacktrace-fn-face ((,class :inherit bold :foreground ,fg-main)))
    `(cider-stacktrace-ns-face ((,class :inherit italic :foreground ,fg-alt)))
    `(cider-stacktrace-promoted-button-face ((,class :box (:line-width 3 :color ,fg-alt :style released-button) :foreground ,red)))
    `(cider-stacktrace-suppressed-button-face ((,class :box (:line-width 3 :color ,fg-alt :style pressed-button)
                                                       :background ,bg-alt :foreground ,fg-alt)))
    `(cider-test-error-face ((,class :inherit modus-theme-subtle-red)))
    `(cider-test-failure-face ((,class :inherit (modus-theme-intense-red bold))))
    `(cider-test-success-face ((,class :inherit modus-theme-intense-green)))
    `(cider-traced-face ((,class :box (:line-width -1 :color ,cyan :style nil) :background ,bg-dim)))
    `(cider-warning-highlight-face ((,class :foreground ,yellow :underline t)))
;;;;; circe (and lui)
    `(circe-fool-face ((,class :inherit shadow)))
    `(circe-highlight-nick-face ((,class :inherit bold :foreground ,blue)))
    `(circe-prompt-face ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(circe-server-face ((,class :foreground ,fg-unfocused)))
    `(lui-button-face ((,class :inherit button)))
    `(lui-highlight-face ((,class :foreground ,magenta-alt)))
    `(lui-time-stamp-face ((,class :foreground ,blue-nuanced-fg)))
;;;;; color-rg
    `(color-rg-font-lock-column-number ((,class :foreground ,magenta-alt-other)))
    `(color-rg-font-lock-command ((,class :inherit bold :foreground ,fg-main)))
    `(color-rg-font-lock-file ((,class :inherit bold :foreground ,fg-special-cold)))
    `(color-rg-font-lock-flash ((,class :inherit modus-theme-intense-blue)))
    `(color-rg-font-lock-function-location ((,class :inherit modus-theme-special-calm)))
    `(color-rg-font-lock-header-line-directory ((,class :foreground ,blue-active)))
    `(color-rg-font-lock-header-line-edit-mode ((,class :foreground ,magenta-active)))
    `(color-rg-font-lock-header-line-keyword ((,class :foreground ,green-active)))
    `(color-rg-font-lock-header-line-text ((,class :foreground ,fg-active)))
    `(color-rg-font-lock-line-number ((,class :foreground ,fg-special-warm)))
    `(color-rg-font-lock-mark-changed ((,class :inherit bold :foreground ,blue)))
    `(color-rg-font-lock-mark-deleted ((,class :inherit bold :foreground ,red)))
    `(color-rg-font-lock-match ((,class :inherit modus-theme-special-calm)))
    `(color-rg-font-lock-position-splitter ((,class :inherit shadow)))
;;;;; column-enforce-mode
    `(column-enforce-face ((,class :inherit modus-theme-refine-yellow)))
;;;;; company-mode
    `(company-echo-common ((,class :foreground ,magenta-alt-other)))
    `(company-preview ((,class :background ,bg-dim :foreground ,fg-dim)))
    `(company-preview-common ((,class :foreground ,blue-alt)))
    `(company-preview-search ((,class :inherit modus-theme-special-calm)))
    `(company-scrollbar-bg ((,class :background ,bg-active)))
    `(company-scrollbar-fg ((,class :background ,fg-active)))
    `(company-template-field ((,class :inherit modus-theme-intense-magenta)))
    `(company-tooltip ((,class :background ,bg-alt :foreground ,fg-alt)))
    `(company-tooltip-annotation ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(company-tooltip-annotation-selection ((,class :inherit bold :foreground ,fg-main)))
    `(company-tooltip-common ((,class :inherit bold :foreground ,blue-alt)))
    `(company-tooltip-common-selection ((,class :foreground ,fg-main)))
    `(company-tooltip-mouse ((,class :inherit modus-theme-intense-blue)))
    `(company-tooltip-search ((,class :inherit (modus-theme-refine-cyan bold))))
    `(company-tooltip-search-selection ((,class :inherit (modus-theme-intense-green bold) :underline t)))
    `(company-tooltip-selection ((,class :inherit (modus-theme-subtle-cyan bold))))
;;;;; company-posframe
    `(company-posframe-active-backend-name ((,class :inherit bold :background ,bg-active :foreground ,blue-active)))
    `(company-posframe-inactive-backend-name ((,class :background ,bg-active :foreground ,fg-active)))
    `(company-posframe-metadata ((,class :background ,bg-inactive :foreground ,fg-inactive)))
;;;;; compilation feedback
    `(compilation-column-number ((,class :foreground ,magenta-alt-other)))
    `(compilation-error ((,class :inherit modus-theme-bold :foreground ,red)))
    `(compilation-info ((,class :inherit modus-theme-bold :foreground ,fg-special-cold)))
    `(compilation-line-number ((,class :foreground ,fg-special-warm)))
    `(compilation-mode-line-exit ((,class :inherit modus-theme-bold :foreground ,blue-active)))
    `(compilation-mode-line-fail ((,class :inherit modus-theme-bold :foreground ,red-active)))
    `(compilation-mode-line-run ((,class :inherit modus-theme-bold :foreground ,magenta-active)))
    `(compilation-warning ((,class :inherit modus-theme-bold :foreground ,yellow)))
;;;;; completions
    `(completions-annotations ((,class :inherit modus-theme-slant :foreground ,cyan-faint)))
    `(completions-common-part ((,class ,@(modus-themes--standard-completions
                                          blue-alt blue-nuanced-bg
                                          cyan-refine-bg cyan-refine-fg))))
    `(completions-first-difference ((,class :inherit bold
                                            ,@(modus-themes--standard-completions
                                               magenta-alt blue-nuanced-bg
                                               magenta-intense-bg fg-main))))
;;;;; consult
    `(consult-bookmark ((,class :foreground ,blue)))
    `(consult-file ((,class :foreground ,fg-special-cold)))
    `(consult-imenu-prefix ((,class :inherit bold)))
    `(consult-key ((,class :inherit modus-themes-bold :foreground ,magenta-alt-other)))
    `(consult-lighter ((,class :inherit shadow)))
    `(consult-line-number ((,class :foreground ,fg-special-warm)))
    `(consult-off ((,class :inherit error)))
    `(consult-on ((,class :inherit success)))
    `(consult-preview-cursor ((,class :inherit modus-theme-intense-blue)))
    `(consult-preview-error ((,class :inherit modus-theme-intense-red)))
    `(consult-preview-line ((,class :inherit modus-theme-special-mild)))
    `(consult-view ((,class :inherit bold :foreground ,fg-special-warm)))
;;;;; counsel
    `(counsel-active-mode ((,class :foreground ,magenta-alt-other)))
    `(counsel-application-name ((,class :foreground ,red-alt-other)))
    `(counsel-key-binding ((,class :inherit bold :foreground ,blue-alt-other)))
    `(counsel-outline-1 ((,class :inherit org-level-1)))
    `(counsel-outline-2 ((,class :inherit org-level-2)))
    `(counsel-outline-3 ((,class :inherit org-level-3)))
    `(counsel-outline-4 ((,class :inherit org-level-4)))
    `(counsel-outline-5 ((,class :inherit org-level-5)))
    `(counsel-outline-6 ((,class :inherit org-level-6)))
    `(counsel-outline-7 ((,class :inherit org-level-7)))
    `(counsel-outline-8 ((,class :inherit org-level-8)))
    `(counsel-outline-default ((,class :foreground ,fg-main)))
    `(counsel-variable-documentation ((,class :inherit modus-theme-slant :foreground ,yellow-alt-other)))
;;;;; counsel-css
    `(counsel-css-selector-depth-face-1 ((,class :foreground ,blue)))
    `(counsel-css-selector-depth-face-2 ((,class :foreground ,cyan)))
    `(counsel-css-selector-depth-face-3 ((,class :foreground ,green)))
    `(counsel-css-selector-depth-face-4 ((,class :foreground ,yellow)))
    `(counsel-css-selector-depth-face-5 ((,class :foreground ,magenta)))
    `(counsel-css-selector-depth-face-6 ((,class :foreground ,red)))
;;;;; counsel-notmuch
    `(counsel-notmuch-count-face ((,class :foreground ,cyan)))
    `(counsel-notmuch-date-face ((,class :foreground ,blue)))
    `(counsel-notmuch-people-face ((,class :foreground ,magenta)))
    `(counsel-notmuch-subject-face ((,class :foreground ,magenta-alt-other)))
;;;;; counsel-org-capture-string
    `(counsel-org-capture-string-template-body-face ((,class :foreground ,fg-special-cold)))
;;;;; cov
    `(cov-coverage-not-run-face ((,class :foreground ,red-intense)))
    `(cov-coverage-run-face ((,class :foreground ,green-intense)))
    `(cov-heavy-face ((,class :foreground ,magenta-intense)))
    `(cov-light-face ((,class :foreground ,blue-intense)))
    `(cov-med-face ((,class :foreground ,yellow-intense)))
    `(cov-none-face ((,class :foreground ,cyan-intense)))
;;;;; cperl-mode
    `(cperl-nonoverridable-face ((,class :foreground unspecified)))
    `(cperl-array-face ((,class :inherit font-lock-keyword-face)))
    `(cperl-hash-face ((,class :inherit font-lock-variable-name-face)))
;;;;; csv-mode
    `(csv-separator-face ((,class :background ,bg-special-cold :foreground ,fg-main)))
;;;;; ctrlf
    `(ctrlf-highlight-active ((,class :inherit (modus-theme-intense-green bold))))
    `(ctrlf-highlight-line ((,class :inherit modus-theme-hl-line)))
    `(ctrlf-highlight-passive ((,class :inherit modus-theme-refine-cyan)))
;;;;; custom (M-x customize)
    `(custom-button ((,class :box (:line-width 2 :color nil :style released-button)
                             :background ,bg-active :foreground ,fg-main)))
    `(custom-button-mouse ((,class :box (:line-width 2 :color nil :style released-button)
                                   :background ,bg-active :foreground ,fg-active)))
    `(custom-button-pressed ((,class :box (:line-width 2 :color nil :style pressed-button)
                                     :background ,bg-active :foreground ,fg-main)))
    `(custom-changed ((,class :inherit modus-theme-subtle-cyan)))
    `(custom-comment ((,class :inherit shadow)))
    `(custom-comment-tag ((,class :background ,bg-alt :foreground ,yellow-alt-other)))
    `(custom-face-tag ((,class :inherit bold :foreground ,blue-intense)))
    `(custom-group-tag ((,class :inherit bold :foreground ,green-intense)))
    `(custom-group-tag-1 ((,class :inherit modus-theme-special-warm)))
    `(custom-invalid ((,class :inherit (modus-theme-intense-red bold))))
    `(custom-modified ((,class :inherit modus-theme-subtle-cyan)))
    `(custom-rogue ((,class :inherit modus-theme-refine-magenta)))
    `(custom-set ((,class :foreground ,blue-alt)))
    `(custom-state ((,class :foreground ,cyan-alt-other)))
    `(custom-themed ((,class :inherit modus-theme-subtle-blue)))
    `(custom-variable-tag ((,class :inherit bold :foreground ,cyan)))
;;;;; dap-mode
    `(dap-mouse-eval-thing-face ((,class :box (:line-width -1 :color ,blue-active :style nil)
                                         :background ,bg-active :foreground ,fg-main)))
    `(dap-result-overlay-face ((,class :box (:line-width -1 :color ,bg-active :style nil)
                                       :background ,bg-active :foreground ,fg-main)))
    `(dap-ui-breakpoint-verified-fringe ((,class :inherit bold :foreground ,green-active)))
    `(dap-ui-compile-errline ((,class :inherit bold :foreground ,red-intense)))
    `(dap-ui-locals-scope-face ((,class :inherit bold :foreground ,magenta :underline t)))
    `(dap-ui-locals-variable-face ((,class :inherit bold :foreground ,cyan)))
    `(dap-ui-locals-variable-leaf-face ((,class :inherit italic :foreground ,cyan-alt-other)))
    `(dap-ui-marker-face ((,class :inherit modus-theme-subtle-blue)))
    `(dap-ui-sessions-stack-frame-face ((,class :inherit bold :foreground ,magenta-alt)))
    `(dap-ui-sessions-terminated-active-face ((,class :inherit bold :foreground ,fg-alt)))
    `(dap-ui-sessions-terminated-face ((,class :inherit shadow)))
;;;;; dashboard (emacs-dashboard)
    `(dashboard-banner-logo-title ((,class :inherit bold :foreground ,fg-special-cold)))
    `(dashboard-footer ((,class :inherit bold :foreground ,fg-special-mild)))
    `(dashboard-heading ((,class :inherit bold :foreground ,fg-special-warm)))
    `(dashboard-navigator ((,class :foreground ,cyan-alt-other)))
    `(dashboard-text-banner ((,class :foreground ,fg-dim)))
;;;;; deadgrep
    `(deadgrep-filename-face ((,class :inherit bold :foreground ,fg-special-cold)))
    `(deadgrep-match-face ((,class :inherit modus-theme-special-calm)))
    `(deadgrep-meta-face ((,class :inherit shadow)))
    `(deadgrep-regexp-metachar-face ((,class :inherit bold :foreground ,yellow-intense)))
    `(deadgrep-search-term-face ((,class :inherit bold :foreground ,green-intense)))
;;;;; debbugs
    `(debbugs-gnu-archived ((,class :inverse-video t)))
    `(debbugs-gnu-done ((,class :inherit shadow)))
    `(debbugs-gnu-forwarded ((,class :foreground ,fg-special-warm)))
    `(debbugs-gnu-handled ((,class :foreground ,green)))
    `(debbugs-gnu-new ((,class :foreground ,red)))
    `(debbugs-gnu-pending ((,class :foreground ,cyan)))
    `(debbugs-gnu-stale-1 ((,class :foreground ,yellow-nuanced-fg)))
    `(debbugs-gnu-stale-2 ((,class :foreground ,yellow)))
    `(debbugs-gnu-stale-3 ((,class :foreground ,yellow-alt)))
    `(debbugs-gnu-stale-4 ((,class :foreground ,yellow-alt-other)))
    `(debbugs-gnu-stale-5 ((,class :foreground ,red-alt)))
    `(debbugs-gnu-tagged ((,class :foreground ,magenta-alt)))
;;;;; define-word
    `(define-word-face-1 ((,class :foreground ,yellow)))
    `(define-word-face-2 ((,class :foreground ,fg-main)))
;;;;; deft
    `(deft-filter-string-error-face ((,class :inherit modus-theme-refine-red)))
    `(deft-filter-string-face ((,class :foreground ,green-intense)))
    `(deft-header-face ((,class :inherit bold :foreground ,fg-special-warm)))
    `(deft-separator-face ((,class :inherit shadow)))
    `(deft-summary-face ((,class :inherit modus-theme-slant :foreground ,fg-alt)))
    `(deft-time-face ((,class :foreground ,fg-special-cold)))
    `(deft-title-face ((,class :inherit bold :foreground ,fg-main)))
;;;;; dictionary
    `(dictionary-button-face ((,class :inherit bold :foreground ,fg-special-cold)))
    `(dictionary-reference-face ((,class :inherit button :foreground ,blue-alt-other)))
    `(dictionary-word-definition-face ((,class :foreground ,fg-main)))
    `(dictionary-word-entry-face ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
;;;;; diff-hl
    `(diff-hl-change ((,class :inherit modus-theme-fringe-yellow)))
    `(diff-hl-delete ((,class :inherit modus-theme-fringe-red)))
    `(diff-hl-dired-change ((,class :inherit diff-hl-change)))
    `(diff-hl-dired-delete ((,class :inherit diff-hl-delete)))
    `(diff-hl-dired-ignored ((,class :inherit dired-ignored)))
    `(diff-hl-dired-insert ((,class :inherit diff-hl-insert)))
    `(diff-hl-dired-unknown ((,class :inherit dired-ignored)))
    `(diff-hl-insert ((,class :inherit modus-theme-fringe-green)))
    `(diff-hl-reverted-hunk-highlight ((,class :inherit (modus-theme-active-magenta bold))))
;;;;; diff-mode
    `(diff-added ((,class :inherit modus-theme-diff-added)))
    `(diff-changed ((,class :inherit modus-theme-diff-changed)))
    `(diff-context ((,class :foreground ,fg-unfocused)))
    `(diff-error ((,class :inherit modus-theme-intense-red)))
    `(diff-file-header ((,class :inherit bold :foreground ,fg-main)))
    `(diff-function ((,class :inherit modus-theme-diff-heading)))
    `(diff-header ((,class :background ,bg-dim :foreground ,fg-main)))
    `(diff-hunk-header ((,class :inherit (bold modus-theme-diff-heading))))
    `(diff-index ((,class :inherit bold :foreground ,blue-alt)))
    `(diff-indicator-added ((,class :inherit (diff-added bold) :foreground ,green)))
    `(diff-indicator-changed ((,class :inherit (diff-changed bold) :foreground ,yellow)))
    `(diff-indicator-removed ((,class :inherit (diff-removed bold) :foreground ,red)))
    `(diff-nonexistent ((,class :inherit (modus-theme-neutral bold))))
    `(diff-refine-added ((,class :inherit modus-theme-diff-refine-added)))
    `(diff-refine-changed ((,class :inherit modus-theme-diff-refine-changed)))
    `(diff-refine-removed ((,class :inherit modus-theme-diff-refine-removed)))
    `(diff-removed ((,class :inherit modus-theme-diff-removed)))
;;;;; dim-autoload
    `(dim-autoload-cookie-line ((,class :inherit font-lock-comment-face)))
;;;;; dir-treeview
    `(dir-treeview-archive-face ((,class :foreground ,fg-special-warm)))
    `(dir-treeview-archive-icon-face ((,class :inherit dir-treeview-default-icon-face :foreground ,yellow)))
    `(dir-treeview-audio-face ((,class :foreground ,magenta)))
    `(dir-treeview-audio-icon-face ((,class :inherit dir-treeview-default-icon-face :foreground ,magenta-alt)))
    `(dir-treeview-control-face ((,class :inherit shadow)))
    `(dir-treeview-control-mouse-face ((,class :inherit highlight)))
    `(dir-treeview-default-icon-face ((,class :inherit bold :family "Font Awesome" :foreground ,fg-alt)))
    `(dir-treeview-default-filename-face ((,class :foreground ,fg-main)))
    `(dir-treeview-directory-face ((,class :foreground ,blue)))
    `(dir-treeview-directory-icon-face ((,class :inherit dir-treeview-default-icon-face :foreground ,blue-alt)))
    `(dir-treeview-executable-face ((,class :foreground ,red-alt)))
    `(dir-treeview-executable-icon-face ((,class :inherit dir-treeview-default-icon-face :foreground ,red-alt-other)))
    `(dir-treeview-image-face ((,class :foreground ,green-alt-other)))
    `(dir-treeview-image-icon-face ((,class :inherit dir-treeview-default-icon-face :foreground ,green-alt)))
    `(dir-treeview-indent-face ((,class :inherit shadow)))
    `(dir-treeview-label-mouse-face ((,class :inherit highlight)))
    `(dir-treeview-start-dir-face ((,class :inherit modus-theme-pseudo-header)))
    `(dir-treeview-symlink-face ((,class :inherit button
                                         ,@(modus-themes--link-color
                                            cyan cyan-faint))))
    `(dir-treeview-video-face ((,class :foreground ,magenta-alt-other)))
    `(dir-treeview-video-icon-face ((,class :inherit dir-treeview-default-icon-face :foreground ,magenta-alt-other)))
;;;;; dired
    `(dired-broken-symlink ((,class :inherit button :foreground ,red)))
    `(dired-directory ((,class :foreground ,blue)))
    `(dired-flagged ((,class :inherit modus-theme-mark-del)))
    `(dired-header ((,class :inherit modus-theme-pseudo-header)))
    `(dired-ignored ((,class :inherit shadow)))
    `(dired-mark ((,class :inherit modus-theme-mark-symbol)))
    `(dired-marked ((,class :inherit modus-theme-mark-sel)))
    `(dired-perm-write ((,class :foreground ,fg-special-warm)))
    `(dired-symlink ((,class :inherit button
                             ,@(modus-themes--link-color
                                cyan-alt cyan-alt-faint))))
    `(dired-warning ((,class :inherit bold :foreground ,yellow)))
;;;;; dired-async
    `(dired-async-failures ((,class :inherit modus-theme-bold :foreground ,red-active)))
    `(dired-async-message ((,class :inherit modus-theme-bold :foreground ,green-active)))
    `(dired-async-mode-message ((,class :inherit modus-theme-bold :foreground ,cyan-active)))
;;;;; dired-git
    `(dired-git-branch-else ((,class :inherit bold :foreground ,magenta-alt)))
    `(dired-git-branch-master ((,class :inherit bold :foreground ,magenta-alt-other)))
;;;;; dired-git-info
    `(dgi-commit-message-face ((,class :foreground ,fg-special-mild)))
;;;;; dired-narrow
    `(dired-narrow-blink ((,class :inherit (modus-theme-subtle-cyan bold))))
;;;;; dired-subtree
    ;; remove background from dired-subtree, else it breaks
    ;; dired-{flagged,marked} and any other face that sets a background
    ;; such as hl-line
    `(dired-subtree-depth-1-face ((,class :background nil)))
    `(dired-subtree-depth-2-face ((,class :background nil)))
    `(dired-subtree-depth-3-face ((,class :background nil)))
    `(dired-subtree-depth-4-face ((,class :background nil)))
    `(dired-subtree-depth-5-face ((,class :background nil)))
    `(dired-subtree-depth-6-face ((,class :background nil)))
;;;;; diredc
    `(diredc-face-chmod-font-lock-dir ((,class :foreground ,blue-alt)))
    `(diredc-face-chmod-font-lock-exec ((,class :foreground ,magenta)))
    `(diredc-face-chmod-font-lock-read ((,class :foreground ,fg-main)))
    `(diredc-face-chmod-font-lock-write ((,class :foreground ,cyan)))
;;;;; diredfl
    `(diredfl-autofile-name ((,class :inherit modus-theme-special-cold)))
    `(diredfl-compressed-file-name ((,class :foreground ,fg-special-warm)))
    `(diredfl-compressed-file-suffix ((,class :foreground ,red-alt)))
    `(diredfl-date-time ((,class :foreground ,cyan-alt-other)))
    `(diredfl-deletion ((,class :inherit modus-theme-mark-del)))
    `(diredfl-deletion-file-name ((,class :inherit modus-theme-mark-del)))
    `(diredfl-dir-heading ((,class :inherit modus-theme-pseudo-header)))
    `(diredfl-dir-name ((,class :inherit dired-directory)))
    `(diredfl-dir-priv ((,class :foreground ,blue-alt)))
    `(diredfl-exec-priv ((,class :foreground ,magenta)))
    `(diredfl-executable-tag ((,class :foreground ,magenta-alt)))
    `(diredfl-file-name ((,class :foreground ,fg-main)))
    `(diredfl-file-suffix ((,class :foreground ,cyan)))
    `(diredfl-flag-mark ((,class :inherit modus-theme-mark-sel)))
    `(diredfl-flag-mark-line ((,class :inherit modus-theme-mark-sel)))
    `(diredfl-ignored-file-name ((,class :inherit shadow)))
    `(diredfl-link-priv ((,class :foreground ,blue-alt-other)))
    `(diredfl-no-priv ((,class :inherit shadow)))
    `(diredfl-number ((,class :foreground ,cyan-alt)))
    `(diredfl-other-priv ((,class :foreground ,yellow)))
    `(diredfl-rare-priv ((,class :foreground ,red-alt)))
    `(diredfl-read-priv ((,class :foreground ,fg-main)))
    `(diredfl-symlink ((,class :inherit dired-symlink)))
    `(diredfl-tagged-autofile-name ((,class :inherit modus-theme-refine-magenta)))
    `(diredfl-write-priv ((,class :foreground ,cyan)))
;;;;; dired+
    `(diredp-autofile-name ((,class :inherit modus-theme-special-cold)))
    `(diredp-compressed-file-name ((,class :foreground ,fg-special-warm)))
    `(diredp-compressed-file-suffix ((,class :foreground ,red-alt)))
    `(diredp-date-time ((,class :foreground ,cyan-alt-other)))
    `(diredp-deletion ((,class :inherit modus-theme-mark-del)))
    `(diredp-deletion-file-name ((,class :inherit modus-theme-mark-del)))
    `(diredp-dir-heading ((,class :inherit modus-theme-pseudo-header)))
    `(diredp-dir-name ((,class :inherit dired-directory)))
    `(diredp-dir-priv ((,class :foreground ,blue-alt)))
    `(diredp-exec-priv ((,class :foreground ,magenta)))
    `(diredp-executable-tag ((,class :foreground ,magenta-alt)))
    `(diredp-file-name ((,class :foreground ,fg-main)))
    `(diredp-file-suffix ((,class :foreground ,cyan)))
    `(diredp-flag-mark ((,class :inherit modus-theme-mark-sel)))
    `(diredp-flag-mark-line ((,class :inherit modus-theme-mark-sel)))
    `(diredp-ignored-file-name ((,class :inherit shadow)))
    `(diredp-link-priv ((,class :foreground ,blue-alt-other)))
    `(diredp-mode-line-flagged ((,class :inherit modus-theme-mark-del)))
    `(diredp-mode-line-marked ((,class :inherit modus-theme-mark-sel)))
    `(diredp-no-priv ((,class :inherit shadow)))
    `(diredp-number ((,class :foreground ,cyan-alt)))
    `(diredp-omit-file-name ((,class :inherit shadow :strike-through t)))
    `(diredp-other-priv ((,class :foreground ,yellow)))
    `(diredp-rare-priv ((,class :foreground ,red-alt)))
    `(diredp-read-priv ((,class :foreground ,fg-main)))
    `(diredp-symlink ((,class :inherit dired-symlink)))
    `(diredp-tagged-autofile-name ((,class :inherit modus-theme-refine-magenta)))
    `(diredp-write-priv ((,class :foreground ,cyan)))
;;;;; disk-usage
    `(disk-usage-children ((,class :foreground ,yellow)))
    `(disk-usage-inaccessible ((,class :inherit bold :foreground ,red)))
    `(disk-usage-percent ((,class :foreground ,green)))
    `(disk-usage-size ((,class :foreground ,cyan)))
    `(disk-usage-symlink ((,class :inherit button)))
    `(disk-usage-symlink-directory ((,class :inherit bold :foreground ,blue-alt)))
;;;;; doom-modeline
    `(doom-modeline-bar ((,class :inherit modus-theme-active-blue)))
    `(doom-modeline-bar-inactive ((,class :background ,fg-inactive :foreground ,bg-main)))
    `(doom-modeline-battery-charging ((,class :foreground ,green-active)))
    `(doom-modeline-battery-critical ((,class :inherit bold :foreground ,red-active)))
    `(doom-modeline-battery-error ((,class :inherit bold :box (:line-width -2)
                                           :foreground ,red-active)))
    `(doom-modeline-battery-full ((,class :foreground ,blue-active)))
    `(doom-modeline-battery-normal ((,class :foreground ,fg-active)))
    `(doom-modeline-battery-warning ((,class :inherit bold :foreground ,yellow-active)))
    `(doom-modeline-buffer-file ((,class :inherit bold :foreground ,fg-active)))
    `(doom-modeline-buffer-major-mode ((,class :inherit bold :foreground ,cyan-active)))
    `(doom-modeline-buffer-minor-mode ((,class :foreground ,fg-inactive)))
    `(doom-modeline-buffer-modified ((,class :inherit bold :foreground ,magenta-active)))
    `(doom-modeline-buffer-path ((,class :inherit bold :foreground ,fg-active)))
    `(doom-modeline-debug ((,class :inherit bold :foreground ,yellow-active)))
    `(doom-modeline-debug-visual ((,class :inherit bold :foreground ,red-active)))
    `(doom-modeline-evil-emacs-state ((,class :inherit bold :foreground ,magenta-active)))
    `(doom-modeline-evil-insert-state ((,class :inherit bold :foreground ,green-active)))
    `(doom-modeline-evil-motion-state ((,class :inherit bold :foreground ,fg-inactive)))
    `(doom-modeline-evil-normal-state ((,class :inherit bold :foreground ,fg-active)))
    `(doom-modeline-evil-operator-state ((,class :inherit bold :foreground ,blue-active)))
    `(doom-modeline-evil-replace-state ((,class :inherit bold :foreground ,red-active)))
    `(doom-modeline-evil-visual-state ((,class :inherit bold :foreground ,cyan-active)))
    `(doom-modeline-highlight ((,class :inherit bold :foreground ,blue-active)))
    `(doom-modeline-host ((,class :inherit italic)))
    `(doom-modeline-info ((,class :foreground ,green-active)))
    `(doom-modeline-lsp-error ((,class :inherit bold :foreground ,red-active)))
    `(doom-modeline-lsp-success ((,class :inherit bold :foreground ,green-active)))
    `(doom-modeline-lsp-warning ((,class :inherit bold :foreground ,yellow-active)))
    `(doom-modeline-panel ((,class :inherit modus-theme-active-blue)))
    `(doom-modeline-persp-buffer-not-in-persp ((,class :inherit italic :foreground ,yellow-active)))
    `(doom-modeline-persp-name ((,class :foreground ,fg-active)))
    `(doom-modeline-project-dir ((,class :inherit bold :foreground ,blue-active)))
    `(doom-modeline-project-parent-dir ((,class :foreground ,blue-active)))
    `(doom-modeline-project-root-dir ((,class :foreground ,fg-active)))
    `(doom-modeline-unread-number ((,class :inherit italic :foreground ,fg-active)))
    `(doom-modeline-urgent ((,class :inherit bold :foreground ,red-active)))
    `(doom-modeline-warning ((,class :inherit bold :foreground ,yellow-active)))
;;;;; dynamic-ruler
    `(dynamic-ruler-negative-face ((,class :inherit modus-theme-intense-neutral)))
    `(dynamic-ruler-positive-face ((,class :inherit modus-theme-intense-yellow)))
;;;;; easy-jekyll
    `(easy-jekyll-help-face ((,class :background ,bg-dim :foreground ,cyan-alt-other)))
;;;;; easy-kill
    `(easy-kill-origin ((,class :inherit modus-theme-subtle-red)))
    `(easy-kill-selection ((,class :inherit modus-theme-subtle-yellow)))
;;;;; ebdb
    `(ebdb-address-default ((,class :foreground ,fg-main)))
    `(ebdb-db-char ((,class :foreground ,fg-special-cold)))
    `(ebdb-defunct ((,class :inherit shadow)))
    `(ebdb-field-hidden ((,class :foreground ,magenta)))
    `(ebdb-field-url ((,class :foreground ,blue)))
    `(ebdb-label ((,class :foreground ,cyan-alt-other)))
    `(ebdb-mail-default ((,class :foreground ,fg-main)))
    `(ebdb-mail-primary ((,class :foreground ,blue-alt)))
    `(ebdb-marked ((,class :background ,cyan-intense-bg)))
    `(ebdb-organization-name ((,class :foreground ,fg-special-calm)))
    `(ebdb-person-name ((,class :foreground ,magenta-alt-other)))
    `(ebdb-phone-default ((,class :foreground ,fg-special-warm)))
    `(ebdb-role-defunct ((,class :inherit shadow)))
    `(eieio-custom-slot-tag-face ((,class :foreground ,red-alt)))
;;;;; ediff
    ;; NOTE: here we break from the pattern of inheriting from the
    ;; modus-theme-diff-* faces.
    `(ediff-current-diff-A ((,class ,@(modus-themes--diff
                                       bg-dim red
                                       bg-diff-removed fg-diff-removed
                                       red-nuanced-bg red-faint))))
    `(ediff-current-diff-Ancestor ((,class ,@(modus-themes--diff
                                              bg-dim fg-special-cold
                                              bg-special-cold fg-special-cold
                                              blue-nuanced-bg blue))))
    `(ediff-current-diff-B ((,class ,@(modus-themes--diff
                                       bg-dim green
                                       bg-diff-added fg-diff-added
                                       green-nuanced-bg green-faint))))
    `(ediff-current-diff-C ((,class ,@(modus-themes--diff
                                       bg-dim yellow
                                       bg-diff-changed fg-diff-changed
                                       yellow-nuanced-bg yellow-faint))))
    `(ediff-even-diff-A ((,class :background ,bg-diff-neutral-1 :foreground ,fg-diff-neutral-1)))
    `(ediff-even-diff-Ancestor ((,class :background ,bg-diff-neutral-2 :foreground ,fg-diff-neutral-1)))
    `(ediff-even-diff-B ((,class :background ,bg-diff-neutral-1 :foreground ,fg-diff-neutral-1)))
    `(ediff-even-diff-C ((,class :background ,bg-diff-neutral-2 :foreground ,fg-diff-neutral-2)))
    `(ediff-fine-diff-A ((,class :background ,bg-diff-focus-removed :foreground ,fg-diff-focus-removed)))
    `(ediff-fine-diff-Ancestor ((,class :inherit modus-theme-refine-cyan)))
    `(ediff-fine-diff-B ((,class :background ,bg-diff-focus-added :foreground ,fg-diff-focus-added)))
    `(ediff-fine-diff-C ((,class :background ,bg-diff-focus-changed :foreground ,fg-diff-focus-changed)))
    `(ediff-odd-diff-A ((,class :background ,bg-diff-neutral-2 :foreground ,fg-diff-neutral-2)))
    `(ediff-odd-diff-Ancestor ((,class :background ,bg-diff-neutral-0 :foreground ,fg-diff-neutral-0)))
    `(ediff-odd-diff-B ((,class :background ,bg-diff-neutral-2 :foreground ,fg-diff-neutral-2)))
    `(ediff-odd-diff-C ((,class :background ,bg-diff-neutral-1 :foreground ,fg-diff-neutral-1)))
;;;;; eglot
    `(eglot-mode-line ((,class :inherit modus-theme-bold :foreground ,magenta-active)))
;;;;; el-search
    `(el-search-highlight-in-prompt-face ((,class :inherit bold :foreground ,magenta-alt)))
    `(el-search-match ((,class :inherit modus-theme-intense-green)))
    `(el-search-other-match ((,class :inherit modus-theme-special-mild)))
    `(el-search-occur-match ((,class :inherit modus-theme-special-calm)))
;;;;; eldoc
    ;; NOTE: see https://github.com/purcell/package-lint/issues/187
    (list 'eldoc-highlight-function-argument `((,class :inherit bold :foreground ,blue-alt-other)))
;;;;; eldoc-box
    `(eldoc-box-body ((,class :background ,bg-alt :foreground ,fg-main)))
    `(eldoc-box-border ((,class :background ,fg-alt)))
;;;;; elfeed
    `(elfeed-log-date-face ((,class :foreground ,cyan-alt)))
    `(elfeed-log-debug-level-face ((,class :foreground ,magenta)))
    `(elfeed-log-error-level-face ((,class :foreground ,red)))
    `(elfeed-log-info-level-face ((,class :foreground ,green)))
    `(elfeed-log-warn-level-face ((,class :foreground ,yellow)))
    `(elfeed-search-date-face ((,class :foreground ,blue-nuanced-fg)))
    `(elfeed-search-feed-face ((,class :foreground ,cyan)))
    `(elfeed-search-filter-face ((,class :inherit bold :foreground ,magenta-active)))
    `(elfeed-search-last-update-face ((,class :foreground ,cyan-active)))
    `(elfeed-search-tag-face ((,class :foreground ,blue-nuanced-fg)))
    `(elfeed-search-title-face ((,class :foreground ,fg-dim)))
    `(elfeed-search-unread-count-face ((,class :foreground ,green-active)))
    `(elfeed-search-unread-title-face ((,class :inherit bold :foreground ,fg-main)))
;;;;; elfeed-score
    `(elfeed-score-date-face ((,class :foreground ,blue)))
    `(elfeed-score-debug-level-face ((,class :foreground ,magenta-alt-other)))
    `(elfeed-score-error-level-face ((,class :foreground ,red)))
    `(elfeed-score-info-level-face ((,class :foreground ,cyan)))
    `(elfeed-score-warn-level-face ((,class :foreground ,yellow)))
;;;;; emms
    `(emms-playlist-track-face ((,class :foreground ,blue)))
    `(emms-playlist-selected-face ((,class :inherit bold :foreground ,magenta)))
;;;;; enhanced-ruby-mode
    `(enh-ruby-heredoc-delimiter-face ((,class :foreground ,blue-alt-other)))
    `(enh-ruby-op-face ((,class :foreground ,fg-main)))
    `(enh-ruby-regexp-delimiter-face ((,class :foreground ,green)))
    `(enh-ruby-regexp-face ((,class :foreground ,magenta)))
    `(enh-ruby-string-delimiter-face ((,class :foreground ,blue-alt)))
    `(erm-syn-errline ((,class :foreground ,red :underline t)))
    `(erm-syn-warnline ((,class :foreground ,yellow :underline t)))
;;;;; epa
    `(epa-field-body ((,class :foreground ,fg-main)))
    `(epa-field-name ((,class :inherit bold :foreground ,fg-dim)))
    `(epa-mark ((,class :inherit bold :foreground ,magenta)))
    `(epa-string ((,class :foreground ,blue-alt)))
    `(epa-validity-disabled ((,class :inherit modus-theme-refine-red)))
    `(epa-validity-high ((,class :inherit bold :foreground ,green-alt-other)))
    `(epa-validity-low ((,class :inherit shadow)))
    `(epa-validity-medium ((,class :foreground ,green-alt)))
;;;;; equake
    `(equake-buffer-face ((,class :background ,bg-main :foreground ,fg-main)))
    `(equake-shell-type-eshell ((,class :background ,bg-inactive :foreground ,green-active)))
    `(equake-shell-type-rash ((,class :background ,bg-inactive :foreground ,red-active)))
    `(equake-shell-type-shell ((,class :background ,bg-inactive :foreground ,cyan-active)))
    `(equake-shell-type-term ((,class :background ,bg-inactive :foreground ,yellow-active)))
    `(equake-shell-type-vterm ((,class :background ,bg-inactive :foreground ,magenta-active)))
    `(equake-tab-active ((,class :background ,fg-alt :foreground ,bg-alt)))
    `(equake-tab-inactive ((,class :foreground ,fg-inactive)))
;;;;; erc
    `(erc-action-face ((,class :inherit bold :foreground ,cyan)))
    `(erc-bold-face ((,class :inherit bold)))
    `(erc-button ((,class :inherit button)))
    `(erc-command-indicator-face ((,class :inherit bold :foreground ,cyan-alt)))
    `(erc-current-nick-face ((,class :foreground ,magenta-alt-other)))
    `(erc-dangerous-host-face ((,class :inherit modus-theme-intense-red)))
    `(erc-direct-msg-face ((,class :foreground ,magenta)))
    `(erc-error-face ((,class :inherit bold :foreground ,red)))
    `(erc-fool-face ((,class :foreground ,fg-inactive)))
    `(erc-header-line ((,class :background ,bg-header :foreground ,fg-header)))
    `(erc-input-face ((,class :foreground ,fg-special-calm)))
    `(erc-inverse-face ((,class :inherit erc-default-face :inverse-video t)))
    `(erc-keyword-face ((,class :inherit bold :foreground ,magenta-alt)))
    `(erc-my-nick-face ((,class :inherit bold :foreground ,magenta)))
    `(erc-my-nick-prefix-face ((,class :inherit erc-my-nick-face)))
    `(erc-nick-default-face ((,class :inherit bold :foreground ,blue)))
    `(erc-nick-msg-face ((,class :inherit bold :foreground ,green)))
    `(erc-nick-prefix-face ((,class :inherit erc-nick-default-face)))
    `(erc-notice-face ((,class :foreground ,fg-unfocused)))
    `(erc-pal-face ((,class :inherit bold :foreground ,red-alt)))
    `(erc-prompt-face ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(erc-timestamp-face ((,class :foreground ,blue-nuanced-fg)))
    `(erc-underline-face ((,class :underline t)))
    `(bg:erc-color-face0 ((,class :background "white")))
    `(bg:erc-color-face1 ((,class :background "black")))
    `(bg:erc-color-face10 ((,class :background ,cyan-subtle-bg)))
    `(bg:erc-color-face11 ((,class :background ,cyan-intense-bg)))
    `(bg:erc-color-face12 ((,class :background ,blue-subtle-bg)))
    `(bg:erc-color-face13 ((,class :background ,magenta-subtle-bg)))
    `(bg:erc-color-face14 ((,class :background "gray60")))
    `(bg:erc-color-face15 ((,class :background "gray80")))
    `(bg:erc-color-face2 ((,class :background ,blue-intense-bg)))
    `(bg:erc-color-face3 ((,class :background ,green-intense-bg)))
    `(bg:erc-color-face4 ((,class :background ,red-subtle-bg)))
    `(bg:erc-color-face5 ((,class :background ,red-intense-bg)))
    `(bg:erc-color-face6 ((,class :background ,magenta-refine-bg)))
    `(bg:erc-color-face7 ((,class :background ,yellow-subtle-bg)))
    `(bg:erc-color-face8 ((,class :background ,yellow-refine-bg)))
    `(bg:erc-color-face9 ((,class :background ,green-subtle-bg)))
    `(fg:erc-color-face0 ((,class :foreground "white")))
    `(fg:erc-color-face1 ((,class :foreground "black")))
    `(fg:erc-color-face10 ((,class :foreground ,cyan)))
    `(fg:erc-color-face11 ((,class :foreground ,cyan-alt-other)))
    `(fg:erc-color-face12 ((,class :foreground ,blue)))
    `(fg:erc-color-face13 ((,class :foreground ,magenta-alt)))
    `(fg:erc-color-face14 ((,class :foreground "gray60")))
    `(fg:erc-color-face15 ((,class :foreground "gray80")))
    `(fg:erc-color-face2 ((,class :foreground ,blue-alt-other)))
    `(fg:erc-color-face3 ((,class :foreground ,green)))
    `(fg:erc-color-face4 ((,class :foreground ,red)))
    `(fg:erc-color-face5 ((,class :foreground ,red-alt)))
    `(fg:erc-color-face6 ((,class :foreground ,magenta-alt-other)))
    `(fg:erc-color-face7 ((,class :foreground ,yellow-alt-other)))
    `(fg:erc-color-face8 ((,class :foreground ,yellow-alt)))
    `(fg:erc-color-face9 ((,class :foreground ,green-alt-other)))
;;;;; eros
    `(eros-result-overlay-face ((,class :box (:line-width -1 :color ,blue)
                                        :background ,bg-dim :foreground ,fg-dim)))
;;;;; ert
    `(ert-test-result-expected ((,class :inherit modus-theme-intense-green)))
    `(ert-test-result-unexpected ((,class :inherit modus-theme-intense-red)))
;;;;; eshell
    `(eshell-ls-archive ((,class :inherit bold :foreground ,cyan-alt)))
    `(eshell-ls-backup ((,class :foreground ,yellow-alt)))
    `(eshell-ls-clutter ((,class :foreground ,red-alt)))
    `(eshell-ls-directory ((,class :inherit bold :foreground ,blue-alt)))
    `(eshell-ls-executable ((,class :foreground ,magenta-alt)))
    `(eshell-ls-missing ((,class :inherit modus-theme-intense-red)))
    `(eshell-ls-product ((,class :foreground ,fg-special-warm)))
    `(eshell-ls-readonly ((,class :foreground ,fg-special-cold)))
    `(eshell-ls-special ((,class :inherit bold :foreground ,magenta)))
    `(eshell-ls-symlink ((,class :inherit button
                                 ,@(modus-themes--link-color
                                    cyan cyan-faint))))
    `(eshell-ls-unreadable ((,class :background ,bg-inactive :foreground ,fg-inactive)))
    `(eshell-prompt ((,class :inherit modus-theme-bold
                             ,@(modus-themes--prompt
                                green-alt-other
                                green-nuanced-bg green-alt
                                green-refine-bg fg-main))))
;;;;; eshell-fringe-status
    `(eshell-fringe-status-failure ((,class :foreground ,red)))
    `(eshell-fringe-status-success ((,class :foreground ,green)))
;;;;; eshell-git-prompt
    `(eshell-git-prompt-add-face ((,class :inherit shadow)))
    `(eshell-git-prompt-branch-face ((,class :inherit shadow)))
    `(eshell-git-prompt-directory-face ((,class :foreground ,cyan)))
    `(eshell-git-prompt-exit-fail-face ((,class :foreground ,red)))
    `(eshell-git-prompt-exit-success-face ((,class :foreground ,green)))
    `(eshell-git-prompt-modified-face ((,class :foreground ,yellow)))
    `(eshell-git-prompt-powerline-clean-face ((,class :background ,green-refine-bg)))
    `(eshell-git-prompt-powerline-dir-face ((,class :background ,blue-refine-bg)))
    `(eshell-git-prompt-powerline-not-clean-face ((,class :background ,magenta-refine-bg)))
    `(eshell-git-prompt-robyrussell-branch-face ((,class :foreground ,red)))
    `(eshell-git-prompt-robyrussell-git-dirty-face ((,class :foreground ,yellow)))
    `(eshell-git-prompt-robyrussell-git-face ((,class :foreground ,blue)))
;;;;; eshell-prompt-extras (epe)
    `(epe-dir-face ((,class :inherit modus-theme-bold :foreground ,blue)))
    `(epe-git-dir-face ((,class :foreground ,red-alt-other)))
    `(epe-git-face ((,class :foreground ,cyan-alt)))
    `(epe-pipeline-delimiter-face ((,class :foreground ,green-alt)))
    `(epe-pipeline-host-face ((,class :foreground ,blue)))
    `(epe-pipeline-time-face ((,class :foreground ,fg-special-warm)))
    `(epe-pipeline-user-face ((,class :foreground ,magenta)))
    `(epe-remote-face ((,class :inherit modus-theme-slant :foreground ,fg-alt)))
    `(epe-status-face ((,class :foreground ,magenta-alt-other)))
    `(epe-venv-face ((,class :inherit modus-theme-slant :foreground ,fg-alt)))
;;;;; eshell-syntax-highlighting
    `(eshell-syntax-highlighting-alias-face ((,class :foreground ,cyan)))
    `(eshell-syntax-highlighting-comment-face ((,class :inherit shadow)))
    `(eshell-syntax-highlighting-directory-face ((,class :foreground ,blue)))
    `(eshell-syntax-highlighting-envvar-face ((,class :foreground ,magenta-alt)))
    `(eshell-syntax-highlighting-invalid-face ((,class :foreground ,red)))
    `(eshell-syntax-highlighting-lisp-function-face ((,class :foreground ,magenta)))
    `(eshell-syntax-highlighting-shell-command-face ((,class :foreground ,cyan-alt-other)))
    `(eshell-syntax-highlighting-string-face ((,class :foreground ,blue-alt)))
;;;;; evil-mode
    `(evil-ex-commands ((,class :foreground ,magenta-alt-other)))
    `(evil-ex-info ((,class :foreground ,cyan-alt-other)))
    `(evil-ex-lazy-highlight ((,class :inherit modus-theme-refine-cyan)))
    `(evil-ex-search ((,class :inherit modus-theme-intense-green)))
    `(evil-ex-substitute-matches ((,class :inherit modus-theme-refine-yellow :underline t)))
    `(evil-ex-substitute-replacement ((,class :inherit (modus-theme-intense-green bold))))
;;;;; evil-goggles
    `(evil-goggles-change-face ((,class :inherit modus-theme-refine-yellow)))
    `(evil-goggles-commentary-face ((,class :inherit (modus-theme-subtle-neutral modus-theme-slant))))
    `(evil-goggles-default-face ((,class :inherit modus-theme-subtle-neutral)))
    `(evil-goggles-delete-face ((,class :inherit modus-theme-refine-red)))
    `(evil-goggles-fill-and-move-face ((,class :inherit evil-goggles-default-face)))
    `(evil-goggles-indent-face ((,class :inherit evil-goggles-default-face)))
    `(evil-goggles-join-face ((,class :inherit modus-theme-subtle-green)))
    `(evil-goggles-nerd-commenter-face ((,class :inherit evil-goggles-commentary-face)))
    `(evil-goggles-paste-face ((,class :inherit modus-theme-subtle-cyan)))
    `(evil-goggles-record-macro-face ((,class :inherit modus-theme-special-cold)))
    `(evil-goggles-replace-with-register-face ((,class :inherit modus-theme-refine-magenta)))
    `(evil-goggles-set-marker-face ((,class :inherit modus-theme-intense-magenta)))
    `(evil-goggles-shift-face ((,class :inherit evil-goggles-default-face)))
    `(evil-goggles-surround-face ((,class :inherit evil-goggles-default-face)))
    `(evil-goggles-yank-face ((,class :inherit modus-theme-subtle-blue)))
;;;;; evil-snipe
    `(evil-snipe-first-match-face ((,class :inherit (bold modus-theme-intense-blue))))
    `(evil-snipe-matches-face ((,class :inherit modus-theme-refine-magenta)))
;;;;; evil-visual-mark-mode
    `(evil-visual-mark-face ((,class :inherit modus-theme-intense-magenta)))
;;;;; eww
    `(eww-invalid-certificate ((,class :foreground ,red-active)))
    `(eww-valid-certificate ((,class :foreground ,green-active)))
    `(eww-form-checkbox ((,class :box (:line-width 1 :color ,fg-inactive :style released-button) :background ,bg-inactive :foreground ,fg-main)))
    `(eww-form-file ((,class :box (:line-width 1 :color ,fg-inactive :style released-button) :background ,bg-active :foreground ,fg-main)))
    `(eww-form-select ((,class :inherit eww-form-checkbox)))
    `(eww-form-submit ((,class :inherit eww-form-file)))
    `(eww-form-text ((,class :box (:line-width 1 :color ,fg-inactive :style none) :background ,bg-active :foreground ,fg-active)))
    `(eww-form-textarea ((,class :background ,bg-alt :foreground ,fg-main)))
;;;;; eyebrowse
    `(eyebrowse-mode-line-active ((,class :inherit bold :foreground ,blue-active)))
;;;;; fancy-dabbrev
    `(fancy-dabbrev-menu-face ((,class :background ,bg-alt :foreground ,fg-alt)))
    `(fancy-dabbrev-preview-face ((,class :inherit shadow :underline t)))
    `(fancy-dabbrev-selection-face ((,class :inherit (modus-theme-intense-cyan bold))))
;;;;; flycheck
    `(flycheck-error ((,class :inherit modus-theme-lang-error)))
    `(flycheck-error-list-checker-name ((,class :foreground ,magenta-active)))
    `(flycheck-error-list-column-number ((,class :foreground ,fg-special-cold)))
    `(flycheck-error-list-error ((,class :inherit modus-theme-bold :foreground ,red)))
    `(flycheck-error-list-filename ((,class :foreground ,blue)))
    `(flycheck-error-list-highlight ((,class :inherit modus-theme-hl-line)))
    `(flycheck-error-list-id ((,class :foreground ,magenta-alt-other)))
    `(flycheck-error-list-id-with-explainer ((,class :inherit flycheck-error-list-id :box t)))
    `(flycheck-error-list-info ((,class :foreground ,cyan)))
    `(flycheck-error-list-line-number ((,class :foreground ,fg-special-warm)))
    `(flycheck-error-list-warning ((,class :foreground ,yellow)))
    `(flycheck-fringe-error ((,class :inherit modus-theme-fringe-red)))
    `(flycheck-fringe-info ((,class :inherit modus-theme-fringe-cyan)))
    `(flycheck-fringe-warning ((,class :inherit modus-theme-fringe-yellow)))
    `(flycheck-info ((,class :inherit modus-theme-lang-note)))
    `(flycheck-verify-select-checker ((,class :box (:line-width 1 :color nil :style released-button))))
    `(flycheck-warning ((,class :inherit modus-theme-lang-warning)))
;;;;; flycheck-color-mode-line
    `(flycheck-color-mode-line-error-face ((,class :inherit flycheck-fringe-error)))
    `(flycheck-color-mode-line-info-face ((,class :inherit flycheck-fringe-info)))
    `(flycheck-color-mode-line-running-face ((,class :inherit italic :foreground ,fg-inactive)))
    `(flycheck-color-mode-line-info-face ((,class :inherit flycheck-fringe-warning)))
;;;;; flycheck-indicator
    `(flycheck-indicator-disabled ((,class :inherit modus-theme-slant :foreground ,fg-inactive)))
    `(flycheck-indicator-error ((,class :inherit modus-theme-bold :foreground ,red-active)))
    `(flycheck-indicator-info ((,class :inherit modus-theme-bold :foreground ,blue-active)))
    `(flycheck-indicator-running ((,class :inherit modus-theme-bold :foreground ,magenta-active)))
    `(flycheck-indicator-success ((,class :inherit modus-theme-bold :foreground ,green-active)))
    `(flycheck-indicator-warning ((,class :inherit modus-theme-bold :foreground ,yellow-active)))
;;;;; flycheck-posframe
    `(flycheck-posframe-background-face ((,class :background ,bg-alt)))
    `(flycheck-posframe-border-face ((,class :inherit shadow)))
    `(flycheck-posframe-error-face ((,class :inherit bold :foreground ,red)))
    `(flycheck-posframe-face ((,class :inherit modus-theme-slant :foreground ,fg-main)))
    `(flycheck-posframe-info-face ((,class :inherit bold :foreground ,cyan)))
    `(flycheck-posframe-warning-face ((,class :inherit bold :foreground ,yellow)))
;;;;; flymake
    `(flymake-error ((,class :inherit modus-theme-lang-error)))
    `(flymake-note ((,class :inherit modus-theme-lang-note)))
    `(flymake-warning ((,class :inherit modus-theme-lang-warning)))
;;;;; flyspell
    `(flyspell-duplicate ((,class :inherit modus-theme-lang-warning)))
    `(flyspell-incorrect ((,class :inherit modus-theme-lang-error)))
;;;;; flyspell-correct
    `(flyspell-correct-highlight-face ((,class :inherit modus-theme-refine-green)))
;;;;; flx
    `(flx-highlight-face ((,class ,@(modus-themes--extra-completions
                                     'modus-theme-subtle-magenta
                                     'modus-theme-intense-magenta
                                     'modus-theme-nuanced-magenta
                                     magenta-alt
                                     'bold))))
;;;;; freeze-it
    `(freeze-it-show ((,class :background ,bg-dim :foreground ,fg-special-warm)))
;;;;; frog-menu
    `(frog-menu-action-keybinding-face ((,class :foreground ,blue-alt-other)))
    `(frog-menu-actions-face ((,class :foreground ,magenta)))
    `(frog-menu-border ((,class :background ,bg-active)))
    `(frog-menu-candidates-face ((,class :foreground ,fg-main)))
    `(frog-menu-posframe-background-face ((,class :background ,bg-dim)))
    `(frog-menu-prompt-face ((,class :foreground ,cyan)))
;;;;; focus
    `(focus-unfocused ((,class :foreground ,fg-unfocused)))
;;;;; fold-this
    `(fold-this-overlay ((,class :inherit modus-theme-special-mild)))
;;;;; font-lock
    `(font-lock-builtin-face ((,class :inherit modus-theme-bold
                                      ,@(modus-themes--syntax-extra
                                         magenta-alt magenta-alt-faint blue-alt))))
    `(font-lock-comment-delimiter-face ((,class :inherit font-lock-comment-face)))
    `(font-lock-comment-face ((,class :inherit modus-theme-slant
                                      ,@(modus-themes--syntax-comment
                                         fg-alt fg-comment-yellow))))
    `(font-lock-constant-face ((,class ,@(modus-themes--syntax-extra
                                          blue-alt-other blue-alt-other-faint magenta-alt-other))))
    `(font-lock-doc-face ((,class :inherit modus-theme-slant
                                  ,@(modus-themes--syntax-docstring
                                     fg-docstring cyan-alt-other-faint
                                     green-alt-faint magenta-nuanced-fg))))
    `(font-lock-function-name-face ((,class ,@(modus-themes--syntax-extra
                                               magenta magenta-faint magenta-alt))))
    `(font-lock-keyword-face ((,class :inherit modus-theme-bold
                                      ,@(modus-themes--syntax-extra
                                         magenta-alt-other magenta-alt-other-faint cyan-alt-other))))
    `(font-lock-negation-char-face ((,class :inherit modus-theme-bold
                                            ,@(modus-themes--syntax-foreground
                                               yellow yellow-faint))))
    `(font-lock-preprocessor-face ((,class ,@(modus-themes--syntax-foreground
                                              red-alt-other red-alt-other-faint))))
    `(font-lock-regexp-grouping-backslash ((,class :inherit bold
                                                   ,@(modus-themes--syntax-string
                                                      fg-escape-char-backslash yellow-alt-faint
                                                      magenta-alt-other blue-alt))))
    `(font-lock-regexp-grouping-construct ((,class :inherit bold
                                                   ,@(modus-themes--syntax-string
                                                      fg-escape-char-construct red-alt-other-faint
                                                      red magenta-alt))))
    `(font-lock-string-face ((,class ,@(modus-themes--syntax-string
                                        blue-alt blue-alt-faint green green-alt))))
    `(font-lock-type-face ((,class :inherit modus-theme-bold
                                   ,@(modus-themes--syntax-extra
                                      cyan-alt-other magenta-alt-faint cyan-alt))))
    `(font-lock-variable-name-face ((,class ,@(modus-themes--syntax-extra
                                               cyan cyan-faint blue-alt-faint))))
    `(font-lock-warning-face ((,class :inherit modus-theme-bold
                                      ,@(modus-themes--syntax-foreground
                                         yellow-active yellow-alt-faint))))
;;;;; forge
    `(forge-post-author ((,class :inherit bold :foreground ,fg-main)))
    `(forge-post-date ((,class :foreground ,fg-special-cold)))
    `(forge-topic-closed ((,class :inherit shadow)))
    `(forge-topic-merged ((,class :inherit shadow)))
    `(forge-topic-open ((,class :foreground ,fg-special-mild)))
    `(forge-topic-unmerged ((,class :inherit modus-theme-slant :foreground ,magenta)))
    `(forge-topic-unread ((,class :inherit bold :foreground ,fg-main)))
;;;;; fountain-mode
    `(fountain-character ((,class :foreground ,blue-alt-other)))
    `(fountain-comment ((,class :inherit modus-theme-slant :foreground ,fg-alt)))
    `(fountain-dialog ((,class :foreground ,blue-alt)))
    `(fountain-metadata-key ((,class :foreground ,green-alt-other)))
    `(fountain-metadata-value ((,class :foreground ,blue)))
    `(fountain-non-printing ((,class :inherit shadow)))
    `(fountain-note ((,class :inherit modus-theme-slant :foreground ,yellow)))
    `(fountain-page-break ((,class :inherit bold :foreground ,red-alt)))
    `(fountain-page-number ((,class :inherit bold :foreground ,red-alt-other)))
    `(fountain-paren ((,class :foreground ,cyan)))
    `(fountain-scene-heading ((,class :inherit bold :foreground ,blue-nuanced-fg)))
    `(fountain-section-heading ((,class :inherit modus-theme-heading-1)))
    `(fountain-section-heading-1 ((,class :inherit modus-theme-heading-1)))
    `(fountain-section-heading-2 ((,class :inherit modus-theme-heading-2)))
    `(fountain-section-heading-3 ((,class :inherit modus-theme-heading-3)))
    `(fountain-section-heading-4 ((,class :inherit modus-theme-heading-4)))
    `(fountain-section-heading-5 ((,class :inherit modus-theme-heading-5)))
    `(fountain-synopsis ((,class :foreground ,cyan-alt)))
    `(fountain-trans ((,class :foreground ,yellow-alt-other)))
;;;;; geiser
    `(geiser-font-lock-autodoc-current-arg ((,class :inherit font-lock-function-name-face)))
    `(geiser-font-lock-autodoc-identifier ((,class :inherit font-lock-constant-face)))
    `(geiser-font-lock-doc-button ((,class :inherit button :foreground ,fg-docstring)))
    `(geiser-font-lock-doc-link ((,class :inherit button)))
    `(geiser-font-lock-error-link ((,class :inherit button :foreground ,red)))
    `(geiser-font-lock-image-button ((,class :inherit button :foreground ,green-alt)))
    `(geiser-font-lock-repl-input ((,class :inherit bold)))
    `(geiser-font-lock-repl-output ((,class :inherit font-lock-keyword-face)))
    `(geiser-font-lock-repl-prompt ((,class :inherit minibuffer-prompt)))
    `(geiser-font-lock-xref-header ((,class :inherit bold)))
    `(geiser-font-lock-xref-link ((,class :inherit button)))
;;;;; git-commit
    `(git-commit-comment-action ((,class :inherit font-lock-comment-face)))
    `(git-commit-comment-branch-local ((,class :inherit modus-theme-slant :foreground ,blue-alt)))
    `(git-commit-comment-branch-remote ((,class :inherit modus-theme-slant :foreground ,magenta-alt)))
    `(git-commit-comment-detached ((,class :inherit modus-theme-slant :foreground ,cyan-alt)))
    `(git-commit-comment-file ((,class :inherit modus-theme-slant
                                       ,@(modus-themes--syntax-comment
                                          fg-special-cold red-nuanced-fg))))
    `(git-commit-comment-heading ((,class :inherit (bold modus-theme-slant)
                                          ,@(modus-themes--syntax-comment
                                             fg-dim fg-special-warm))))
    `(git-commit-keyword ((,class :foreground ,magenta)))
    `(git-commit-known-pseudo-header ((,class :foreground ,cyan-alt-other)))
    `(git-commit-nonempty-second-line ((,class :inherit modus-theme-refine-yellow)))
    `(git-commit-overlong-summary ((,class :inherit modus-theme-refine-yellow)))
    `(git-commit-pseudo-header ((,class :foreground ,blue)))
    `(git-commit-summary ((,class :inherit bold :foreground ,cyan)))
;;;;; git-gutter
    `(git-gutter:added ((,class :inherit modus-theme-fringe-green)))
    `(git-gutter:deleted ((,class :inherit modus-theme-fringe-red)))
    `(git-gutter:modified ((,class :inherit modus-theme-fringe-yellow)))
    `(git-gutter:separator ((,class :inherit modus-theme-fringe-cyan)))
    `(git-gutter:unchanged ((,class :inherit modus-theme-fringe-magenta)))
;;;;; git-gutter-fr
    `(git-gutter-fr:added ((,class :inherit modus-theme-fringe-green)))
    `(git-gutter-fr:deleted ((,class :inherit modus-theme-fringe-red)))
    `(git-gutter-fr:modified ((,class :inherit modus-theme-fringe-yellow)))
;;;;; git-{gutter,fringe}+
    `(git-gutter+-added ((,class :inherit modus-theme-fringe-green)))
    `(git-gutter+-deleted ((,class :inherit modus-theme-fringe-red)))
    `(git-gutter+-modified ((,class :inherit modus-theme-fringe-yellow)))
    `(git-gutter+-separator ((,class :inherit modus-theme-fringe-cyan)))
    `(git-gutter+-unchanged ((,class :inherit modus-theme-fringe-magenta)))
    `(git-gutter-fr+-added ((,class :inherit modus-theme-fringe-green)))
    `(git-gutter-fr+-deleted ((,class :inherit modus-theme-fringe-red)))
    `(git-gutter-fr+-modified ((,class :inherit modus-theme-fringe-yellow)))
;;;;; git-lens
    `(git-lens-added ((,class :inherit bold :foreground ,green)))
    `(git-lens-deleted ((,class :inherit bold :foreground ,red)))
    `(git-lens-header ((,class :inherit bold :height 1.1 :foreground ,cyan)))
    `(git-lens-modified ((,class :inherit bold :foreground ,yellow)))
    `(git-lens-renamed ((,class :inherit bold :foreground ,magenta)))
;;;;; git-rebase
    `(git-rebase-comment-hash ((,class :inherit modus-theme-slant
                                       ,@(modus-themes--syntax-comment
                                          fg-special-cold red-nuanced-fg))))
    `(git-rebase-comment-heading  ((,class :inherit (bold modus-theme-slant)
                                           ,@(modus-themes--syntax-comment
                                              fg-dim fg-special-warm))))
    `(git-rebase-description ((,class :foreground ,fg-main)))
    `(git-rebase-hash ((,class :foreground ,cyan-alt-other)))
;;;;; git-timemachine
    `(git-timemachine-commit ((,class :inherit bold :foreground ,yellow-active)))
    `(git-timemachine-minibuffer-author-face ((,class :foreground ,fg-special-warm)))
    `(git-timemachine-minibuffer-detail-face ((,class :foreground ,red-alt)))
;;;;; git-walktree
    `(git-walktree-commit-face ((,class :foreground ,yellow)))
    `(git-walktree-symlink-face ((,class :inherit button)))
    `(git-walktree-tree-face ((,class :foreground ,magenta)))
;;;;; gnus
    `(gnus-button ((,class :inherit button)))
    `(gnus-cite-1 ((,class :foreground ,blue-alt)))
    `(gnus-cite-10 ((,class :foreground ,magenta-alt-other)))
    `(gnus-cite-11 ((,class :foreground ,yellow-alt-other)))
    `(gnus-cite-2 ((,class :foreground ,red-alt)))
    `(gnus-cite-3 ((,class :foreground ,green-alt)))
    `(gnus-cite-4 ((,class :foreground ,magenta-alt)))
    `(gnus-cite-5 ((,class :foreground ,yellow-alt)))
    `(gnus-cite-6 ((,class :foreground ,cyan-alt)))
    `(gnus-cite-7 ((,class :foreground ,blue-alt-other)))
    `(gnus-cite-8 ((,class :foreground ,red-alt-other)))
    `(gnus-cite-9 ((,class :foreground ,green-alt-other)))
    `(gnus-cite-attribution ((,class :inherit italic :foreground ,fg-main)))
    `(gnus-emphasis-bold ((,class :inherit bold)))
    `(gnus-emphasis-bold-italic ((,class :inherit bold-italic)))
    `(gnus-emphasis-highlight-words ((,class :inherit modus-theme-refine-yellow)))
    `(gnus-emphasis-italic ((,class :inherit italic)))
    `(gnus-emphasis-underline-bold ((,class :inherit gnus-emphasis-bold :underline t)))
    `(gnus-emphasis-underline-bold-italic ((,class :inherit gnus-emphasis-bold-italic :underline t)))
    `(gnus-emphasis-underline-italic ((,class :inherit gnus-emphasis-italic :underline t)))
    `(gnus-group-mail-1 ((,class :inherit bold :foreground ,magenta-alt)))
    `(gnus-group-mail-1-empty ((,class :foreground ,magenta-alt)))
    `(gnus-group-mail-2 ((,class :inherit bold :foreground ,magenta)))
    `(gnus-group-mail-2-empty ((,class :foreground ,magenta)))
    `(gnus-group-mail-3 ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(gnus-group-mail-3-empty ((,class :foreground ,magenta-alt-other)))
    `(gnus-group-mail-low ((,class :inherit bold :foreground ,magenta-nuanced-fg)))
    `(gnus-group-mail-low-empty ((,class :foreground ,magenta-nuanced-fg)))
    `(gnus-group-news-1 ((,class :inherit bold :foreground ,green)))
    `(gnus-group-news-1-empty ((,class :foreground ,green)))
    `(gnus-group-news-2 ((,class :inherit bold :foreground ,cyan)))
    `(gnus-group-news-2-empty ((,class :foreground ,cyan)))
    `(gnus-group-news-3 ((,class :inherit bold :foreground ,yellow-nuanced-fg)))
    `(gnus-group-news-3-empty ((,class :foreground ,yellow-nuanced-fg)))
    `(gnus-group-news-4 ((,class :inherit bold :foreground ,cyan-nuanced-fg)))
    `(gnus-group-news-4-empty ((,class :foreground ,cyan-nuanced-fg)))
    `(gnus-group-news-5 ((,class :inherit bold :foreground ,red-nuanced-fg)))
    `(gnus-group-news-5-empty ((,class :foreground ,red-nuanced-fg)))
    `(gnus-group-news-6 ((,class :inherit bold :foreground ,fg-alt)))
    `(gnus-group-news-6-empty ((,class :inherit shadow)))
    `(gnus-group-news-low ((,class :inherit bold :foreground ,green-nuanced-fg)))
    `(gnus-group-news-low-empty ((,class :foreground ,green-nuanced-fg)))
    `(gnus-header-content ((,class :foreground ,cyan)))
    `(gnus-header-from ((,class :inherit bold :foreground ,cyan-alt-other :underline nil)))
    `(gnus-header-name ((,class :foreground ,green)))
    `(gnus-header-newsgroups ((,class :inherit bold :foreground ,blue-alt)))
    `(gnus-header-subject ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(gnus-server-agent ((,class :inherit bold :foreground ,cyan)))
    `(gnus-server-closed ((,class :inherit bold :foreground ,magenta)))
    `(gnus-server-cloud ((,class :inherit bold :foreground ,cyan-alt)))
    `(gnus-server-cloud-host ((,class :inherit modus-theme-refine-cyan)))
    `(gnus-server-denied ((,class :inherit bold :foreground ,red)))
    `(gnus-server-offline ((,class :inherit bold :foreground ,yellow)))
    `(gnus-server-opened ((,class :inherit bold :foreground ,green)))
    `(gnus-signature ((,class :inherit italic :foreground ,fg-special-cold)))
    `(gnus-splash ((,class :inherit shadow)))
    `(gnus-summary-cancelled ((,class :inherit modus-theme-mark-alt)))
    `(gnus-summary-high-ancient ((,class :inherit bold :foreground ,fg-alt)))
    `(gnus-summary-high-read ((,class :inherit bold :foreground ,fg-special-cold)))
    `(gnus-summary-high-ticked ((,class :inherit bold :foreground ,red-alt-other)))
    `(gnus-summary-high-undownloaded ((,class :inherit bold :foreground ,yellow)))
    `(gnus-summary-high-unread ((,class :inherit bold :foreground ,fg-main)))
    `(gnus-summary-low-ancient ((,class :inherit italic :foreground ,fg-alt)))
    `(gnus-summary-low-read ((,class :inherit italic :foreground ,fg-alt)))
    `(gnus-summary-low-ticked ((,class :inherit italic :foreground ,red-refine-fg)))
    `(gnus-summary-low-undownloaded ((,class :inherit italic :foreground ,yellow-refine-fg)))
    `(gnus-summary-low-unread ((,class :inherit bold :foreground ,fg-special-cold)))
    `(gnus-summary-normal-ancient ((,class :foreground ,fg-special-calm)))
    `(gnus-summary-normal-read ((,class :inherit shadow)))
    `(gnus-summary-normal-ticked ((,class :foreground ,red-alt-other)))
    `(gnus-summary-normal-undownloaded ((,class :foreground ,yellow)))
    `(gnus-summary-normal-unread ((,class :foreground ,fg-main)))
    `(gnus-summary-selected ((,class :inherit modus-theme-subtle-blue)))
;;;;; golden-ratio-scroll-screen
    `(golden-ratio-scroll-highlight-line-face ((,class :background ,cyan-subtle-bg :foreground ,fg-main)))
;;;;; helm
    `(helm-M-x-key ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(helm-action ((,class :underline t)))
    `(helm-bookmark-addressbook ((,class :foreground ,green-alt)))
    `(helm-bookmark-directory ((,class :inherit bold :foreground ,blue)))
    `(helm-bookmark-file ((,class :foreground ,fg-main)))
    `(helm-bookmark-file-not-found ((,class :background ,bg-alt :foreground ,fg-alt)))
    `(helm-bookmark-gnus ((,class :foreground ,magenta)))
    `(helm-bookmark-info ((,class :foreground ,cyan-alt)))
    `(helm-bookmark-man ((,class :foreground ,yellow-alt)))
    `(helm-bookmark-w3m ((,class :foreground ,blue-alt)))
    `(helm-buffer-archive ((,class :inherit bold :foreground ,cyan)))
    `(helm-buffer-directory ((,class :inherit bold :foreground ,blue)))
    `(helm-buffer-file ((,class :foreground ,fg-main)))
    `(helm-buffer-modified ((,class :foreground ,yellow-alt)))
    `(helm-buffer-not-saved ((,class :foreground ,red-alt)))
    `(helm-buffer-process ((,class :foreground ,magenta)))
    `(helm-buffer-saved-out ((,class :inherit bold :background ,bg-alt :foreground ,red)))
    `(helm-buffer-size ((,class :inherit shadow)))
    `(helm-candidate-number ((,class :foreground ,cyan-active)))
    `(helm-candidate-number-suspended ((,class :foreground ,yellow-active)))
    `(helm-comint-prompts-buffer-name ((,class :foreground ,green-active)))
    `(helm-comint-prompts-promptidx ((,class :foreground ,cyan-active)))
    `(helm-delete-async-message ((,class :inherit bold :foreground ,magenta-active)))
    `(helm-eob-line ((,class :background ,bg-main :foreground ,fg-main)))
    `(helm-eshell-prompts-buffer-name ((,class :foreground ,green-active)))
    `(helm-eshell-prompts-promptidx ((,class :foreground ,cyan-active)))
    `(helm-etags-file ((,class :foreground ,fg-dim :underline t)))
    `(helm-ff-backup-file ((,class :inherit shadow)))
    `(helm-ff-denied ((,class ,@(modus-themes--extra-completions
                                 'modus-theme-subtle-red
                                 'modus-theme-intense-red
                                 'modus-theme-nuanced-red
                                 red))))
    `(helm-ff-directory ((,class :inherit helm-buffer-directory)))
    `(helm-ff-dirs ((,class :inherit bold :foreground ,blue-alt-other)))
    `(helm-ff-dotted-directory ((,class :inherit bold :background ,bg-alt :foreground ,fg-alt)))
    `(helm-ff-dotted-symlink-directory ((,class :inherit (button helm-ff-dotted-directory))))
    `(helm-ff-executable ((,class :foreground ,magenta-alt)))
    `(helm-ff-file ((,class :foreground ,fg-main)))
    `(helm-ff-file-extension ((,class :foreground ,fg-special-warm)))
    `(helm-ff-invalid-symlink ((,class :inherit button
                                       ,@(modus-themes--link-color
                                          red red-faint))))
    `(helm-ff-pipe ((,class ,@(modus-themes--extra-completions
                               'modus-theme-refine-magenta
                               'modus-theme-subtle-magenta
                               'modus-theme-nuanced-magenta
                               magenta))))
    `(helm-ff-prefix ((,class ,@(modus-themes--extra-completions
                                 'modus-theme-refine-yellow
                                 'modus-theme-subtle-yellow
                                 'modus-theme-nuanced-yellow
                                 yellow-alt-other))))
    `(helm-ff-socket ((,class :foreground ,red-alt-other)))
    `(helm-ff-suid ((,class ,@(modus-themes--extra-completions
                               'modus-theme-subtle-red
                               'modus-theme-refine-red
                               'modus-theme-nuanced-yellow
                               red-alt))))
    `(helm-ff-symlink ((,class :inherit button
                               ,@(modus-themes--link-color
                                  cyan cyan-faint))))
    `(helm-ff-truename ((,class :foreground ,blue-alt-other)))
    `(helm-fd-finish ((,class :foreground ,green-active)))
    `(helm-grep-cmd-line ((,class :foreground ,yellow-alt-other)))
    `(helm-grep-file ((,class :inherit bold :foreground ,fg-special-cold)))
    `(helm-grep-finish ((,class :foreground ,green-active)))
    `(helm-grep-lineno ((,class :foreground ,fg-special-warm)))
    `(helm-grep-match ((,class :inherit modus-theme-special-calm)))
    `(helm-header ((,class :inherit bold :foreground ,fg-special-cold)))
    `(helm-header-line-left-margin ((,class :inherit bold :foreground ,yellow-intense)))
    `(helm-history-deleted ((,class ,@(modus-themes--extra-completions
                                       'modus-theme-subtle-red
                                       'modus-theme-intense-red
                                       'modus-theme-nuanced-red
                                       red
                                       'bold))))
    `(helm-history-remote ((,class :foreground ,red-alt-other)))
    `(helm-lisp-completion-info ((,class :foreground ,fg-special-warm)))
    `(helm-lisp-show-completion ((,class ,@(modus-themes--extra-completions
                                            'modus-theme-subtle-yellow
                                            'modus-theme-refine-yellow
                                            'modus-theme-nuanced-yellow
                                            yellow
                                            'bold))))
    `(helm-locate-finish ((,class :foreground ,green-active)))
    `(helm-match ((,class ,@(modus-themes--extra-completions
                             'modus-theme-subtle-cyan
                             'modus-theme-refine-cyan
                             'modus-theme-nuanced-cyan
                             cyan
                             'bold))))
    `(helm-match-item ((,class ,@(modus-themes--extra-completions
                                  'modus-theme-subtle-neutral
                                  'modus-theme-subtle-cyan
                                  'modus-theme-nuanced-cyan
                                  cyan-alt-other))))
    `(helm-minibuffer-prompt ((,class :inherit minibuffer-prompt)))
    `(helm-moccur-buffer ((,class :inherit button
                                  ,@(modus-themes--link-color
                                     cyan-alt-other cyan-alt-other-faint))))
    `(helm-mode-prefix ((,class ,@(modus-themes--extra-completions
                                   'modus-theme-subtle-magenta
                                   'modus-theme-intense-magenta
                                   'modus-theme-nuanced-magenta
                                   magenta-alt
                                   'bold))))
    `(helm-non-file-buffer ((,class :inherit shadow)))
    `(helm-prefarg ((,class :foreground ,red-active)))
    `(helm-resume-need-update ((,class ,@(modus-themes--extra-completions
                                          'modus-theme-subtle-magenta
                                          'modus-theme-refine-magenta
                                          'modus-theme-nuanced-magenta
                                          magenta-alt-other))))
    `(helm-selection ((,class ,@(modus-themes--extra-completions
                                 'modus-theme-subtle-blue
                                 'modus-theme-refine-blue
                                 'modus-theme-special-cold
                                 nil
                                 'bold))))
    `(helm-selection-line ((,class :inherit modus-theme-special-cold)))
    `(helm-separator ((,class :foreground ,fg-special-mild)))
    `(helm-time-zone-current ((,class :foreground ,green)))
    `(helm-time-zone-home ((,class :foreground ,magenta)))
    `(helm-source-header ((,class :inherit bold :foreground ,red-alt
                                  ,@(modus-themes--scale modus-themes-scale-4))))
    `(helm-top-columns ((,class :inherit helm-header)))
    `(helm-ucs-char ((,class :foreground ,yellow-alt-other)))
    `(helm-visible-mark ((,class :inherit modus-theme-subtle-cyan)))
;;;;; helm-ls-git
    `(helm-ls-git-added-copied-face ((,class :foreground ,green-intense)))
    `(helm-ls-git-added-modified-face ((,class :foreground ,yellow-intense)))
    `(helm-ls-git-conflict-face ((,class :inherit bold :foreground ,red-intense)))
    `(helm-ls-git-deleted-and-staged-face ((,class :foreground ,red-nuanced-fg)))
    `(helm-ls-git-deleted-not-staged-face ((,class :foreground ,red)))
    `(helm-ls-git-modified-and-staged-face ((,class :foreground ,yellow-nuanced-fg)))
    `(helm-ls-git-modified-not-staged-face ((,class :foreground ,yellow)))
    `(helm-ls-git-renamed-modified-face ((,class :foreground ,magenta)))
    `(helm-ls-git-untracked-face ((,class :foreground ,fg-special-cold)))
;;;;; helm-switch-shell
    `(helm-switch-shell-new-shell-face ((,class ,@(modus-themes--extra-completions
                                                   'modus-theme-subtle-magenta
                                                   'modus-theme-refine-magenta
                                                   'modus-theme-nuanced-magenta
                                                   magenta-alt-other
                                                   'bold))))
;;;;; helm-xref
    `(helm-xref-file-name ((,class :inherit bold :foreground ,fg-special-cold)))
    `(helm-xref-file-name ((,class :foreground ,fg-special-warm)))
;;;;; helpful
    `(helpful-heading ((,class :inherit modus-theme-heading-1)))
;;;;; highlight region or ad-hoc regexp
    `(hi-black-b ((,class :background ,fg-main :foreground ,bg-main)))
    `(hi-blue ((,class :background ,bg-alt :foreground ,blue :underline t)))
    `(hi-blue-b ((,class :inherit modus-theme-intense-blue)))
    `(hi-green ((,class :background ,bg-alt :foreground ,green :underline t)))
    `(hi-green-b ((,class :inherit modus-theme-intense-green)))
    `(hi-pink ((,class :background ,bg-alt :foreground ,magenta :underline t)))
    `(hi-red-b ((,class :inherit modus-theme-intense-red)))
    `(hi-yellow ((,class :background ,bg-alt :foreground ,yellow :underline t)))
    `(highlight ((,class :inherit modus-theme-subtle-blue)))
    `(highlight-changes ((,class :foreground ,yellow-alt-other)))
    `(highlight-changes-delete ((,class :foreground ,red-alt-other :underline t)))
    `(hl-line ((,class :inherit modus-theme-hl-line)))
;;;;; highlight-blocks
    `(highlight-blocks-depth-1-face ((,class :background ,bg-dim :foreground ,fg-main)))
    `(highlight-blocks-depth-2-face ((,class :background ,bg-alt :foreground ,fg-main)))
    `(highlight-blocks-depth-3-face ((,class :background ,bg-special-cold :foreground ,fg-main)))
    `(highlight-blocks-depth-4-face ((,class :background ,bg-special-calm :foreground ,fg-main)))
    `(highlight-blocks-depth-5-face ((,class :background ,bg-special-warm :foreground ,fg-main)))
    `(highlight-blocks-depth-6-face ((,class :background ,bg-special-mild :foreground ,fg-main)))
    `(highlight-blocks-depth-7-face ((,class :background ,bg-inactive :foreground ,fg-main)))
    `(highlight-blocks-depth-8-face ((,class :background ,bg-active :foreground ,fg-main)))
    `(highlight-blocks-depth-9-face ((,class :background ,cyan-subtle-bg :foreground ,fg-main)))
;;;;; highlight-defined
    `(highlight-defined-builtin-function-name-face ((,class :foreground ,magenta)))
    `(highlight-defined-face-name-face ((,class :foreground ,fg-main)))
    `(highlight-defined-function-name-face ((,class :foreground ,magenta)))
    `(highlight-defined-macro-name-face ((,class :foreground ,magenta-alt)))
    `(highlight-defined-special-form-name-face ((,class :foreground ,magenta-alt-other)))
    `(highlight-defined-variable-name-face ((,class :foreground ,cyan)))
;;;;; highlight-escape-sequences (`hes-mode')
    `(hes-escape-backslash-face ((,class :inherit bold :foreground ,fg-escape-char-construct)))
    `(hes-escape-sequence-face ((,class :inherit bold :foreground ,fg-escape-char-backslash)))
;;;;; highlight-indentation
    `(highlight-indentation-face ((,class :inherit modus-theme-hl-line)))
    `(highlight-indentation-current-column-face ((,class :background ,bg-active)))
;;;;; highlight-numbers
    `(highlight-numbers-number ((,class :foreground ,blue-alt-other)))
;;;;; highlight-symbol
    `(highlight-symbol-face ((,class :inherit modus-theme-special-mild)))
;;;;; highlight-thing
    `(highlight-thing ((,class :background ,bg-alt :foreground ,cyan)))
;;;;; hl-defined
    `(hdefd-functions ((,class :foreground ,blue)))
    `(hdefd-undefined ((,class :foreground ,red-alt)))
    `(hdefd-variables ((,class :foreground ,cyan-alt)))
;;;;; hl-fill-column
    `(hl-fill-column-face ((,class :background ,bg-active :foreground ,fg-active)))
;;;;; hl-todo
    `(hl-todo ((,class :inherit (bold modus-theme-slant) :foreground ,red-alt-other)))
;;;;; hydra
    `(hydra-face-amaranth ((,class :inherit bold :foreground ,yellow)))
    `(hydra-face-blue ((,class :inherit bold :foreground ,blue-alt)))
    `(hydra-face-pink ((,class :inherit bold :foreground ,magenta-alt)))
    `(hydra-face-red ((,class :inherit bold :foreground ,red)))
    `(hydra-face-teal ((,class :inherit bold :foreground ,cyan)))
;;;;; hyperlist
    `(hyperlist-condition ((,class :foreground ,green)))
    `(hyperlist-hashtag ((,class :foreground ,yellow)))
    `(hyperlist-operator ((,class :foreground ,blue-alt)))
    `(hyperlist-paren ((,class :foreground ,cyan-alt-other)))
    `(hyperlist-quote ((,class :foreground ,cyan-alt)))
    `(hyperlist-ref ((,class :foreground ,magenta-alt-other)))
    `(hyperlist-stars ((,class :inherit shadow)))
    `(hyperlist-tag ((,class :foreground ,red)))
    `(hyperlist-toplevel ((,class :inherit bold :foreground ,fg-main)))
;;;;; icomplete
    `(icomplete-first-match ((,class :inherit bold
                                     ,@(modus-themes--standard-completions
                                        magenta bg-alt
                                        bg-active fg-main))))
;;;;; icomplete-vertical
    `(icomplete-vertical-separator ((,class :inherit shadow)))
;;;;; ido-mode
    `(ido-first-match ((,class :inherit bold
                               ,@(modus-themes--standard-completions
                                  magenta bg-alt
                                  bg-active fg-main))))
    `(ido-incomplete-regexp ((,class :inherit error)))
    `(ido-indicator ((,class :inherit modus-theme-subtle-yellow)))
    `(ido-only-match ((,class :inherit bold
                              ,@(modus-themes--standard-completions
                                 green green-nuanced-bg
                                 green-intense-bg fg-main))))
    `(ido-subdir ((,class :foreground ,blue)))
    `(ido-virtual ((,class :foreground ,fg-special-warm)))
;;;;; iedit
    `(iedit-occurrence ((,class :inherit modus-theme-refine-blue)))
    `(iedit-read-only-occurrence ((,class :inherit modus-theme-intense-yellow)))
;;;;; iflipb
    `(iflipb-current-buffer-face ((,class :inherit bold :foreground ,cyan-alt)))
    `(iflipb-other-buffer-face ((,class :inherit shadow)))
;;;;; imenu-list
    `(imenu-list-entry-face-0 ((,class :foreground ,cyan)))
    `(imenu-list-entry-face-1 ((,class :foreground ,blue)))
    `(imenu-list-entry-face-2 ((,class :foreground ,cyan-alt-other)))
    `(imenu-list-entry-face-3 ((,class :foreground ,blue-alt)))
    `(imenu-list-entry-subalist-face-0 ((,class :inherit bold :foreground ,magenta-alt-other :underline t)))
    `(imenu-list-entry-subalist-face-1 ((,class :inherit bold :foreground ,magenta :underline t)))
    `(imenu-list-entry-subalist-face-2 ((,class :inherit bold :foreground ,green-alt-other :underline t)))
    `(imenu-list-entry-subalist-face-3 ((,class :inherit bold :foreground ,red-alt-other :underline t)))
;;;;; indium
    `(indium-breakpoint-face ((,class :foreground ,red-active)))
    `(indium-frame-url-face ((,class :inherit button :foreground ,fg-alt)))
    `(indium-keyword-face ((,class :foreground ,magenta-alt-other)))
    `(indium-litable-face ((,class :inherit modus-theme-slant :foreground ,fg-special-warm)))
    `(indium-repl-error-face ((,class :inherit bold :foreground ,red)))
    `(indium-repl-prompt-face ((,class :foreground ,cyan-alt-other)))
    `(indium-repl-stdout-face ((,class :foreground ,fg-main)))
;;;;; info
    `(Info-quoted ((,class ,@(modus-themes--mixed-fonts)
                           :foreground ,magenta))) ; the capitalization is canonical
    `(info-header-node ((,class :inherit bold :foreground ,fg-alt)))
    `(info-header-xref ((,class :foreground ,blue-active)))
    `(info-index-match ((,class :inherit match)))
    `(info-menu-header ((,class :inherit modus-theme-heading-3)))
    `(info-menu-star ((,class :foreground ,red)))
    `(info-node ((,class :inherit bold)))
    `(info-title-1 ((,class :inherit modus-theme-heading-1)))
    `(info-title-2 ((,class :inherit modus-theme-heading-2)))
    `(info-title-3 ((,class :inherit modus-theme-heading-3)))
    `(info-title-4 ((,class :inherit modus-theme-heading-4)))
;;;;; info-colors
    `(info-colors-lisp-code-block ((,class :inherit fixed-pitch)))
    `(info-colors-ref-item-command ((,class :foreground ,magenta)))
    `(info-colors-ref-item-constant ((,class :foreground ,blue-alt-other)))
    `(info-colors-ref-item-function ((,class :foreground ,magenta)))
    `(info-colors-ref-item-macro ((,class :inherit modus-theme-bold :foreground ,magenta-alt-other)))
    `(info-colors-ref-item-other ((,class :foreground ,cyan)))
    `(info-colors-ref-item-special-form ((,class :inherit modus-theme-bold :foreground ,magenta-alt-other)))
    `(info-colors-ref-item-syntax-class ((,class :foreground ,magenta)))
    `(info-colors-ref-item-type ((,class :foreground ,magenta-alt)))
    `(info-colors-ref-item-user-option ((,class :foreground ,cyan)))
    `(info-colors-ref-item-variable ((,class :foreground ,cyan)))
;;;;; interaction-log
    `(ilog-buffer-face ((,class :foreground ,magenta-alt-other)))
    `(ilog-change-face ((,class :foreground ,magenta-alt)))
    `(ilog-echo-face ((,class :foreground ,yellow-alt-other)))
    `(ilog-load-face ((,class :foreground ,green)))
    `(ilog-message-face ((,class :inherit shadow)))
    `(ilog-non-change-face ((,class :foreground ,blue)))
;;;;; ioccur
    `(ioccur-cursor ((,class :foreground ,fg-main)))
    `(ioccur-invalid-regexp ((,class :foreground ,red)))
    `(ioccur-match-face ((,class :inherit modus-theme-special-calm)))
    `(ioccur-match-overlay-face ((,class :inherit modus-theme-special-cold :extend t)))
    `(ioccur-num-line-face ((,class :foreground ,fg-special-warm)))
    `(ioccur-overlay-face ((,class :inherit modus-theme-refine-blue :extend t)))
    `(ioccur-regexp-face ((,class :inherit (modus-theme-intense-magenta bold))))
    `(ioccur-title-face ((,class :inherit bold :foreground ,red-alt
                                 ,@(modus-themes--scale modus-themes-scale-4))))
;;;;; isearch, occur, and the like
    `(isearch ((,class :inherit (modus-theme-intense-green bold))))
    `(isearch-fail ((,class :inherit modus-theme-refine-red)))
    `(isearch-group-1 ((,class :inherit modus-theme-intense-blue)))
    `(isearch-group-2 ((,class :inherit modus-theme-intense-magenta)))
    `(lazy-highlight ((,class :inherit modus-theme-refine-cyan)))
    `(match ((,class :inherit modus-theme-special-calm)))
    `(query-replace ((,class :inherit (modus-theme-intense-yellow bold))))
;;;;; ivy
    `(ivy-action ((,class :inherit bold :foreground ,red-alt)))
    `(ivy-completions-annotations ((,class :inherit completions-annotations)))
    `(ivy-confirm-face ((,class :foreground ,cyan)))
    `(ivy-current-match ((,class ,@(modus-themes--extra-completions
                                    'modus-theme-refine-cyan
                                    'modus-theme-intense-cyan
                                    'modus-theme-special-cold
                                    nil
                                    'bold))))
    `(ivy-cursor ((,class :background ,fg-main :foreground ,bg-main)))
    `(ivy-grep-info ((,class :foreground ,cyan-alt)))
    `(ivy-grep-line-number ((,class :foreground ,fg-special-warm)))
    `(ivy-highlight-face ((,class :foreground ,magenta)))
    `(ivy-match-required-face ((,class :inherit error)))
    `(ivy-minibuffer-match-face-1 ((,class ,@(modus-themes--extra-completions
                                              'modus-theme-subtle-neutral
                                              'modus-theme-intense-neutral
                                              'modus-theme-nuanced-cyan
                                              fg-alt))))
    `(ivy-minibuffer-match-face-2 ((,class ,@(modus-themes--extra-completions
                                              'modus-theme-subtle-green
                                              'modus-theme-refine-green
                                              'modus-theme-nuanced-green
                                              green-alt-other
                                              'bold))))
    `(ivy-minibuffer-match-face-3 ((,class ,@(modus-themes--extra-completions
                                              'modus-theme-subtle-blue
                                              'modus-theme-refine-blue
                                              'modus-theme-nuanced-blue
                                              blue-alt-other
                                              'bold))))
    `(ivy-minibuffer-match-face-4 ((,class ,@(modus-themes--extra-completions
                                              'modus-theme-subtle-magenta
                                              'modus-theme-refine-magenta
                                              'modus-theme-nuanced-magenta
                                              magenta-alt-other
                                              'bold))))
    `(ivy-minibuffer-match-highlight ((,class ,@(modus-themes--extra-completions
                                                 'modus-theme-subtle-cyan
                                                 'modus-theme-intense-cyan
                                                 'modus-theme-nuanced-cyan
                                                 cyan-alt-other
                                                 'bold))))
    `(ivy-modified-buffer ((,class :inherit modus-theme-slant :foreground ,yellow)))
    `(ivy-modified-outside-buffer ((,class :inherit modus-theme-slant :foreground ,yellow-alt)))
    `(ivy-org ((,class :foreground ,cyan-alt-other)))
    `(ivy-prompt-match ((,class :inherit ivy-current-match)))
    `(ivy-remote ((,class :foreground ,magenta)))
    `(ivy-separator ((,class :inherit shadow)))
    `(ivy-subdir ((,class :foreground ,blue-alt-other)))
    `(ivy-virtual ((,class :foreground ,magenta-alt-other)))
    `(ivy-yanked-word ((,class ,@(modus-themes--extra-completions
                                  'modus-theme-subtle-blue
                                  'modus-theme-refine-blue
                                  'modus-theme-nuanced-blue
                                  blue-alt))))
;;;;; ivy-posframe
    `(ivy-posframe ((,class :background ,bg-dim :foreground ,fg-main)))
    `(ivy-posframe-border ((,class :background ,fg-window-divider-inner)))
    `(ivy-posframe-cursor ((,class :background ,fg-main :foreground ,bg-main)))
;;;;; jira (org-jira)
    `(jiralib-comment-face ((,class :background ,bg-alt)))
    `(jiralib-comment-header-face ((,class :inherit bold)))
    `(jiralib-issue-info-face ((,class :inherit modus-theme-special-warm)))
    `(jiralib-issue-info-header-face ((,class :inherit (modus-theme-special-warm bold))))
    `(jiralib-issue-summary-face ((,class :inherit bold)))
    `(jiralib-link-filter-face ((,class :underline t)))
    `(jiralib-link-issue-face ((,class :underline t)))
    `(jiralib-link-project-face ((,class :underline t)))
;;;;; journalctl-mode
    `(journalctl-error-face ((,class :inherit bold :foreground ,red)))
    `(journalctl-finished-face ((,class :inherit bold :foreground ,green)))
    `(journalctl-host-face ((,class :foreground ,blue)))
    `(journalctl-process-face ((,class :foreground ,cyan-alt-other)))
    `(journalctl-starting-face ((,class :foreground ,green)))
    `(journalctl-timestamp-face ((,class :foreground ,fg-special-cold)))
    `(journalctl-warning-face ((,class :inherit bold :foreground ,yellow)))
;;;;; js2-mode
    `(js2-error ((,class :foreground ,red)))
    `(js2-external-variable ((,class :foreground ,cyan-alt-other)))
    `(js2-function-call ((,class :foreground ,magenta)))
    `(js2-function-param ((,class :foreground ,blue)))
    `(js2-instance-member ((,class :foreground ,magenta-alt-other)))
    `(js2-jsdoc-html-tag-delimiter ((,class :foreground ,fg-main)))
    `(js2-jsdoc-html-tag-name ((,class :foreground ,cyan)))
    `(js2-jsdoc-tag ((,class :foreground ,fg-special-calm)))
    `(js2-jsdoc-type ((,class :foreground ,fg-special-cold)))
    `(js2-jsdoc-value ((,class :foreground ,fg-special-warm)))
    `(js2-object-property ((,class :foreground ,fg-main)))
    `(js2-object-property-access ((,class :foreground ,fg-main)))
    `(js2-private-function-call ((,class :foreground ,green-alt-other)))
    `(js2-private-member ((,class :foreground ,fg-special-mild)))
    `(js2-warning ((,class :foreground ,yellow-alt :underline t)))
;;;;; julia
    `(julia-macro-face ((,class :inherit modus-theme-bold :foreground ,magenta)))
    `(julia-quoted-symbol-face ((,class :foreground ,blue-alt-other)))
;;;;; jupyter
    `(jupyter-eval-overlay ((,class :inherit bold :foreground ,blue)))
    `(jupyter-repl-input-prompt ((,class :foreground ,cyan-alt-other)))
    `(jupyter-repl-output-prompt ((,class :foreground ,magenta-alt-other)))
    `(jupyter-repl-traceback ((,class :inherit modus-theme-intense-red)))
;;;;; kaocha-runner
    `(kaocha-runner-error-face ((,class :foreground ,red)))
    `(kaocha-runner-success-face ((,class :foreground ,green)))
    `(kaocha-runner-warning-face ((,class :foreground ,yellow)))
;;;;; keycast
    `(keycast-command ((,class :inherit bold :foreground ,blue-active)))
    `(keycast-key ((,class ,@(modus-themes--mode-line-attrs
                              bg-main blue-active
                              bg-main blue-active
                              blue-active blue-intense
                              'alt-style -3))))
;;;;; line numbers (display-line-numbers-mode and global variant)
    `(line-number ((,class :inherit default :background ,bg-dim :foreground ,fg-alt)))
    `(line-number-current-line ((,class :inherit default :background ,bg-active :foreground ,fg-main)))
    `(line-number-major-tick ((,class :inherit (bold default)
                                      :background ,yellow-nuanced-bg
                                      :foreground ,yellow-nuanced-fg)))
    `(line-number-minor-tick ((,class :inherit (bold default)
                                      :background ,bg-inactive
                                      :foreground ,fg-inactive)))
;;;;; lsp-mode
    `(lsp-face-highlight-read ((,class :inherit modus-theme-subtle-blue :underline t)))
    `(lsp-face-highlight-textual ((,class :inherit modus-theme-subtle-blue)))
    `(lsp-face-highlight-write ((,class :inherit (modus-theme-refine-blue bold))))
    `(lsp-face-semhl-constant ((,class :foreground ,blue-alt-other)))
    `(lsp-face-semhl-deprecated
      ((,(append '((supports :underline (:style wave))) class)
        :foreground ,yellow :underline (:style wave))
       (,class :foreground ,yellow :underline t)))
    `(lsp-face-semhl-enummember ((,class :foreground ,blue-alt-other)))
    `(lsp-face-semhl-field ((,class :foreground ,cyan-alt)))
    `(lsp-face-semhl-field-static ((,class :inherit modus-theme-slant :foreground ,cyan-alt)))
    `(lsp-face-semhl-function ((,class :foreground ,magenta)))
    `(lsp-face-semhl-method ((,class :foreground ,magenta)))
    `(lsp-face-semhl-namespace ((,class :inherit modus-theme-bold :foreground ,magenta-alt)))
    `(lsp-face-semhl-preprocessor ((,class :foreground ,red-alt-other)))
    `(lsp-face-semhl-static-method ((,class :inherit modus-theme-slant :foreground ,magenta)))
    `(lsp-face-semhl-type-class ((,class :foreground ,magenta-alt)))
    `(lsp-face-semhl-type-enum ((,class :foreground ,magenta-alt)))
    `(lsp-face-semhl-type-primitive ((,class :inherit modus-theme-slant :foreground ,magenta-alt)))
    `(lsp-face-semhl-type-template ((,class :inherit modus-theme-slant :foreground ,magenta-alt)))
    `(lsp-face-semhl-type-typedef ((,class :inherit modus-theme-slant :foreground ,magenta-alt)))
    `(lsp-face-semhl-variable ((,class :foreground ,cyan)))
    `(lsp-face-semhl-variable-local ((,class :foreground ,cyan)))
    `(lsp-face-semhl-variable-parameter ((,class :foreground ,cyan-alt-other)))
    `(lsp-lens-face ((,class :height 0.8 :foreground ,fg-alt)))
    `(lsp-lens-mouse-face ((,class :height 0.8 :foreground ,blue-alt-other :underline t)))
    `(lsp-ui-doc-background ((,class :background ,bg-alt)))
    `(lsp-ui-doc-header ((,class :background ,bg-header :foreground ,fg-header)))
    `(lsp-ui-doc-url ((,class :inherit button)))
    `(lsp-ui-peek-filename ((,class :foreground ,fg-special-warm)))
    `(lsp-ui-peek-footer ((,class :background ,bg-header :foreground ,fg-header)))
    `(lsp-ui-peek-header ((,class :background ,bg-header :foreground ,fg-header)))
    `(lsp-ui-peek-highlight ((,class :inherit modus-theme-subtle-blue)))
    `(lsp-ui-peek-line-number ((,class :inherit shadow)))
    `(lsp-ui-peek-list ((,class :background ,bg-dim)))
    `(lsp-ui-peek-peek ((,class :background ,bg-alt)))
    `(lsp-ui-peek-selection ((,class :inherit modus-theme-subtle-cyan)))
    `(lsp-ui-sideline-code-action ((,class :foreground ,yellow)))
    `(lsp-ui-sideline-current-symbol ((,class :inherit bold :height 0.99 :box (:line-width -1 :style nil) :foreground ,fg-main)))
    `(lsp-ui-sideline-symbol ((,class :inherit bold :height 0.99 :box (:line-width -1 :style nil) :foreground ,fg-alt)))
    `(lsp-ui-sideline-symbol-info ((,class :inherit italic :height 0.99)))
;;;;; macrostep
    `(macrostep-compiler-macro-face ((,class :inherit italic)))
    `(macrostep-expansion-highlight-face ((,class :background ,blue-nuanced-bg)))
    `(macrostep-gensym-1 ((,class :inherit bold :foreground ,blue :box t)))
    `(macrostep-gensym-2 ((,class :inherit bold :foreground ,green :box t)))
    `(macrostep-gensym-3 ((,class :inherit bold :foreground ,yellow :box t)))
    `(macrostep-gensym-4 ((,class :inherit bold :foreground ,red :box t)))
    `(macrostep-gensym-5 ((,class :inherit bold :foreground ,magenta :box t)))
    `(macrostep-macro-face ((,class :inherit button :foreground ,green-alt)))
;;;;; magit
    `(magit-bisect-bad ((,class :foreground ,red-alt-other)))
    `(magit-bisect-good ((,class :foreground ,green-alt-other)))
    `(magit-bisect-skip ((,class :foreground ,yellow-alt-other)))
    `(magit-blame-date ((,class :foreground ,blue)))
    `(magit-blame-dimmed ((,class :inherit shadow)))
    `(magit-blame-hash ((,class :foreground ,fg-special-warm)))
    `(magit-blame-heading ((,class :background ,bg-alt)))
    `(magit-blame-highlight ((,class :inherit modus-theme-nuanced-cyan)))
    `(magit-blame-margin ((,class :inherit magit-blame-highlight)))
    `(magit-blame-name ((,class :foreground ,magenta-alt-other)))
    `(magit-blame-summary ((,class :foreground ,cyan-alt-other)))
    `(magit-branch-current ((,class :foreground ,blue-alt-other :box t)))
    `(magit-branch-local ((,class :foreground ,blue-alt)))
    `(magit-branch-remote ((,class :foreground ,magenta-alt)))
    `(magit-branch-remote-head ((,class :foreground ,magenta-alt-other :box t)))
    `(magit-branch-upstream ((,class :inherit italic)))
    `(magit-cherry-equivalent ((,class :background ,bg-main :foreground ,magenta-intense)))
    `(magit-cherry-unmatched ((,class :background ,bg-main :foreground ,cyan-intense)))
    ;; NOTE: here we break from the pattern of inheriting from the
    ;; modus-theme-diff-* faces, though only for the standard actions,
    ;; not the highlighted ones.  This is because Magit's interaction
    ;; model relies on highlighting the current diff hunk.
    `(magit-diff-added ((,class ,@(modus-themes--diff
                                   bg-main green
                                   bg-diff-added fg-diff-added
                                   green-nuanced-bg fg-diff-added))))
    `(magit-diff-added-highlight ((,class :inherit modus-theme-diff-focus-added)))
    `(magit-diff-base ((,class ,@(modus-themes--diff
                                  bg-main yellow
                                  bg-diff-changed fg-diff-changed
                                  yellow-nuanced-bg fg-diff-changed))))
    `(magit-diff-base-highlight ((,class :inherit modus-theme-diff-focus-changed)))
    `(magit-diff-context ((,class :foreground ,fg-unfocused)))
    `(magit-diff-context-highlight ((,class ,@(modus-themes--diff
                                               bg-dim fg-dim
                                               bg-inactive fg-inactive
                                               bg-dim fg-alt))))
    `(magit-diff-file-heading ((,class :inherit bold :foreground ,fg-special-cold)))
    `(magit-diff-file-heading-highlight ((,class :inherit (modus-theme-special-cold bold))))
    `(magit-diff-file-heading-selection ((,class :inherit modus-theme-refine-cyan)))
    ;; NOTE: here we break from the pattern of inheriting from the
    ;; modus-theme-diff-* faces.
    `(magit-diff-hunk-heading ((,class :inherit bold :background ,bg-active
                                       :foreground ,fg-inactive)))
    `(magit-diff-hunk-heading-highlight ((,class :inherit bold :background ,bg-diff-heading
                                                 :foreground ,fg-diff-heading)))
    `(magit-diff-hunk-heading-selection ((,class :inherit modus-theme-refine-blue)))
    `(magit-diff-hunk-region ((,class :inherit bold)))
    `(magit-diff-lines-boundary ((,class :background ,fg-main)))
    `(magit-diff-lines-heading ((,class :inherit modus-theme-refine-magenta)))
    `(magit-diff-removed ((,class ,@(modus-themes--diff
                                     bg-main red
                                     bg-diff-removed fg-diff-removed
                                     red-nuanced-bg fg-diff-removed))))
    `(magit-diff-removed-highlight ((,class :inherit modus-theme-diff-focus-removed)))
    `(magit-diffstat-added ((,class :foreground ,green)))
    `(magit-diffstat-removed ((,class :foreground ,red)))
    `(magit-dimmed ((,class :foreground ,fg-unfocused)))
    `(magit-filename ((,class :foreground ,fg-special-cold)))
    `(magit-hash ((,class :inherit shadow)))
    `(magit-head ((,class :inherit magit-branch-local)))
    `(magit-header-line ((,class :inherit bold :foreground ,magenta-active)))
    `(magit-header-line-key ((,class :inherit bold :foreground ,blue-active)))
    `(magit-header-line-log-select ((,class :inherit bold :foreground ,fg-main)))
    `(magit-keyword ((,class :foreground ,magenta)))
    `(magit-keyword-squash ((,class :inherit bold :foreground ,yellow-alt-other)))
    `(magit-log-author ((,class :foreground ,cyan)))
    `(magit-log-date ((,class :inherit shadow)))
    `(magit-log-graph ((,class :foreground ,fg-dim)))
    `(magit-mode-line-process ((,class :inherit bold :foreground ,blue-active)))
    `(magit-mode-line-process-error ((,class :inherit bold :foreground ,red-active)))
    `(magit-process-ng ((,class :inherit error)))
    `(magit-process-ok ((,class :inherit success)))
    `(magit-reflog-amend ((,class :background ,bg-main :foreground ,magenta-intense)))
    `(magit-reflog-checkout ((,class :background ,bg-main :foreground ,blue-intense)))
    `(magit-reflog-cherry-pick ((,class :background ,bg-main :foreground ,green-intense)))
    `(magit-reflog-commit ((,class :background ,bg-main :foreground ,green-intense)))
    `(magit-reflog-merge ((,class :background ,bg-main :foreground ,green-intense)))
    `(magit-reflog-other ((,class :background ,bg-main :foreground ,cyan-intense)))
    `(magit-reflog-rebase ((,class :background ,bg-main :foreground ,magenta-intense)))
    `(magit-reflog-remote ((,class :background ,bg-main :foreground ,cyan-intense)))
    `(magit-reflog-reset ((,class :background ,bg-main :foreground ,red-intense)))
    `(magit-refname ((,class :inherit shadow)))
    `(magit-refname-pullreq ((,class :inherit shadow)))
    `(magit-refname-stash ((,class :inherit shadow)))
    `(magit-refname-wip ((,class :inherit shadow)))
    `(magit-section ((,class :background ,bg-dim :foreground ,fg-main)))
    `(magit-section-heading ((,class :inherit bold :foreground ,cyan)))
    `(magit-section-heading-selection ((,class :inherit (modus-theme-refine-cyan bold))))
    `(magit-section-highlight ((,class :background ,bg-alt)))
    `(magit-sequence-done ((,class :foreground ,green-alt)))
    `(magit-sequence-drop ((,class :foreground ,red-alt)))
    `(magit-sequence-exec ((,class :foreground ,magenta-alt)))
    `(magit-sequence-head ((,class :foreground ,cyan-alt)))
    `(magit-sequence-onto ((,class :inherit shadow)))
    `(magit-sequence-part ((,class :foreground ,yellow-alt)))
    `(magit-sequence-pick ((,class :foreground ,blue-alt)))
    `(magit-sequence-stop ((,class :foreground ,red)))
    `(magit-signature-bad ((,class :inherit bold :foreground ,red)))
    `(magit-signature-error ((,class :foreground ,red-alt)))
    `(magit-signature-expired ((,class :foreground ,yellow)))
    `(magit-signature-expired-key ((,class :foreground ,yellow)))
    `(magit-signature-good ((,class :foreground ,green)))
    `(magit-signature-revoked ((,class :foreground ,magenta)))
    `(magit-signature-untrusted ((,class :foreground ,cyan)))
    `(magit-tag ((,class :foreground ,yellow-alt-other)))
;;;;; magit-imerge
    `(magit-imerge-overriding-value ((,class :inherit bold :foreground ,red-alt)))
;;;;; make-mode (makefiles)
    `(makefile-makepp-perl ((,class :background ,cyan-nuanced-bg)))
    `(makefile-space ((,class :background ,magenta-nuanced-bg)))
;;;;; man
    `(Man-overstrike ((,class :inherit bold :foreground ,magenta)))
    `(Man-reverse ((,class :inherit modus-theme-subtle-magenta)))
    `(Man-underline ((,class :foreground ,cyan :underline t)))
;;;;; marginalia
    `(marginalia-archive ((,class :foreground ,green-nuanced-fg)))
    `(marginalia-date ((,class :foreground ,blue-nuanced-fg)))
    `(marginalia-documentation ((,class :foreground ,fg-special-cold :inherit modus-theme-slant)))
    `(marginalia-file-modes ((,class :inherit shadow)))
    `(marginalia-file-name ((,class :foreground ,fg-special-mild)))
    `(marginalia-file-owner ((,class :foreground ,red-nuanced-fg)))
    `(marginalia-key ((,class :foreground ,magenta-active)))
    `(marginalia-mode ((,class :foreground ,cyan-active)))
    `(marginalia-modified ((,class :foreground ,yellow-active)))
    `(marginalia-number ((,class :foreground ,blue-active)))
    `(marginalia-size ((,class :foreground ,green-active)))
    `(marginalia-variable ((,class :foreground ,yellow-nuanced-fg)))
    `(marginalia-version ((,class :foreground ,cyan-active)))
;;;;; markdown-mode
    `(markdown-blockquote-face ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(markdown-bold-face ((,class :inherit bold)))
    `(markdown-code-face ((,class ,@(modus-themes--mixed-fonts) :background ,bg-dim :extend t)))
    `(markdown-comment-face ((,class :inherit font-lock-comment-face)))
    `(markdown-footnote-marker-face ((,class :inherit bold :foreground ,cyan-alt)))
    `(markdown-footnote-text-face ((,class :inherit modus-theme-slant :foreground ,fg-main)))
    `(markdown-gfm-checkbox-face ((,class :foreground ,cyan-alt-other)))
    `(markdown-header-delimiter-face ((,class :inherit modus-theme-bold :foreground ,fg-dim)))
    `(markdown-header-face ((t nil)))
    `(markdown-header-face-1 ((,class :inherit modus-theme-heading-1)))
    `(markdown-header-face-2 ((,class :inherit modus-theme-heading-2)))
    `(markdown-header-face-3 ((,class :inherit modus-theme-heading-3)))
    `(markdown-header-face-4 ((,class :inherit modus-theme-heading-4)))
    `(markdown-header-face-5 ((,class :inherit modus-theme-heading-5)))
    `(markdown-header-face-6 ((,class :inherit modus-theme-heading-6)))
    `(markdown-header-rule-face ((,class :inherit bold :foreground ,fg-special-warm)))
    `(markdown-hr-face ((,class :inherit bold :foreground ,fg-special-warm)))
    `(markdown-html-attr-name-face ((,class ,@(modus-themes--mixed-fonts)
                                            :foreground ,cyan)))
    `(markdown-html-attr-value-face ((,class ,@(modus-themes--mixed-fonts)
                                             :foreground ,blue)))
    `(markdown-html-entity-face ((,class ,@(modus-themes--mixed-fonts)
                                         :foreground ,cyan)))
    `(markdown-html-tag-delimiter-face ((,class ,@(modus-themes--mixed-fonts)
                                                :foreground ,fg-special-mild)))
    `(markdown-html-tag-name-face ((,class ,@(modus-themes--mixed-fonts)
                                           :foreground ,magenta-alt)))
    `(markdown-inline-code-face ((,class ,@(modus-themes--mixed-fonts)
                                         :background ,bg-alt :foreground ,fg-special-calm)))
    `(markdown-italic-face ((,class :inherit italic :foreground ,fg-special-cold)))
    `(markdown-language-info-face ((,class ,@(modus-themes--mixed-fonts)
                                           :foreground ,fg-special-cold)))
    `(markdown-language-keyword-face ((,class ,@(modus-themes--mixed-fonts)
                                              :foreground ,green-alt-other)))
    `(markdown-line-break-face ((,class :inherit modus-theme-refine-cyan :underline t)))
    `(markdown-link-face ((,class :inherit button)))
    `(markdown-link-title-face ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(markdown-list-face ((,class :foreground ,fg-dim)))
    `(markdown-markup-face ((,class :inherit shadow)))
    `(markdown-math-face ((,class :foreground ,magenta-alt-other)))
    `(markdown-metadata-key-face ((,class :foreground ,cyan-alt-other)))
    `(markdown-metadata-value-face ((,class :foreground ,blue-alt)))
    `(markdown-missing-link-face ((,class :inherit bold :foreground ,yellow)))
    `(markdown-plain-url-face ((,class :inherit markdown-link-face)))
    `(markdown-pre-face ((,class :inherit markdown-code-face :foreground ,fg-special-mild)))
    `(markdown-reference-face ((,class :inherit markdown-markup-face)))
    `(markdown-strike-through-face ((,class :strike-through t)))
    `(markdown-table-face ((,class ,@(modus-themes--mixed-fonts)
                                   :foreground ,fg-special-cold)))
    `(markdown-url-face ((,class :foreground ,blue-alt)))
;;;;; markup-faces (`adoc-mode')
    `(markup-anchor-face ((,class :foreground ,fg-inactive)))
    `(markup-attribute-face ((,class :inherit italic :foreground ,fg-inactive)))
    `(markup-big-face ((,class :height 1.3 :foreground ,blue-nuanced-fg)))
    `(markup-bold-face ((,class :inherit bold :foreground ,red-nuanced-fg)))
    `(markup-code-face ((,class :inherit fixed-pitch :foreground ,magenta)))
    `(markup-command-face ((,class :foreground ,fg-inactive)))
    `(markup-comment-face ((,class :inherit font-lock-comment-face)))
    `(markup-complex-replacement-face ((,class :box (:line-width 2 :color nil :style released-button)
                                               :inherit modus-theme-refine-magenta)))
    `(markup-emphasis-face ((,class :inherit italic :foreground ,fg-special-cold)))
    `(markup-error-face ((,class :inherit bold :foreground ,red)))
    `(markup-gen-face ((,class :foreground ,magenta-alt)))
    `(markup-internal-reference-face ((,class :inherit button :foreground ,fg-alt)))
    `(markup-italic-face ((,class :inherit italic :foreground ,fg-special-cold)))
    `(markup-list-face ((,class :inherit modus-theme-special-calm)))
    `(markup-meta-face ((,class :foreground ,fg-inactive)))
    `(markup-meta-hide-face ((,class :inherit shadow)))
    `(markup-passthrough-face ((,class :inherit fixed-pitch :foreground ,cyan)))
    `(markup-preprocessor-face ((,class :foreground ,red-alt-other)))
    `(markup-replacement-face ((,class :foreground ,yellow-alt-other)))
    `(markup-secondary-text-face ((,class :height 0.8 :foreground ,magenta-nuanced-fg)))
    `(markup-small-face ((,class :height 0.8 :foreground ,fg-main)))
    `(markup-strong-face ((,class :inherit bold :foreground ,red-nuanced-fg)))
    `(markup-subscript-face ((,class :height 0.8 :foreground ,fg-special-cold)))
    `(markup-superscript-face ((,class :height 0.8 :foreground ,fg-special-cold)))
    `(markup-table-cell-face ((,class :inherit modus-theme-special-cold)))
    `(markup-table-face ((,class :inherit modus-theme-subtle-cyan)))
    `(markup-table-row-face ((,class :inherit modus-theme-subtle-cyan)))
    `(markup-title-0-face ((,class :height 3.0 :foreground ,blue-nuanced-fg)))
    `(markup-title-1-face ((,class :height 2.4 :foreground ,blue-nuanced-fg)))
    `(markup-title-2-face ((,class :height 1.8 :foreground ,blue-nuanced-fg)))
    `(markup-title-3-face ((,class :height 1.4 :foreground ,blue-nuanced-fg)))
    `(markup-title-4-face ((,class :height 1.2 :foreground ,blue-nuanced-fg)))
    `(markup-title-5-face ((,class :height 1.2 :foreground ,blue-nuanced-fg :underline t)))
    `(markup-value-face ((,class :foreground ,fg-inactive)))
    `(markup-verbatim-face ((,class :inherit modus-theme-special-mild)))
;;;;; mentor
    `(mentor-download-message ((,class :foreground ,fg-special-warm)))
    `(mentor-download-name ((,class :foreground ,fg-special-cold)))
    `(mentor-download-progress ((,class :foreground ,blue-alt-other)))
    `(mentor-download-size ((,class :foreground ,magenta-alt-other)))
    `(mentor-download-speed-down ((,class :foreground ,cyan-alt)))
    `(mentor-download-speed-up ((,class :foreground ,red-alt)))
    `(mentor-download-state ((,class :foreground ,yellow-alt)))
    `(mentor-highlight-face ((,class :inherit modus-theme-subtle-blue)))
    `(mentor-tracker-name ((,class :foreground ,magenta-alt)))
;;;;; messages
    `(message-cited-text-1 ((,class :foreground ,blue-alt)))
    `(message-cited-text-2 ((,class :foreground ,red-alt)))
    `(message-cited-text-3 ((,class :foreground ,green-alt)))
    `(message-cited-text-4 ((,class :foreground ,magenta-alt)))
    `(message-header-cc ((,class :inherit bold :foreground ,cyan-alt)))
    `(message-header-name ((,class :foreground ,green-alt-other)))
    `(message-header-newsgroups ((,class :inherit bold :foreground ,green-alt)))
    `(message-header-other ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(message-header-subject ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(message-header-to ((,class :inherit bold :foreground ,blue)))
    `(message-header-xheader ((,class :foreground ,cyan)))
    `(message-mml ((,class :foreground ,fg-special-warm)))
    `(message-separator ((,class :inherit modus-theme-intense-neutral)))
;;;;; minibuffer-line
    `(minibuffer-line ((,class :foreground ,fg-main)))
;;;;; minimap
    `(minimap-active-region-background ((,class :background ,bg-active)))
    `(minimap-current-line-face ((,class :background ,cyan-intense-bg :foreground ,fg-main)))
;;;;; modeline
    `(mode-line ((,class ,@(modus-themes--mode-line-attrs
                            fg-active bg-active fg-dim bg-active
                            fg-alt bg-active 'alt-style nil bg-main))))
    `(mode-line-buffer-id ((,class :inherit bold)))
    `(mode-line-emphasis ((,class :inherit bold :foreground ,blue-active)))
    `(mode-line-highlight ((,class :inherit modus-theme-active-blue :box (:line-width -1 :style pressed-button))))
    `(mode-line-inactive ((,class ,@(modus-themes--mode-line-attrs
                                     fg-inactive bg-inactive fg-alt bg-dim
                                     bg-region bg-active))))
;;;;; mood-line
    `(mood-line-modified ((,class :foreground ,magenta-active)))
    `(mood-line-status-error ((,class :inherit bold :foreground ,red-active)))
    `(mood-line-status-info ((,class :foreground ,cyan-active)))
    `(mood-line-status-neutral ((,class :foreground ,blue-active)))
    `(mood-line-status-success ((,class :foreground ,green-active)))
    `(mood-line-status-warning ((,class :inherit bold :foreground ,yellow-active)))
    `(mood-line-unimportant ((,class :foreground ,fg-inactive)))
;;;;; mpdel
    `(mpdel-browser-directory-face ((,class :foreground ,blue)))
    `(mpdel-playlist-current-song-face ((,class :inherit bold :foreground ,blue-alt-other)))
;;;;; mu4e
    `(mu4e-attach-number-face ((,class :inherit bold :foreground ,cyan-alt)))
    `(mu4e-cited-1-face ((,class :foreground ,blue-alt)))
    `(mu4e-cited-2-face ((,class :foreground ,red-alt)))
    `(mu4e-cited-3-face ((,class :foreground ,green-alt)))
    `(mu4e-cited-4-face ((,class :foreground ,magenta-alt)))
    `(mu4e-cited-5-face ((,class :foreground ,yellow-alt)))
    `(mu4e-cited-6-face ((,class :foreground ,cyan-alt)))
    `(mu4e-cited-7-face ((,class :foreground ,magenta)))
    `(mu4e-compose-header-face ((,class :inherit mu4e-compose-separator-face)))
    `(mu4e-compose-separator-face ((,class :inherit modus-theme-intense-neutral)))
    `(mu4e-contact-face ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(mu4e-context-face ((,class :foreground ,blue-active)))
    `(mu4e-draft-face ((,class :foreground ,magenta-alt)))
    `(mu4e-flagged-face ((,class :foreground ,red-alt)))
    `(mu4e-footer-face ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(mu4e-forwarded-face ((,class :foreground ,magenta-alt-other)))
    `(mu4e-header-face ((,class :inherit shadow)))
    `(mu4e-header-highlight-face ((,class :inherit modus-theme-hl-line)))
    `(mu4e-header-key-face ((,class :foreground ,cyan)))
    `(mu4e-header-marks-face ((,class :inherit bold :foreground ,magenta-alt)))
    `(mu4e-header-title-face ((,class :foreground ,fg-special-mild)))
    `(mu4e-header-value-face ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(mu4e-highlight-face ((,class :inherit bold :foreground ,blue-alt-other)))
    `(mu4e-link-face ((,class :inherit button)))
    `(mu4e-modeline-face ((,class :foreground ,magenta-active)))
    `(mu4e-moved-face ((,class :inherit modus-theme-slant :foreground ,yellow)))
    `(mu4e-ok-face ((,class :inherit bold :foreground ,green)))
    `(mu4e-region-code ((,class :inherit modus-theme-special-calm)))
    `(mu4e-replied-face ((,class :foreground ,blue-faint)))
    `(mu4e-special-header-value-face ((,class :inherit bold :foreground ,blue-alt-other)))
    `(mu4e-system-face ((,class :inherit modus-theme-slant :foreground ,fg-mark-del)))
    `(mu4e-title-face ((,class :foreground ,fg-main)))
    `(mu4e-trashed-face ((,class :foreground ,red)))
    `(mu4e-unread-face ((,class :inherit bold :foreground ,fg-main)))
    `(mu4e-url-number-face ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(mu4e-view-body-face ((,class :foreground ,fg-main)))
    `(mu4e-warning-face ((,class :inherit warning)))
;;;;; mu4e-conversation
    `(mu4e-conversation-header ((,class :inherit modus-theme-special-cold)))
    `(mu4e-conversation-sender-1 ((,class :foreground ,fg-special-warm)))
    `(mu4e-conversation-sender-2 ((,class :foreground ,fg-special-cold)))
    `(mu4e-conversation-sender-3 ((,class :foreground ,fg-special-mild)))
    `(mu4e-conversation-sender-4 ((,class :inherit shadow)))
    `(mu4e-conversation-sender-5 ((,class :foreground ,yellow-refine-fg)))
    `(mu4e-conversation-sender-6 ((,class :foreground ,cyan-refine-fg)))
    `(mu4e-conversation-sender-7 ((,class :foreground ,green-refine-fg)))
    `(mu4e-conversation-sender-8 ((,class :foreground ,blue-refine-fg)))
    `(mu4e-conversation-sender-me ((,class :foreground ,fg-main)))
    `(mu4e-conversation-unread ((,class :inherit bold)))
;;;;; multiple-cursors
    `(mc/cursor-bar-face ((,class :height 1 :background ,fg-main)))
    `(mc/cursor-face ((,class :inverse-video t)))
    `(mc/region-face ((,class :inherit region)))
;;;;; neotree
    `(neo-banner-face ((,class :foreground ,magenta)))
    `(neo-button-face ((,class :inherit button)))
    `(neo-dir-link-face ((,class :inherit bold :foreground ,blue)))
    `(neo-expand-btn-face ((,class :foreground ,cyan)))
    `(neo-file-link-face ((,class :foreground ,fg-main)))
    `(neo-header-face ((,class :inherit bold :foreground ,fg-main)))
    `(neo-root-dir-face ((,class :inherit bold :foreground ,cyan-alt)))
    `(neo-vc-added-face ((,class :foreground ,green)))
    `(neo-vc-conflict-face ((,class :inherit bold :foreground ,red)))
    `(neo-vc-default-face ((,class :foreground ,fg-main)))
    `(neo-vc-edited-face ((,class :foreground ,yellow)))
    `(neo-vc-ignored-face ((,class :foreground ,fg-inactive)))
    `(neo-vc-missing-face ((,class :foreground ,red-alt)))
    `(neo-vc-needs-merge-face ((,class :foreground ,magenta-alt)))
    `(neo-vc-needs-update-face ((,class :underline t)))
    `(neo-vc-removed-face ((,class :strike-through t)))
    `(neo-vc-unlocked-changes-face ((,class :inherit modus-theme-refine-blue)))
    `(neo-vc-up-to-date-face ((,class :inherit shadow)))
    `(neo-vc-user-face ((,class :foreground ,magenta)))
;;;;; no-emoji
    `(no-emoji ((,class :foreground ,cyan)))
;;;;; notmuch
    `(notmuch-crypto-decryption ((,class :inherit modus-theme-refine-magenta)))
    `(notmuch-crypto-part-header ((,class :foreground ,magenta-alt-other)))
    `(notmuch-crypto-signature-bad ((,class :inherit modus-theme-intense-red)))
    `(notmuch-crypto-signature-good ((,class :inherit modus-theme-refine-green)))
    `(notmuch-crypto-signature-good-key ((,class :inherit modus-theme-refine-yellow)))
    `(notmuch-crypto-signature-unknown ((,class :inherit modus-theme-refine-red)))
    `(notmuch-hello-logo-background ((,class :background ,bg-main)))
    `(notmuch-message-summary-face ((,class :inherit modus-theme-nuanced-cyan)))
    `(notmuch-search-count ((,class :inherit shadow)))
    `(notmuch-search-date ((,class :foreground ,magenta-alt)))
    `(notmuch-search-flagged-face ((,class :foreground ,red-alt)))
    `(notmuch-search-matching-authors ((,class :foreground ,fg-main)))
    `(notmuch-search-non-matching-authors ((,class :inherit shadow)))
    `(notmuch-search-subject ((,class :foreground ,fg-dim)))
    `(notmuch-search-unread-face ((,class :inherit bold)))
    `(notmuch-tag-added
      ((,(append '((supports :underline (:style wave))) class)
        :underline (:color ,green :style wave))
       (,class :foreground ,green :underline t)))
    `(notmuch-tag-deleted
      ((,(append '((supports :underline (:style wave))) class)
        :underline (:color ,red :style wave))
       (,class :foreground ,red :underline t)))
    `(notmuch-tag-face ((,class :inherit bold :foreground ,blue-alt)))
    `(notmuch-tag-flagged ((,class :foreground ,red-alt)))
    `(notmuch-tag-unread ((,class :foreground ,magenta-alt)))
    `(notmuch-tree-match-author-face ((,class :foreground ,fg-special-cold)))
    `(notmuch-tree-match-date-face ((,class :foreground ,magenta-alt)))
    `(notmuch-tree-match-face ((,class :foreground ,fg-main)))
    `(notmuch-tree-match-tag-face ((,class :inherit bold :foreground ,blue-alt)))
    `(notmuch-tree-no-match-face ((,class :inherit shadow)))
    `(notmuch-tree-no-match-date-face ((,class :inherit shadow)))
    `(notmuch-wash-cited-text ((,class :foreground ,cyan)))
    `(notmuch-wash-toggle-button ((,class :background ,bg-alt :foreground ,fg-alt)))
;;;;; num3-mode
    `(num3-face-even ((,class :inherit bold :background ,bg-alt)))
;;;;; nxml-mode
    `(nxml-attribute-colon ((,class :foreground ,fg-main)))
    `(nxml-attribute-local-name ((,class :inherit font-lock-variable-name-face)))
    `(nxml-attribute-prefix ((,class  :inherit font-lock-type-face)))
    `(nxml-attribute-value ((,class :inherit font-lock-constant-face)))
    `(nxml-cdata-section-CDATA ((,class :inherit error)))
    `(nxml-cdata-section-delimiter ((,class :inherit error)))
    `(nxml-char-ref-delimiter ((,class :foreground ,fg-special-mild)))
    `(nxml-char-ref-number ((,class :inherit modus-theme-bold :foreground ,fg-special-mild)))
    `(nxml-delimited-data ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(nxml-delimiter ((,class :foreground ,fg-dim)))
    `(nxml-element-colon ((,class :foreground ,fg-main)))
    `(nxml-element-local-name ((,class :inherit font-lock-function-name-face)))
    `(nxml-element-prefix ((,class :inherit font-lock-builtin-face)))
    `(nxml-entity-ref-delimiter ((,class :foreground ,fg-special-mild)))
    `(nxml-entity-ref-name ((,class :inherit modus-theme-bold :foreground ,fg-special-mild)))
    `(nxml-glyph ((,class :inherit modus-theme-intense-neutral)))
    `(nxml-hash ((,class :inherit (bold font-lock-string-face))))
    `(nxml-heading ((,class :inherit bold)))
    `(nxml-name ((,class :inherit font-lock-builtin-face)))
    `(nxml-namespace-attribute-colon ((,class :foreground ,fg-main)))
    `(nxml-namespace-attribute-prefix ((,class :inherit font-lock-variable-name-face)))
    `(nxml-processing-instruction-target ((,class :inherit font-lock-keyword-face)))
    `(nxml-prolog-keyword ((,class :inherit font-lock-keyword-face)))
    `(nxml-ref ((,class :inherit modus-theme-bold :foreground ,fg-special-mild)))
    `(rng-error ((,class :inherit error)))
;;;;; objed
    `(objed-hl ((,class :background ,(if modus-themes-intense-hl-line
                                         bg-hl-alt-intense bg-hl-alt))))
    `(objed-mark ((,class :background ,bg-active)))
    `(objed-mode-line ((,class :foreground ,cyan-active)))
;;;;; orderless
    `(orderless-match-face-0 ((,class :inherit bold
                                      ,@(modus-themes--standard-completions
                                         blue-alt-other blue-nuanced-bg
                                         blue-refine-bg blue-refine-fg))))
    `(orderless-match-face-1 ((,class :inherit bold
                                      ,@(modus-themes--standard-completions
                                         magenta-alt magenta-nuanced-bg
                                         magenta-refine-bg magenta-refine-fg))))
    `(orderless-match-face-2 ((,class :inherit bold
                                      ,@(modus-themes--standard-completions
                                         green green-nuanced-bg
                                         green-refine-bg green-refine-fg))))
    `(orderless-match-face-3 ((,class :inherit bold
                                      ,@(modus-themes--standard-completions
                                         yellow yellow-nuanced-bg
                                         yellow-refine-bg yellow-refine-fg))))
;;;;; org
    `(org-agenda-calendar-event ((,class :foreground ,fg-main)))
    `(org-agenda-calendar-sexp ((,class :foreground ,cyan-alt)))
    `(org-agenda-clocking ((,class :inherit modus-theme-special-cold :extend t)))
    `(org-agenda-column-dateline ((,class :background ,bg-alt)))
    `(org-agenda-current-time ((,class :inherit bold :foreground ,blue-alt-other)))
    `(org-agenda-date ((,class :foreground ,cyan)))
    `(org-agenda-date-today ((,class :inherit bold :foreground ,fg-main :underline t)))
    `(org-agenda-date-weekend ((,class :foreground ,cyan-alt-other)))
    `(org-agenda-diary ((,class :foreground ,fg-main)))
    `(org-agenda-dimmed-todo-face ((,class :inherit bold :foreground ,fg-alt)))
    `(org-agenda-done ((,class :foreground ,green-alt)))
    `(org-agenda-filter-category ((,class :inherit bold :foreground ,magenta-active)))
    `(org-agenda-filter-effort ((,class :inherit bold :foreground ,magenta-active)))
    `(org-agenda-filter-regexp ((,class :inherit bold :foreground ,magenta-active)))
    `(org-agenda-filter-tags ((,class :inherit bold :foreground ,magenta-active)))
    `(org-agenda-restriction-lock ((,class :background ,bg-dim :foreground ,fg-dim)))
    `(org-agenda-structure ((,class :foreground ,blue-alt)))
    `(org-archived ((,class :background ,bg-alt :foreground ,fg-alt)))
    `(org-block ((,class ,@(modus-themes--mixed-fonts)
                         ,@(modus-themes--org-block bg-dim)
                         :foreground ,fg-main)))
    `(org-block-begin-line ((,class ,@(modus-themes--mixed-fonts)
                                    ,@(modus-themes--org-block-delim
                                       bg-dim fg-special-cold
                                       bg-alt fg-special-mild))))
    `(org-block-end-line ((,class :inherit org-block-begin-line)))
    `(org-checkbox ((,class :box (:line-width 1 :color ,bg-active)
                            :background ,bg-inactive :foreground ,fg-active)))
    `(org-checkbox-statistics-done ((,class :inherit org-done)))
    `(org-checkbox-statistics-todo ((,class :inherit org-todo)))
    `(org-clock-overlay ((,class :inherit modus-theme-special-cold)))
    `(org-code ((,class ,@(modus-themes--mixed-fonts) :foreground ,magenta)))
    `(org-column ((,class :background ,bg-alt)))
    `(org-column-title ((,class :inherit bold :underline t :background ,bg-alt)))
    `(org-date ((,class :inherit ,(if modus-themes-no-mixed-fonts
                                      'button
                                    '(button fixed-pitch))
                        ,@(modus-themes--link-color
                           cyan cyan-faint))))
    `(org-date-selected ((,class :inherit bold :foreground ,blue-alt :inverse-video t)))
    `(org-dispatcher-highlight ((,class :inherit (bold modus-theme-mark-alt))))
    `(org-document-info ((,class :foreground ,fg-special-cold)))
    `(org-document-info-keyword ((,class ,@(modus-themes--mixed-fonts)
                                         :foreground ,fg-alt)))
    `(org-document-title ((,class :inherit (bold modus-theme-variable-pitch) :foreground ,fg-special-cold
                                  ,@(modus-themes--scale modus-themes-scale-5))))
    `(org-done ((,class :foreground ,green)))
    `(org-drawer ((,class ,@(modus-themes--mixed-fonts)
                          :foreground ,fg-alt)))
    `(org-ellipsis ((,class :foreground nil))) ; inherits from the heading's color
    `(org-footnote ((,class :inherit button
                            ,@(modus-themes--link-color
                               blue-alt blue-alt-faint))))
    `(org-formula ((,class ,@(modus-themes--mixed-fonts)
                           :foreground ,red-alt)))
    `(org-habit-alert-face ((,class ,@(modus-themes--org-habit
                                       yellow-graph-0-bg
                                       yellow-graph-0-bg
                                       yellow-graph-1-bg))))
    `(org-habit-alert-future-face ((,class ,@(modus-themes--org-habit
                                              yellow-graph-1-bg
                                              yellow-graph-0-bg
                                              yellow-graph-1-bg))))
    `(org-habit-clear-face ((,class ,@(modus-themes--org-habit
                                       blue-graph-0-bg
                                       green-graph-1-bg
                                       blue-graph-1-bg))))
    `(org-habit-clear-future-face ((,class ,@(modus-themes--org-habit
                                              blue-graph-1-bg
                                              green-graph-1-bg
                                              blue-graph-1-bg))))
    `(org-habit-overdue-face ((,class ,@(modus-themes--org-habit
                                         red-graph-0-bg
                                         red-graph-0-bg
                                         red-graph-1-bg))))
    `(org-habit-overdue-future-face ((,class ,@(modus-themes--org-habit
                                                red-graph-1-bg
                                                red-graph-0-bg
                                                red-graph-1-bg))))
    `(org-habit-ready-face ((,class ,@(modus-themes--org-habit
                                       green-graph-0-bg
                                       green-graph-0-bg
                                       green-graph-1-bg))))
    `(org-habit-ready-future-face ((,class ,@(modus-themes--org-habit
                                              green-graph-1-bg
                                              green-graph-0-bg
                                              green-graph-1-bg))))
    `(org-headline-done ((,class :inherit modus-theme-variable-pitch :foreground ,green-nuanced-fg)))
    `(org-headline-todo ((,class :inherit modus-theme-variable-pitch :foreground ,red-nuanced-fg)))
    `(org-hide ((,class :foreground ,bg-main)))
    `(org-indent ((,class :inherit (fixed-pitch org-hide))))
    `(org-latex-and-related ((,class :foreground ,magenta-refine-fg)))
    `(org-level-1 ((,class :inherit modus-theme-heading-1)))
    `(org-level-2 ((,class :inherit modus-theme-heading-2)))
    `(org-level-3 ((,class :inherit modus-theme-heading-3)))
    `(org-level-4 ((,class :inherit modus-theme-heading-4)))
    `(org-level-5 ((,class :inherit modus-theme-heading-5)))
    `(org-level-6 ((,class :inherit modus-theme-heading-6)))
    `(org-level-7 ((,class :inherit modus-theme-heading-7)))
    `(org-level-8 ((,class :inherit modus-theme-heading-8)))
    `(org-link ((,class :inherit button)))
    `(org-list-dt ((,class :inherit bold)))
    `(org-macro ((,class :background ,blue-nuanced-bg :foreground ,magenta-alt-other)))
    `(org-meta-line ((,class ,@(modus-themes--mixed-fonts) :foreground ,fg-alt)))
    `(org-mode-line-clock ((,class :foreground ,fg-main)))
    `(org-mode-line-clock-overrun ((,class :inherit modus-theme-active-red)))
    `(org-priority ((,class :foreground ,magenta)))
    `(org-property-value ((,class ,@(modus-themes--mixed-fonts)
                                  :foreground ,fg-special-cold)))
    `(org-quote ((,class :inherit modus-theme-slant
                         ,@(modus-themes--org-block bg-dim)
                         :foreground ,fg-special-cold)))
    `(org-scheduled ((,class :foreground ,fg-special-warm)))
    `(org-scheduled-previously ((,class :foreground ,yellow-alt-other)))
    `(org-scheduled-today ((,class :foreground ,magenta-alt-other)))
    `(org-sexp-date ((,class :inherit org-date)))
    `(org-special-keyword ((,class ,@(modus-themes--mixed-fonts)
                                   :foreground ,fg-alt)))
    `(org-table ((,class ,@(modus-themes--mixed-fonts)
                         :foreground ,fg-special-cold)))
    `(org-table-header ((,class :inherit (fixed-pitch modus-theme-intense-neutral))))
    `(org-tag ((,class :foreground ,magenta-nuanced-fg)))
    `(org-tag-group ((,class :inherit bold :foreground ,cyan-nuanced-fg)))
    `(org-target ((,class :underline t)))
    `(org-time-grid ((,class :foreground ,fg-unfocused)))
    `(org-todo ((,class :foreground ,red)))
    `(org-upcoming-deadline ((,class :foreground ,red-alt-other)))
    `(org-upcoming-distant-deadline ((,class :foreground ,red-nuanced-fg)))
    `(org-verbatim ((,class ,@(modus-themes--mixed-fonts)
                            :background ,bg-alt :foreground ,fg-special-calm)))
    `(org-verse ((,class :inherit org-quote)))
    `(org-warning ((,class :inherit bold :foreground ,red-alt-other)))
;;;;; org-journal
    `(org-journal-calendar-entry-face ((,class :inherit modus-theme-slant :foreground ,yellow-alt-other)))
    `(org-journal-calendar-scheduled-face ((,class :inherit modus-theme-slant :foreground ,red-alt-other)))
    `(org-journal-highlight ((,class :foreground ,magenta-alt)))
;;;;; org-noter
    `(org-noter-no-notes-exist-face ((,class :inherit bold :foreground ,red-active)))
    `(org-noter-notes-exist-face ((,class :inherit bold :foreground ,green-active)))
;;;;; org-pomodoro
    `(org-pomodoro-mode-line ((,class :foreground ,red-active)))
    `(org-pomodoro-mode-line-break ((,class :foreground ,cyan-active)))
    `(org-pomodoro-mode-line-overtime ((,class :inherit bold :foreground ,red-active)))
;;;;; org-recur
    `(org-recur ((,class :foreground ,magenta-active)))
;;;;; org-roam
    `(org-roam-link ((,class :inherit button
                             ,@(modus-themes--link-color
                                green green-faint))))
    `(org-roam-link-current ((,class :inherit button
                                     ,@(modus-themes--link-color
                                        green-alt green-alt-faint))))
    `(org-roam-link-invalid ((,class :inherit button
                                     ,@(modus-themes--link-color
                                        red red-faint))))
    `(org-roam-link-shielded ((,class :inherit button
                                      ,@(modus-themes--link-color
                                         yellow yellow-faint))))
    `(org-roam-tag ((,class :inherit italic :foreground ,fg-alt)))
;;;;; org-superstar
    `(org-superstar-item ((,class :foreground ,fg-main)))
    `(org-superstar-leading ((,class :foreground ,fg-whitespace)))
;;;;; org-table-sticky-header
    `(org-table-sticky-header-face ((,class :inherit modus-theme-intense-neutral)))
;;;;; org-tree-slide
    `(org-tree-slide-header-overlay-face ((,class :background ,bg-main :foreground ,fg-main)))
;;;;; org-treescope
    `(org-treescope-faces--markerinternal-midday ((,class :inherit modus-theme-intense-blue)))
    `(org-treescope-faces--markerinternal-range ((,class :inherit modus-theme-special-mild)))
;;;;; origami
    `(origami-fold-header-face ((,class :background ,bg-dim :foreground ,fg-dim :box t)))
    `(origami-fold-replacement-face ((,class :background ,bg-alt :foreground ,fg-alt)))
;;;;; outline-mode
    `(outline-1 ((,class :inherit modus-theme-heading-1)))
    `(outline-2 ((,class :inherit modus-theme-heading-2)))
    `(outline-3 ((,class :inherit modus-theme-heading-3)))
    `(outline-4 ((,class :inherit modus-theme-heading-4)))
    `(outline-5 ((,class :inherit modus-theme-heading-5)))
    `(outline-6 ((,class :inherit modus-theme-heading-6)))
    `(outline-7 ((,class :inherit modus-theme-heading-7)))
    `(outline-8 ((,class :inherit modus-theme-heading-8)))
;;;;; outline-minor-faces
    `(outline-minor-0 ((,class :background ,bg-alt)))
;;;;; package (M-x list-packages)
    `(package-description ((,class :foreground ,fg-special-cold)))
    `(package-help-section-name ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(package-name ((,class :inherit button)))
    `(package-status-avail-obso ((,class :inherit bold :foreground ,red)))
    `(package-status-available ((,class :foreground ,fg-special-mild)))
    `(package-status-built-in ((,class :foreground ,magenta)))
    `(package-status-dependency ((,class :foreground ,magenta-alt-other)))
    `(package-status-disabled ((,class :inherit modus-theme-subtle-red)))
    `(package-status-external ((,class :foreground ,cyan-alt-other)))
    `(package-status-held ((,class :foreground ,yellow-alt)))
    `(package-status-incompat ((,class :inherit bold :foreground ,yellow)))
    `(package-status-installed ((,class :foreground ,fg-special-warm)))
    `(package-status-new ((,class :inherit bold :foreground ,green)))
    `(package-status-unsigned ((,class :inherit bold :foreground ,red-alt)))
;;;;; page-break-lines
    `(page-break-lines ((,class :inherit default :foreground ,fg-window-divider-outer)))
;;;;; paradox
    `(paradox-archive-face ((,class :foreground ,fg-special-mild)))
    `(paradox-comment-face ((,class :inherit font-lock-comment-face)))
    `(paradox-commit-tag-face ((,class :inherit modus-theme-refine-magenta :box t)))
    `(paradox-description-face ((,class :foreground ,fg-special-cold)))
    `(paradox-description-face-multiline ((,class :foreground ,fg-special-cold)))
    `(paradox-download-face ((,class :inherit modus-theme-bold :foreground ,blue-alt-other)))
    `(paradox-highlight-face ((,class :inherit modus-theme-bold :foreground ,cyan-alt-other)))
    `(paradox-homepage-button-face ((,class :foreground ,magenta-alt-other :underline t)))
    `(paradox-mode-line-face ((,class :inherit bold :foreground ,cyan-active)))
    `(paradox-name-face ((,class :foreground ,blue :underline t)))
    `(paradox-star-face ((,class :foreground ,magenta)))
    `(paradox-starred-face ((,class :foreground ,magenta-alt)))
;;;;; paren-face
    `(parenthesis ((,class :foreground ,fg-unfocused)))
;;;;; parrot
    `(parrot-rotate-rotation-highlight-face ((,class :inherit modus-theme-refine-magenta)))
;;;;; pass
    `(pass-mode-directory-face ((,class :inherit bold :foreground ,fg-special-cold)))
    `(pass-mode-entry-face ((,class :background ,bg-main :foreground ,fg-main)))
    `(pass-mode-header-face ((,class :foreground ,fg-special-warm)))
;;;;; pdf-tools
    `(pdf-links-read-link ((,class :background ,fg-main :foreground ,magenta-intense-bg :inherit bold))) ; Foreground is background and vice versa
    `(pdf-occur-document-face ((,class :inherit shadow)))
    `(pdf-occur-page-face ((,class :inherit shadow)))
;;;;; persp-mode
    `(persp-face-lighter-buffer-not-in-persp ((,class :inherit modus-theme-intense-red)))
    `(persp-face-lighter-default ((,class :inherit bold :foreground ,blue-active)))
    `(persp-face-lighter-nil-persp ((,class :inherit bold :foreground ,fg-active)))
;;;;; perspective
    `(persp-selected-face ((,class :inherit bold :foreground ,blue-active)))
;;;;; phi-grep
    `(phi-grep-heading-face  ((,class :inherit bold :foreground ,red-alt
                                      ,@(modus-themes--scale modus-themes-scale-4))))
    `(phi-grep-line-number-face ((,class :foreground ,fg-special-warm)))
    `(phi-grep-match-face ((,class :inherit modus-theme-special-calm)))
    `(phi-grep-modified-face ((,class :inherit modus-theme-refine-yellow)))
    `(phi-grep-overlay-face ((,class :inherit modus-theme-refine-blue)))
;;;;; phi-search
    `(phi-replace-preview-face ((,class :inherit modus-theme-intense-magenta)))
    `(phi-search-failpart-face ((,class :inherit modus-theme-refine-red)))
    `(phi-search-match-face ((,class :inherit modus-theme-refine-cyan)))
    `(phi-search-selection-face ((,class :inherit (modus-theme-intense-green bold))))
;;;;; pkgbuild-mode
    `(pkgbuild-error-face ((,class :inherit modus-theme-lang-error)))
;;;;; pomidor
    `(pomidor-break-face ((,class :foreground ,blue-alt-other)))
    `(pomidor-overwork-face ((,class :foreground ,red-alt-other)))
    `(pomidor-skip-face ((,class :inherit modus-theme-slant :foreground ,fg-alt)))
    `(pomidor-work-face ((,class :foreground ,green-alt-other)))
;;;;; popup
    `(popup-face ((,class :background ,bg-alt :foreground ,fg-main)))
    `(popup-isearch-match ((,class :inherit (modus-theme-refine-cyan bold))))
    `(popup-menu-mouse-face ((,class :inherit modus-theme-intense-blue)))
    `(popup-menu-selection-face ((,class :inherit (modus-theme-subtle-cyan bold))))
    `(popup-scroll-bar-background-face ((,class :background ,bg-active)))
    `(popup-scroll-bar-foreground-face ((,class :foreground ,fg-active)))
    `(popup-summary-face ((,class :background ,bg-active :foreground ,fg-inactive)))
    `(popup-tip-face ((,class :inherit modus-theme-refine-yellow)))
;;;;; powerline
    `(powerline-active0 ((,class :background ,bg-main :foreground ,blue-faint :inverse-video t)))
    `(powerline-active1 ((,class :background ,blue-nuanced-bg :foreground ,blue-nuanced-fg)))
    `(powerline-active2 ((,class :background ,bg-active :foreground ,fg-active)))
    `(powerline-inactive0 ((,class :background ,bg-special-cold :foreground ,fg-special-cold)))
    `(powerline-inactive1 ((,class :background ,bg-dim :foreground ,fg-inactive)))
    `(powerline-inactive2 ((,class :background ,bg-inactive :foreground ,fg-inactive)))
;;;;; powerline-evil
    `(powerline-evil-base-face ((,class :background ,fg-main :foreground ,bg-main)))
    `(powerline-evil-emacs-face ((,class :inherit modus-theme-active-magenta)))
    `(powerline-evil-insert-face ((,class :inherit modus-theme-active-green)))
    `(powerline-evil-motion-face ((,class :inherit modus-theme-active-blue)))
    `(powerline-evil-normal-face ((,class :background ,fg-alt :foreground ,bg-main)))
    `(powerline-evil-operator-face ((,class :inherit modus-theme-active-yellow)))
    `(powerline-evil-replace-face ((,class :inherit modus-theme-active-red)))
    `(powerline-evil-visual-face ((,class :inherit modus-theme-active-cyan)))
;;;;; proced
    `(proced-mark ((,class :inherit modus-theme-mark-symbol)))
    `(proced-marked ((,class :inherit modus-theme-mark-alt)))
    `(proced-sort-header ((,class :inherit bold :foreground ,fg-special-calm :underline t)))
;;;;; prodigy
    `(prodigy-green-face ((,class :foreground ,green)))
    `(prodigy-red-face ((,class :foreground ,red)))
    `(prodigy-yellow-face ((,class :foreground ,yellow)))
;;;;; racket-mode
    `(racket-debug-break-face ((,class :inherit modus-theme-intense-red)))
    `(racket-debug-locals-face ((,class :box (:line-width -1 :color nil)
                                        :foreground ,green-alt-other)))
    `(racket-debug-result-face ((,class :inherit bold :box (:line-width -1 :color nil)
                                        :foreground ,green)))
    `(racket-here-string-face ((,class :foreground ,blue-alt)))
    `(racket-keyword-argument-face ((,class :foreground ,red-alt)))
    `(racket-logger-config-face ((,class :inherit modus-theme-slant :foreground ,fg-alt)))
    `(racket-logger-debug-face ((,class :foreground ,blue-alt-other)))
    `(racket-logger-info-face ((,class :foreground ,fg-lang-note)))
    `(racket-logger-topic-face ((,class :inherit modus-theme-slant :foreground ,magenta)))
    `(racket-selfeval-face ((,class :foreground ,green-alt)))
    `(racket-xp-error-face ((,class :inherit modus-theme-lang-error)))
;;;;; rainbow-blocks
    `(rainbow-blocks-depth-1-face ((,class :foreground ,magenta-alt-other)))
    `(rainbow-blocks-depth-2-face ((,class :foreground ,blue)))
    `(rainbow-blocks-depth-3-face ((,class :foreground ,magenta-alt)))
    `(rainbow-blocks-depth-4-face ((,class :foreground ,green)))
    `(rainbow-blocks-depth-5-face ((,class :foreground ,magenta)))
    `(rainbow-blocks-depth-6-face ((,class :foreground ,cyan)))
    `(rainbow-blocks-depth-7-face ((,class :foreground ,yellow)))
    `(rainbow-blocks-depth-8-face ((,class :foreground ,cyan-alt)))
    `(rainbow-blocks-depth-9-face ((,class :foreground ,red-alt)))
    `(rainbow-blocks-unmatched-face ((,class :foreground ,red)))
;;;;; rainbow-identifiers
    `(rainbow-identifiers-identifier-1 ((,class :foreground ,green-alt-other)))
    `(rainbow-identifiers-identifier-2 ((,class :foreground ,magenta-alt-other)))
    `(rainbow-identifiers-identifier-3 ((,class :foreground ,cyan-alt-other)))
    `(rainbow-identifiers-identifier-4 ((,class :foreground ,yellow-alt-other)))
    `(rainbow-identifiers-identifier-5 ((,class :foreground ,blue-alt-other)))
    `(rainbow-identifiers-identifier-6 ((,class :foreground ,green-alt)))
    `(rainbow-identifiers-identifier-7 ((,class :foreground ,magenta-alt)))
    `(rainbow-identifiers-identifier-8 ((,class :foreground ,cyan-alt)))
    `(rainbow-identifiers-identifier-9 ((,class :foreground ,yellow-alt)))
    `(rainbow-identifiers-identifier-10 ((,class :foreground ,green)))
    `(rainbow-identifiers-identifier-11 ((,class :foreground ,magenta)))
    `(rainbow-identifiers-identifier-12 ((,class :foreground ,cyan)))
    `(rainbow-identifiers-identifier-13 ((,class :foreground ,yellow)))
    `(rainbow-identifiers-identifier-14 ((,class :foreground ,blue-alt)))
    `(rainbow-identifiers-identifier-15 ((,class :foreground ,red-alt)))
;;;;; rainbow-delimiters
    `(rainbow-delimiters-base-error-face ((,class :background ,red-subtle-bg :foreground ,fg-main)))
    `(rainbow-delimiters-base-face ((,class :foreground ,fg-main)))
    `(rainbow-delimiters-depth-1-face ((,class :foreground ,fg-main)))
    `(rainbow-delimiters-depth-2-face ((,class :foreground ,magenta-intense)))
    `(rainbow-delimiters-depth-3-face ((,class :foreground ,cyan-intense)))
    `(rainbow-delimiters-depth-4-face ((,class :foreground ,orange-intense)))
    `(rainbow-delimiters-depth-5-face ((,class :foreground ,purple-intense)))
    `(rainbow-delimiters-depth-6-face ((,class :foreground ,green-intense)))
    `(rainbow-delimiters-depth-7-face ((,class :foreground ,red-intense)))
    `(rainbow-delimiters-depth-8-face ((,class :foreground ,blue-intense)))
    `(rainbow-delimiters-depth-9-face ((,class :foreground ,yellow-intense)))
    `(rainbow-delimiters-mismatched-face ((,class :inherit (bold modus-theme-refine-yellow))))
    `(rainbow-delimiters-unmatched-face ((,class :inherit (bold modus-theme-refine-red))))
;;;;; rcirc
    `(rcirc-bright-nick ((,class :inherit bold :foreground ,magenta-alt)))
    `(rcirc-dim-nick ((,class :inherit shadow)))
    `(rcirc-my-nick ((,class :inherit bold :foreground ,magenta)))
    `(rcirc-nick-in-message ((,class :foreground ,magenta-alt-other)))
    `(rcirc-nick-in-message-full-line ((,class :inherit bold :foreground ,fg-special-mild)))
    `(rcirc-other-nick ((,class :inherit bold :foreground ,fg-special-cold)))
    `(rcirc-prompt ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(rcirc-server ((,class :foreground ,fg-unfocused)))
    `(rcirc-timestamp ((,class :foreground ,blue-nuanced-fg)))
    `(rcirc-url ((,class :foreground ,blue :underline t)))
;;;;; recursion-indicator
    `(recursion-indicator-general ((,class :foreground ,blue-active)))
    `(recursion-indicator-minibuffer ((,class :foreground ,red-active)))
;;;;; regexp-builder (re-builder)
    `(reb-match-0 ((,class :inherit modus-theme-refine-blue)))
    `(reb-match-1 ((,class :inherit modus-theme-refine-magenta)))
    `(reb-match-2 ((,class :inherit modus-theme-refine-green)))
    `(reb-match-3 ((,class :inherit modus-theme-special-calm)))
    `(reb-regexp-grouping-backslash ((,class :inherit bold :foreground ,fg-escape-char-backslash)))
    `(reb-regexp-grouping-construct ((,class :inherit bold :foreground ,fg-escape-char-construct)))
;;;;; rg (rg.el)
    `(rg-column-number-face ((,class :foreground ,magenta-alt-other)))
    `(rg-context-face ((,class :foreground ,fg-unfocused)))
    `(rg-error-face ((,class :inherit bold :foreground ,red)))
    `(rg-file-tag-face ((,class :foreground ,fg-special-cold)))
    `(rg-filename-face ((,class :inherit bold :foreground ,fg-special-cold)))
    `(rg-line-number-face ((,class :foreground ,fg-special-warm)))
    `(rg-literal-face ((,class :foreground ,blue-alt)))
    `(rg-match-face ((,class :inherit modus-theme-special-calm)))
    `(rg-regexp-face ((,class :foreground ,magenta-active)))
    `(rg-toggle-off-face ((,class :inherit bold :foreground ,fg-inactive)))
    `(rg-toggle-on-face ((,class :inherit bold :foreground ,cyan-active)))
    `(rg-warning-face ((,class :inherit bold :foreground ,yellow)))
;;;;; ripgrep
    `(ripgrep-context-face ((,class :foreground ,fg-unfocused)))
    `(ripgrep-error-face ((,class :inherit bold :foreground ,red)))
    `(ripgrep-hit-face ((,class :foreground ,cyan)))
    `(ripgrep-match-face ((,class :inherit modus-theme-special-calm)))
;;;;; rmail
    `(rmail-header-name ((,class :foreground ,cyan-alt-other)))
    `(rmail-highlight ((,class :inherit bold :foreground ,magenta-alt)))
;;;;; ruler-mode
    `(ruler-mode-column-number ((,class :inherit ruler-mode-default :foreground ,fg-main)))
    `(ruler-mode-comment-column ((,class :inherit ruler-mode-default :foreground ,red)))
    `(ruler-mode-current-column ((,class :inherit ruler-mode-default :background ,blue-subtle-bg :foreground ,fg-main)))
    `(ruler-mode-default ((,class :inherit default :background ,bg-alt :foreground ,fg-unfocused)))
    `(ruler-mode-fill-column ((,class :inherit ruler-mode-default :foreground ,green)))
    `(ruler-mode-fringes ((,class :inherit ruler-mode-default :foreground ,cyan)))
    `(ruler-mode-goal-column ((,class :inherit ruler-mode-default :foreground ,blue)))
    `(ruler-mode-margins ((,class :inherit ruler-mode-default :foreground ,bg-main)))
    `(ruler-mode-pad ((,class :inherit ruler-mode-default :background ,bg-active :foreground ,fg-inactive)))
    `(ruler-mode-tab-stop ((,class :inherit ruler-mode-default :foreground ,fg-special-warm)))
;;;;; sallet
    `(sallet-buffer-compressed ((,class :inherit italic :foreground ,yellow-nuanced-fg)))
    `(sallet-buffer-default-directory ((,class :foreground ,cyan-nuanced-fg)))
    `(sallet-buffer-directory ((,class :foreground ,blue-nuanced-fg)))
    `(sallet-buffer-help ((,class :foreground ,fg-special-cold)))
    `(sallet-buffer-modified ((,class :inherit italic :foreground ,yellow-alt-other)))
    `(sallet-buffer-ordinary ((,class :foreground ,fg-main)))
    `(sallet-buffer-read-only ((,class :foreground ,yellow-alt)))
    `(sallet-buffer-size ((,class :foreground ,fg-special-calm)))
    `(sallet-buffer-special ((,class :foreground ,magenta-alt-other)))
    `(sallet-flx-match ((,class ,@(modus-themes--extra-completions
                                   'modus-theme-subtle-cyan
                                   'modus-theme-refine-cyan
                                   'modus-theme-nuanced-cyan
                                   cyan-alt-other))))
    `(sallet-recentf-buffer-name ((,class :foreground ,blue-nuanced-fg)))
    `(sallet-recentf-file-path ((,class :foreground ,fg-special-mild)))
    `(sallet-regexp-match ((,class ,@(modus-themes--extra-completions
                                      'modus-theme-subtle-magenta
                                      'modus-theme-refine-magenta
                                      'modus-theme-nuanced-magenta
                                      magenta-alt-other))))
    `(sallet-source-header ((,class :inherit bold :foreground ,red-alt
                                    ,@(modus-themes--scale modus-themes-scale-4))))
    `(sallet-substring-match ((,class ,@(modus-themes--extra-completions
                                         'modus-theme-subtle-blue
                                         'modus-theme-refine-blue
                                         'modus-theme-nuanced-blue
                                         blue-alt-other))))
;;;;; selectrum
    `(selectrum-current-candidate
      ((,class :inherit bold :foreground ,fg-main
               :background ,@(pcase modus-themes-completions
                               ('opinionated (list bg-active))
                               (_ (list bg-inactive))))))
    `(selectrum-primary-highlight ((,class :inherit bold
                                           ,@(modus-themes--standard-completions
                                              magenta-alt magenta-nuanced-bg
                                              magenta-refine-bg magenta-refine-fg))))
    `(selectrum-secondary-highlight ((,class :inherit bold
                                             ,@(modus-themes--standard-completions
                                                cyan-alt-other cyan-nuanced-bg
                                                cyan-refine-bg cyan-refine-fg))))
;;;;; semantic
    `(semantic-complete-inline-face ((,class :foreground ,fg-special-warm :underline t)))
    `(semantic-decoration-on-fileless-includes ((,class :inherit modus-theme-refine-green)))
    `(semantic-decoration-on-private-members-face ((,class :inherit modus-theme-refine-cyan)))
    `(semantic-decoration-on-protected-members-face ((,class :background ,bg-dim)))
    `(semantic-decoration-on-unknown-includes ((,class :inherit modus-theme-refine-red)))
    `(semantic-decoration-on-unparsed-includes ((,class :inherit modus-theme-refine-yellow)))
    `(semantic-highlight-edits-face ((,class :background ,bg-alt)))
    `(semantic-highlight-func-current-tag-face ((,class :background ,bg-alt)))
    `(semantic-idle-symbol-highlight ((,class :inherit modus-theme-special-mild)))
    `(semantic-tag-boundary-face ((,class :overline ,blue-intense)))
    `(semantic-unmatched-syntax-face ((,class :underline ,fg-lang-error)))
;;;;; sesman
    `(sesman-browser-button-face ((,class :foreground ,blue-alt-other :underline t)))
    `(sesman-browser-highligh-face ((,class :inherit modus-theme-subtle-blue)))
    `(sesman-buffer-face ((,class :foreground ,magenta)))
    `(sesman-directory-face ((,class :inherit bold :foreground ,blue)))
    `(sesman-project-face ((,class :inherit bold :foreground ,magenta-alt-other)))
;;;;; shell-script-mode
    `(sh-heredoc ((,class :foreground ,blue-alt)))
    `(sh-quoted-exec ((,class :inherit modus-theme-bold :foreground ,magenta-alt)))
;;;;; show-paren-mode
    `(show-paren-match ((,class ,@(modus-themes--paren bg-paren-match
                                                       bg-paren-match-intense)
                                :foreground ,fg-main)))
    `(show-paren-match-expression ((,class :inherit modus-theme-special-calm)))
    `(show-paren-mismatch ((,class :inherit modus-theme-intense-red)))
;;;;; shr
    `(shr-abbreviation
      ((,(append '((supports :underline (:style wave))) class)
        :foreground ,fg-docstring :underline (:color ,fg-alt :style wave))
       (,class :foreground ,fg-docstring :underline t)))
    `(shr-selected-link ((,class :inherit modus-theme-subtle-cyan)))
;;;;; side-notes
    `(side-notes ((,class :background ,bg-dim :foreground ,fg-dim)))
;;;;; sieve-mode
    `(sieve-action-commands ((,class :inherit font-lock-builtin-face)))
    `(sieve-control-commands ((,class :inherit font-lock-keyword-face)))
    `(sieve-tagged-arguments ((,class :inherit font-lock-type-face)))
    `(sieve-test-commands ((,class :inherit font-lock-function-name-face)))
;;;;; skewer-mode
    `(skewer-error-face ((,class :foreground ,red :underline t)))
;;;;; smart-mode-line
    `(sml/charging ((,class :foreground ,green-active)))
    `(sml/discharging ((,class :foreground ,red-active)))
    `(sml/filename ((,class :inherit bold :foreground ,blue-active)))
    `(sml/folder ((,class :foreground ,fg-active)))
    `(sml/git ((,class :inherit bold :foreground ,green-active)))
    `(sml/global ((,class :foreground ,fg-active)))
    `(sml/line-number ((,class :inherit sml/global)))
    `(sml/minor-modes ((,class :inherit sml/global)))
    `(sml/modes ((,class :inherit bold :foreground ,fg-active)))
    `(sml/modified ((,class :inherit bold :foreground ,magenta-active)))
    `(sml/mule-info ((,class :inherit sml/global)))
    `(sml/name-filling ((,class :foreground ,yellow-active)))
    `(sml/not-modified ((,class :inherit sml/global)))
    `(sml/numbers-separator ((,class :inherit sml/global)))
    `(sml/outside-modified ((,class :inherit modus-theme-intense-red)))
    `(sml/position-percentage ((,class :inherit sml/global)))
    `(sml/prefix ((,class :foreground ,green-active)))
    `(sml/process ((,class :inherit sml/prefix)))
    `(sml/projectile ((,class :inherit sml/git)))
    `(sml/read-only ((,class :inherit bold :foreground ,cyan-active)))
    `(sml/remote ((,class :inherit sml/global)))
    `(sml/sudo ((,class :inherit modus-theme-subtle-red)))
    `(sml/time ((,class :inherit sml/global)))
    `(sml/vc ((,class :inherit sml/git)))
    `(sml/vc-edited ((,class :inherit bold :foreground ,yellow-active)))
;;;;; smartparens
    `(sp-pair-overlay-face ((,class :inherit modus-theme-special-warm)))
    `(sp-show-pair-enclosing ((,class :inherit modus-theme-special-mild)))
    `(sp-show-pair-match-face ((,class ,@(modus-themes--paren bg-paren-match
                                                              bg-paren-match-intense)
                                       :foreground ,fg-main)))
    `(sp-show-pair-mismatch-face ((,class :inherit modus-theme-intense-red)))
    `(sp-wrap-overlay-closing-pair ((,class :inherit sp-pair-overlay-face)))
    `(sp-wrap-overlay-face ((,class :inherit sp-pair-overlay-face)))
    `(sp-wrap-overlay-opening-pair ((,class :inherit sp-pair-overlay-face)))
    `(sp-wrap-tag-overlay-face ((,class :inherit sp-pair-overlay-face)))
;;;;; smerge
    `(smerge-base ((,class :inherit modus-theme-diff-changed)))
    `(smerge-lower ((,class :inherit modus-theme-diff-added)))
    `(smerge-markers ((,class :background ,bg-diff-neutral-2 :foreground ,fg-diff-neutral-2)))
    `(smerge-refined-added ((,class :inherit modus-theme-diff-refine-added)))
    `(smerge-refined-changed ((,class)))
    `(smerge-refined-removed ((,class :inherit modus-theme-diff-refine-removed)))
    `(smerge-upper ((,class :inherit modus-theme-diff-removed)))
;;;;; solaire
    `(solaire-default-face ((,class :inherit default :background ,bg-alt :foreground ,fg-dim)))
    `(solaire-line-number-face ((,class :inherit solaire-default-face :foreground ,fg-unfocused)))
    `(solaire-hl-line-face ((,class :background ,bg-active)))
    `(solaire-org-hide-face ((,class :background ,bg-alt :foreground ,bg-alt)))
;;;;; spaceline
    `(spaceline-evil-emacs ((,class :inherit modus-theme-active-magenta)))
    `(spaceline-evil-insert ((,class :inherit modus-theme-active-green)))
    `(spaceline-evil-motion ((,class :inherit modus-theme-active-blue)))
    `(spaceline-evil-normal ((,class :background ,fg-alt :foreground ,bg-alt)))
    `(spaceline-evil-replace ((,class :inherit modus-theme-active-red)))
    `(spaceline-evil-visual ((,class :inherit modus-theme-active-cyan)))
    `(spaceline-flycheck-error ((,class :foreground ,red-active)))
    `(spaceline-flycheck-info ((,class :foreground ,cyan-active)))
    `(spaceline-flycheck-warning ((,class :foreground ,yellow-active)))
    `(spaceline-highlight-face ((,class :inherit modus-theme-fringe-blue)))
    `(spaceline-modified ((,class :inherit modus-theme-fringe-magenta)))
    `(spaceline-python-venv ((,class :foreground ,magenta-active)))
    `(spaceline-read-only ((,class :inherit modus-theme-fringe-red)))
    `(spaceline-unmodified ((,class :inherit modus-theme-fringe-cyan)))
;;;;; speedbar
    `(speedbar-button-face ((,class :inherit button)))
    `(speedbar-directory-face ((,class :inherit bold :foreground ,blue)))
    `(speedbar-file-face ((,class :foreground ,fg-main)))
    `(speedbar-highlight-face ((,class :inherit modus-theme-subtle-blue)))
    `(speedbar-selected-face ((,class :inherit bold :foreground ,cyan)))
    `(speedbar-separator-face ((,class :inherit modus-theme-intense-neutral)))
    `(speedbar-tag-face ((,class :foreground ,yellow-alt-other)))
;;;;; spell-fu
    `(spell-fu-incorrect-face ((,class :inherit modus-theme-lang-error)))
;;;;; stripes
    `(stripes ((,class :inherit modus-theme-hl-line)))
;;;;; success
    `(suggest-heading ((,class :inherit bold :foreground ,yellow-alt-other)))
;;;;; switch-window
    `(switch-window-background ((,class :background ,bg-dim)))
    `(switch-window-label ((,class :height 3.0 :foreground ,blue-intense)))
;;;;; swiper
    `(swiper-background-match-face-1 ((,class :inherit modus-theme-subtle-neutral)))
    `(swiper-background-match-face-2 ((,class :inherit modus-theme-refine-cyan)))
    `(swiper-background-match-face-3 ((,class :inherit modus-theme-refine-magenta)))
    `(swiper-background-match-face-4 ((,class :inherit modus-theme-refine-yellow)))
    `(swiper-line-face ((,class :inherit modus-theme-special-cold)))
    `(swiper-match-face-1 ((,class :inherit (bold modus-theme-intense-neutral))))
    `(swiper-match-face-2 ((,class :inherit (bold modus-theme-intense-green))))
    `(swiper-match-face-3 ((,class :inherit (bold modus-theme-intense-blue))))
    `(swiper-match-face-4 ((,class :inherit (bold modus-theme-intense-red))))
;;;;; swoop
    `(swoop-face-header-format-line ((,class :inherit bold :foreground ,red-alt
                                             ,@(modus-themes--scale modus-themes-scale-3))))
    `(swoop-face-line-buffer-name ((,class :inherit bold :foreground ,blue-alt
                                           ,@(modus-themes--scale modus-themes-scale-4))))
    `(swoop-face-line-number ((,class :foreground ,fg-special-warm)))
    `(swoop-face-target-line ((,class :inherit modus-theme-intense-blue :extend t)))
    `(swoop-face-target-words ((,class :inherit modus-theme-refine-cyan)))
;;;;; sx
    `(sx-inbox-item-type ((,class :foreground ,magenta-alt-other)))
    `(sx-inbox-item-type-unread ((,class :inherit (sx-inbox-item-type bold))))
    `(sx-question-list-answers ((,class :foreground ,green)))
    `(sx-question-list-answers-accepted ((,class :box t :foreground ,green)))
    `(sx-question-list-bounty ((,class :inherit bold :background ,bg-alt :foreground ,yellow)))
    `(sx-question-list-date ((,class :foreground ,fg-special-cold)))
    `(sx-question-list-favorite ((,class :inherit bold :foreground ,fg-special-warm)))
    `(sx-question-list-parent ((,class :foreground ,fg-main)))
    `(sx-question-list-read-question ((,class :inherit shadow)))
    `(sx-question-list-score ((,class :foreground ,fg-special-mild)))
    `(sx-question-list-score-upvoted ((,class :inherit (sx-question-list-score bold))))
    `(sx-question-list-unread-question ((,class :inherit bold :foreground ,fg-main)))
    `(sx-question-mode-accepted ((,class :inherit bold :height 1.3 :foreground ,green)))
    `(sx-question-mode-closed ((,class :inherit modus-theme-active-yellow :box (:line-width 2 :color nil))))
    `(sx-question-mode-closed-reason ((,class :box (:line-width 2 :color nil) :foreground ,fg-main)))
    `(sx-question-mode-content-face ((,class :background ,bg-dim)))
    `(sx-question-mode-date ((,class :foreground ,blue)))
    `(sx-question-mode-header ((,class :inherit bold :foreground ,cyan)))
    `(sx-question-mode-kbd-tag ((,class :inherit bold :height 0.9 :box (:line-width 3 :color ,fg-main :style released-button) :foreground ,fg-main)))
    `(sx-question-mode-score ((,class :foreground ,fg-dim)))
    `(sx-question-mode-score-downvoted ((,class :foreground ,yellow)))
    `(sx-question-mode-score-upvoted ((,class :inherit bold :foreground ,magenta)))
    `(sx-question-mode-title ((,class :inherit bold :foreground ,fg-main)))
    `(sx-question-mode-title-comments ((,class :inherit bold :foreground ,fg-alt)))
    `(sx-tag ((,class :foreground ,magenta-alt)))
    `(sx-user-name ((,class :foreground ,blue-alt)))
    `(sx-user-reputation ((,class :inherit shadow)))
;;;;; symbol-overlay
    `(symbol-overlay-default-face ((,class :inherit modus-theme-special-warm)))
    `(symbol-overlay-face-1 ((,class :inherit modus-theme-intense-blue)))
    `(symbol-overlay-face-2 ((,class :inherit modus-theme-refine-magenta)))
    `(symbol-overlay-face-3 ((,class :inherit modus-theme-intense-yellow)))
    `(symbol-overlay-face-4 ((,class :inherit modus-theme-intense-magenta)))
    `(symbol-overlay-face-5 ((,class :inherit modus-theme-intense-red)))
    `(symbol-overlay-face-6 ((,class :inherit modus-theme-refine-red)))
    `(symbol-overlay-face-7 ((,class :inherit modus-theme-intense-cyan)))
    `(symbol-overlay-face-8 ((,class :inherit modus-theme-refine-cyan)))
;;;;; syslog-mode
    `(syslog-debug ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(syslog-error ((,class :inherit bold :foreground ,red)))
    `(syslog-file ((,class :inherit bold :foreground ,fg-special-cold)))
    `(syslog-hide ((,class :background ,bg-main :foreground ,fg-main)))
    `(syslog-hour ((,class :inherit bold :foreground ,magenta-alt-other)))
    `(syslog-info ((,class :inherit bold :foreground ,blue-alt-other)))
    `(syslog-ip ((,class :inherit bold :foreground ,fg-special-mild :underline t)))
    `(syslog-su ((,class :inherit bold :foreground ,red-alt)))
    `(syslog-warn ((,class :inherit bold :foreground ,yellow)))
;;;;; tab-bar-mode
    `(tab-bar ((,class :background ,bg-tab-bar :foreground ,fg-main)))
    `(tab-bar-tab ((,class :inherit bold :box (:line-width 2 :color ,bg-tab-active)
                           :background ,bg-tab-active :foreground ,fg-main)))
    `(tab-bar-tab-inactive ((,class :box (:line-width 2 :color ,bg-tab-inactive)
                                    :background ,bg-tab-inactive :foreground ,fg-dim)))
;;;;; tab-line-mode
    `(tab-line ((,class :height 0.95 :background ,bg-tab-bar :foreground ,fg-main)))
    `(tab-line-close-highlight ((,class :foreground ,red)))
    `(tab-line-highlight ((,class :background ,blue-subtle-bg :foreground ,fg-dim)))
    `(tab-line-tab ((,class :inherit bold :box (:line-width 2 :color ,bg-tab-active)
                            :background ,bg-tab-active :foreground ,fg-main)))
    `(tab-line-tab-current ((,class :inherit tab-line-tab)))
    `(tab-line-tab-inactive ((,class :box (:line-width 2 :color ,bg-tab-inactive)
                                     :background ,bg-tab-inactive :foreground ,fg-dim)))
;;;;; table (built-in table.el)
    `(table-cell ((,class :background ,blue-nuanced-bg)))
;;;;; telephone-line
    `(telephone-line-accent-active ((,class :background ,fg-inactive :foreground ,bg-inactive)))
    `(telephone-line-accent-inactive ((,class :background ,bg-active :foreground ,fg-active)))
    `(telephone-line-error ((,class :inherit bold :foreground ,red-active)))
    `(telephone-line-evil ((,class :foreground ,fg-main)))
    `(telephone-line-evil-emacs ((,class :inherit telephone-line-evil :background ,magenta-intense-bg)))
    `(telephone-line-evil-insert ((,class :inherit telephone-line-evil :background ,green-intense-bg)))
    `(telephone-line-evil-motion ((,class :inherit telephone-line-evil :background ,yellow-intense-bg)))
    `(telephone-line-evil-normal ((,class :inherit telephone-line-evil :background ,bg-alt)))
    `(telephone-line-evil-operator ((,class :inherit telephone-line-evil :background ,yellow-subtle-bg)))
    `(telephone-line-evil-replace ((,class :inherit telephone-line-evil :background ,red-intense-bg)))
    `(telephone-line-evil-visual ((,class :inherit telephone-line-evil :background ,cyan-intense-bg)))
    `(telephone-line-projectile ((,class :foreground ,cyan-active)))
    `(telephone-line-unimportant ((,class :foreground ,fg-inactive)))
    `(telephone-line-warning ((,class :inherit bold :foreground ,yellow-active)))
;;;;; term
    `(term ((,class :background ,bg-main :foreground ,fg-main)))
    `(term-bold ((,class :inherit bold)))
    `(term-color-black ((,class :background "gray35" :foreground "gray35")))
    `(term-color-blue ((,class :background ,blue :foreground ,blue)))
    `(term-color-cyan ((,class :background ,cyan :foreground ,cyan)))
    `(term-color-green ((,class :background ,green :foreground ,green)))
    `(term-color-magenta ((,class :background ,magenta :foreground ,magenta)))
    `(term-color-red ((,class :background ,red :foreground ,red)))
    `(term-color-white ((,class :background "gray65" :foreground "gray65")))
    `(term-color-yellow ((,class :background ,yellow :foreground ,yellow)))
    `(term-underline ((,class :underline t)))
;;;;; tomatinho
    `(tomatinho-ok-face ((,class :foreground ,blue-intense)))
    `(tomatinho-pause-face ((,class :foreground ,yellow-intense)))
    `(tomatinho-reset-face ((,class :inherit shadow)))
;;;;; transient
    `(transient-active-infix ((,class :inherit modus-theme-special-mild)))
    `(transient-amaranth ((,class :inherit bold :foreground ,yellow)))
    `(transient-argument ((,class :inherit bold :foreground ,red-alt)))
    `(transient-blue ((,class :inherit bold :foreground ,blue)))
    `(transient-disabled-suffix ((,class :inherit modus-theme-intense-red)))
    `(transient-enabled-suffix ((,class :inherit modus-theme-intense-green)))
    `(transient-heading ((,class :inherit bold :foreground ,fg-main)))
    `(transient-inactive-argument ((,class :inherit shadow)))
    `(transient-inactive-value ((,class :inherit shadow)))
    `(transient-key ((,class :inherit bold :foreground ,blue)))
    `(transient-mismatched-key ((,class :underline t)))
    `(transient-nonstandard-key ((,class :underline t)))
    `(transient-pink ((,class :inherit bold :foreground ,magenta)))
    `(transient-red ((,class :inherit bold :foreground ,red-intense)))
    `(transient-teal ((,class :inherit bold :foreground ,cyan-alt-other)))
    `(transient-unreachable ((,class :foreground ,fg-unfocused)))
    `(transient-unreachable-key ((,class :foreground ,fg-unfocused)))
    `(transient-value ((,class :inherit bold :foreground ,magenta-alt-other)))
;;;;; trashed
    `(trashed-deleted ((,class :inherit modus-theme-mark-del)))
    `(trashed-directory ((,class :foreground ,blue)))
    `(trashed-mark ((,class :inherit modus-theme-mark-symbol)))
    `(trashed-marked ((,class :inherit modus-theme-mark-alt)))
    `(trashed-restored ((,class :inherit modus-theme-mark-sel)))
    `(trashed-symlink ((,class :inherit button
                               ,@(modus-themes--link-color
                                  cyan-alt cyan-alt-faint))))
;;;;; treemacs
    `(treemacs-directory-collapsed-face ((,class :foreground ,magenta-alt)))
    `(treemacs-directory-face ((,class :inherit dired-directory)))
    `(treemacs-file-face ((,class :foreground ,fg-main)))
    `(treemacs-fringe-indicator-face ((,class :foreground ,fg-main)))
    `(treemacs-git-added-face ((,class :foreground ,green-intense)))
    `(treemacs-git-conflict-face ((,class :inherit (modus-theme-intense-red bold))))
    `(treemacs-git-ignored-face ((,class :inherit shadow)))
    `(treemacs-git-modified-face ((,class :foreground ,yellow-alt-other)))
    `(treemacs-git-renamed-face ((,class :foreground ,cyan-alt-other)))
    `(treemacs-git-unmodified-face ((,class :foreground ,fg-main)))
    `(treemacs-git-untracked-face ((,class :foreground ,red-alt-other)))
    `(treemacs-help-column-face ((,class :inherit modus-theme-bold :foreground ,magenta-alt-other :underline t)))
    `(treemacs-help-title-face ((,class :foreground ,blue-alt-other)))
    `(treemacs-on-failure-pulse-face ((,class :inherit modus-theme-intense-red)))
    `(treemacs-on-success-pulse-face ((,class :inherit modus-theme-intense-green)))
    `(treemacs-root-face ((,class :inherit bold :foreground ,blue-alt-other :height 1.2 :underline t)))
    `(treemacs-root-remote-disconnected-face ((,class :inherit treemacs-root-remote-face :foreground ,yellow)))
    `(treemacs-root-remote-face ((,class :inherit treemacs-root-face :foreground ,magenta)))
    `(treemacs-root-remote-unreadable-face ((,class :inherit treemacs-root-unreadable-face)))
    `(treemacs-root-unreadable-face ((,class :inherit treemacs-root-face :strike-through t)))
    `(treemacs-tags-face ((,class :foreground ,blue-alt)))
    `(treemacs-tags-face ((,class :foreground ,magenta-alt)))
;;;;; tty-menu
    `(tty-menu-disabled-face ((,class :background ,bg-alt :foreground ,fg-alt)))
    `(tty-menu-enabled-face ((,class :inherit bold :background ,bg-alt :foreground ,fg-main)))
    `(tty-menu-selected-face ((,class :inherit modus-theme-intense-blue)))
;;;;; tuareg
    `(caml-types-def-face ((,class :inherit modus-theme-subtle-red)))
    `(caml-types-expr-face ((,class :inherit modus-theme-subtle-green)))
    `(caml-types-occ-face ((,class :inherit modus-theme-subtle-green)))
    `(caml-types-scope-face ((,class :inherit modus-theme-subtle-blue)))
    `(caml-types-typed-face ((,class :inherit modus-theme-subtle-magenta)))
    `(tuareg-font-double-semicolon-face ((,class :inherit font-lock-preprocessor-face)))
    `(tuareg-font-lock-attribute-face ((,class :inherit font-lock-function-name-face)))
    `(tuareg-font-lock-constructor-face ((,class :foreground ,fg-main)))
    `(tuareg-font-lock-error-face ((,class :inherit (modus-theme-intense-red bold))))
    `(tuareg-font-lock-extension-node-face ((,class :background ,bg-alt :foreground ,magenta)))
    `(tuareg-font-lock-governing-face ((,class :inherit bold :foreground ,fg-main)))
    `(tuareg-font-lock-infix-extension-node-face ((,class :inherit font-lock-function-name-face)))
    `(tuareg-font-lock-interactive-directive-face ((,class :foreground ,fg-special-cold)))
    `(tuareg-font-lock-interactive-error-face ((,class :inherit error)))
    `(tuareg-font-lock-interactive-output-face ((,class :inherit font-lock-constant-face)))
    `(tuareg-font-lock-label-face ((,class :inherit font-lock-type-face)))
    `(tuareg-font-lock-line-number-face ((,class :foreground ,fg-special-warm)))
    `(tuareg-font-lock-module-face ((,class :inherit font-lock-builtin-face)))
    `(tuareg-font-lock-multistage-face ((,class :inherit bold :background ,bg-alt :foreground ,blue)))
    `(tuareg-font-lock-operator-face ((,class :inherit font-lock-preprocessor-face)))
    `(tuareg-opam-error-face ((,class :inherit error)))
    `(tuareg-opam-pkg-variable-name-face ((,class :inherit font-lock-variable-name-face)))
;;;;; typescript
    `(typescript-jsdoc-tag ((,class :inherit modus-theme-slant :foreground ,fg-special-mild)))
    `(typescript-jsdoc-type ((,class :inherit modus-theme-slant :foreground ,fg-special-calm)))
    `(typescript-jsdoc-value ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
;;;;; undo-tree
    `(undo-tree-visualizer-active-branch-face ((,class :inherit bold :foreground ,fg-main)))
    `(undo-tree-visualizer-current-face ((,class :foreground ,blue-intense)))
    `(undo-tree-visualizer-default-face ((,class :inherit shadow)))
    `(undo-tree-visualizer-register-face ((,class :foreground ,magenta-intense)))
    `(undo-tree-visualizer-unmodified-face ((,class :foreground ,green-intense)))
;;;;; vc (vc-hooks.el)
    `(vc-conflict-state ((,class :inherit modus-theme-slant :foreground ,red-active)))
    `(vc-edited-state ((,class :foreground ,yellow-active)))
    `(vc-locally-added-state ((,class :foreground ,cyan-active)))
    `(vc-locked-state ((,class :foreground ,blue-active)))
    `(vc-missing-state ((,class :inherit modus-theme-slant :foreground ,magenta-active)))
    `(vc-needs-update-state ((,class :inherit modus-theme-slant :foreground ,green-active)))
    `(vc-removed-state ((,class :foreground ,red-active)))
    `(vc-state-base ((,class :foreground ,fg-active)))
    `(vc-up-to-date-state ((,class :foreground ,fg-special-cold)))
;;;;; vdiff
    `(vdiff-addition-face ((,class :inherit modus-theme-diff-added)))
    `(vdiff-change-face ((,class :inherit modus-theme-diff-changed)))
    `(vdiff-closed-fold-face ((,class :background ,bg-diff-neutral-1 :foreground ,fg-diff-neutral-1)))
    `(vdiff-refine-added ((,class :inherit modus-theme-diff-refine-added)))
    `(vdiff-refine-changed ((,class :inherit modus-theme-diff-refine-changed)))
    `(vdiff-subtraction-face ((,class :inherit modus-theme-diff-removed)))
    `(vdiff-target-face ((,class :inherit modus-theme-intense-blue)))
;;;;; vimish-fold
    `(vimish-fold-fringe ((,class :foreground ,cyan-active)))
    `(vimish-fold-mouse-face ((,class :inherit modus-theme-intense-blue)))
    `(vimish-fold-overlay ((,class :background ,bg-alt :foreground ,fg-special-cold)))
;;;;; visible-mark
    `(visible-mark-active ((,class :background ,blue-intense-bg)))
    `(visible-mark-face1 ((,class :background ,cyan-intense-bg)))
    `(visible-mark-face2 ((,class :background ,yellow-intense-bg)))
    `(visible-mark-forward-face1 ((,class :background ,magenta-intense-bg)))
    `(visible-mark-forward-face2 ((,class :background ,green-intense-bg)))
;;;;; visual-regexp
    `(vr/group-0 ((,class :inherit modus-theme-intense-blue)))
    `(vr/group-1 ((,class :inherit modus-theme-intense-magenta)))
    `(vr/group-2 ((,class :inherit modus-theme-intense-green)))
    `(vr/match-0 ((,class :inherit modus-theme-refine-yellow)))
    `(vr/match-1 ((,class :inherit modus-theme-refine-yellow)))
    `(vr/match-separator-face ((,class :inherit (modus-theme-intense-neutral bold))))
;;;;; volatile-highlights
    `(vhl/default-face ((,class :background ,bg-alt :foreground ,blue-nuanced-fg :extend t)))
;;;;; vterm
    `(vterm-color-black ((,class :background "gray35" :foreground "gray35")))
    `(vterm-color-blue ((,class :background ,blue :foreground ,blue)))
    `(vterm-color-cyan ((,class :background ,cyan :foreground ,cyan)))
    `(vterm-color-default ((,class :background ,bg-main :foreground ,fg-main)))
    `(vterm-color-green ((,class :background ,green :foreground ,green)))
    `(vterm-color-inverse-video ((,class :background ,bg-main :inverse-video t)))
    `(vterm-color-magenta ((,class :background ,magenta :foreground ,magenta)))
    `(vterm-color-red ((,class :background ,red :foreground ,red)))
    `(vterm-color-underline ((,class :foreground ,fg-special-warm :underline t)))
    `(vterm-color-white ((,class :background "gray65" :foreground "gray65")))
    `(vterm-color-yellow ((,class :background ,yellow :foreground ,yellow)))
;;;;; wcheck-mode
    `(wcheck-default-face ((,class :foreground ,red :underline t)))
;;;;; web-mode
    `(web-mode-annotation-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-annotation-html-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-annotation-tag-face ((,class :inherit web-mode-comment-face :underline t)))
    `(web-mode-block-attr-name-face ((,class :inherit font-lock-constant-face)))
    `(web-mode-block-attr-value-face ((,class :inherit font-lock-type-face)))
    `(web-mode-block-comment-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-block-control-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-block-delimiter-face ((,class :foreground ,fg-main)))
    `(web-mode-block-face ((,class :background ,bg-dim)))
    `(web-mode-block-string-face ((,class :inherit web-mode-string-face)))
    `(web-mode-bold-face ((,class :inherit bold)))
    `(web-mode-builtin-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-comment-face ((,class :inherit font-lock-comment-face)))
    `(web-mode-comment-keyword-face ((,class :inherit font-lock-warning-face)))
    `(web-mode-constant-face ((,class :inherit font-lock-constant-face)))
    `(web-mode-css-at-rule-face ((,class :inherit font-lock-constant-face)))
    `(web-mode-css-color-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-css-comment-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-css-function-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-css-priority-face ((,class :inherit font-lock-warning-face)))
    `(web-mode-css-property-name-face ((,class :inherit font-lock-keyword-face)))
    `(web-mode-css-pseudo-class-face ((,class :inherit font-lock-doc-face)))
    `(web-mode-css-selector-face ((,class :inherit font-lock-keyword-face)))
    `(web-mode-css-string-face ((,class :inherit web-mode-string-face)))
    `(web-mode-css-variable-face ((,class :foreground ,fg-special-warm)))
    `(web-mode-current-column-highlight-face ((,class :background ,bg-alt)))
    `(web-mode-current-element-highlight-face ((,class :inherit modus-theme-special-mild)))
    `(web-mode-doctype-face ((,class :inherit modus-theme-slant :foreground ,fg-special-cold)))
    `(web-mode-error-face ((,class :inherit modus-theme-intense-red)))
    `(web-mode-filter-face ((,class :inherit font-lock-function-name-face)))
    `(web-mode-folded-face ((,class :underline t)))
    `(web-mode-function-call-face ((,class :inherit font-lock-function-name-face)))
    `(web-mode-function-name-face ((,class :inherit font-lock-function-name-face)))
    `(web-mode-html-attr-custom-face ((,class :inherit font-lock-variable-name-face)))
    `(web-mode-html-attr-engine-face ((,class :foreground ,fg-main)))
    `(web-mode-html-attr-equal-face ((,class :foreground ,fg-main)))
    `(web-mode-html-attr-name-face ((,class :inherit font-lock-variable-name-face)))
    `(web-mode-html-attr-value-face ((,class :inherit font-lock-constant-face)))
    `(web-mode-html-entity-face ((,class :inherit font-lock-negation-char-face)))
    `(web-mode-html-tag-bracket-face ((,class :foreground ,fg-dim)))
    `(web-mode-html-tag-custom-face ((,class :inherit font-lock-function-name-face)))
    `(web-mode-html-tag-face ((,class :inherit font-lock-function-name-face)))
    `(web-mode-html-tag-namespaced-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-html-tag-unclosed-face ((,class :inherit error :underline t)))
    `(web-mode-inlay-face ((,class :background ,bg-alt)))
    `(web-mode-italic-face ((,class :inherit italic)))
    `(web-mode-javascript-comment-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-javascript-string-face ((,class :inherit web-mode-string-face)))
    `(web-mode-json-comment-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-json-context-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-json-key-face ((,class :foreground ,blue-nuanced-fg)))
    `(web-mode-json-string-face ((,class :inherit web-mode-string-face)))
    `(web-mode-jsx-depth-1-face ((,class :background ,blue-intense-bg :foreground ,fg-main)))
    `(web-mode-jsx-depth-2-face ((,class :background ,blue-subtle-bg :foreground ,fg-main)))
    `(web-mode-jsx-depth-3-face ((,class :background ,bg-special-cold :foreground ,fg-special-cold)))
    `(web-mode-jsx-depth-4-face ((,class :background ,bg-alt :foreground ,blue-refine-fg)))
    `(web-mode-jsx-depth-5-face ((,class :background ,bg-alt :foreground ,blue-nuanced-fg)))
    `(web-mode-keyword-face ((,class :inherit :inherit font-lock-keyword-face)))
    `(web-mode-param-name-face ((,class :inherit font-lock-function-name-face)))
    `(web-mode-part-comment-face ((,class :inherit web-mode-comment-face)))
    `(web-mode-part-face ((,class :inherit web-mode-block-face)))
    `(web-mode-part-string-face ((,class :inherit web-mode-string-face)))
    `(web-mode-preprocessor-face ((,class :inherit font-lock-preprocessor-face)))
    `(web-mode-script-face ((,class :inherit web-mode-part-face)))
    `(web-mode-sql-keyword-face ((,class :inherit font-lock-negation-char-face)))
    `(web-mode-string-face ((,class :inherit font-lock-string-face)))
    `(web-mode-style-face ((,class :inherit web-mode-part-face)))
    `(web-mode-symbol-face ((,class :inherit font-lock-constant-face)))
    `(web-mode-type-face ((,class :inherit font-lock-builtin-face)))
    `(web-mode-underline-face ((,class :underline t)))
    `(web-mode-variable-name-face ((,class :inherit font-lock-variable-name-face)))
    `(web-mode-warning-face ((,class :inherit font-lock-warning-face)))
    `(web-mode-whitespace-face ((,class :background ,bg-whitespace :foreground ,fg-whitespace)))
;;;;; wgrep
    `(wgrep-delete-face ((,class :inherit modus-theme-refine-yellow)))
    `(wgrep-done-face ((,class :inherit modus-theme-refine-blue)))
    `(wgrep-face ((,class :inherit modus-theme-refine-green)))
    `(wgrep-file-face ((,class :foreground ,fg-special-warm)))
    `(wgrep-reject-face ((,class :inherit (modus-theme-intense-red bold))))
;;;;; which-function-mode
    `(which-func ((,class :foreground ,magenta-active)))
;;;;; which-key
    `(which-key-command-description-face ((,class :foreground ,cyan)))
    `(which-key-group-description-face ((,class :foreground ,magenta-alt)))
    `(which-key-highlighted-command-face ((,class :foreground ,cyan-alt :underline t)))
    `(which-key-key-face ((,class :inherit bold :foreground ,blue-intense)))
    `(which-key-local-map-description-face ((,class :foreground ,fg-main)))
    `(which-key-note-face ((,class :background ,bg-dim :foreground ,fg-special-mild)))
    `(which-key-separator-face ((,class :inherit shadow)))
    `(which-key-special-key-face ((,class :inherit bold :foreground ,yellow-intense)))
;;;;; whitespace-mode
    `(whitespace-big-indent ((,class :inherit modus-theme-subtle-red)))
    `(whitespace-empty ((,class :inherit modus-theme-intense-magenta)))
    `(whitespace-hspace ((,class :background ,bg-whitespace :foreground ,fg-whitespace)))
    `(whitespace-indentation ((,class :background ,bg-whitespace :foreground ,fg-whitespace)))
    `(whitespace-line ((,class :background ,bg-alt)))
    `(whitespace-newline ((,class :background ,bg-whitespace :foreground ,fg-whitespace)))
    `(whitespace-space ((,class :background ,bg-whitespace :foreground ,fg-whitespace)))
    `(whitespace-space-after-tab ((,class :inherit modus-theme-subtle-magenta)))
    `(whitespace-space-before-tab ((,class :inherit modus-theme-subtle-cyan)))
    `(whitespace-tab ((,class :inherit modus-theme-subtle-green)))
    `(whitespace-trailing ((,class :inherit modus-theme-intense-red)))
;;;;; window-divider-mode
    `(window-divider ((,class :foreground ,fg-window-divider-inner)))
    `(window-divider-first-pixel ((,class :foreground ,fg-window-divider-outer)))
    `(window-divider-last-pixel ((,class :foreground ,fg-window-divider-outer)))
;;;;; winum
    `(winum-face ((,class :inherit modus-theme-bold :foreground ,cyan-active)))
;;;;; writegood-mode
    `(writegood-duplicates-face ((,class :background ,bg-alt :foreground ,red-alt :underline t)))
    `(writegood-passive-voice-face ((,class :inherit modus-theme-lang-warning)))
    `(writegood-weasels-face ((,class :inherit modus-theme-lang-error)))
;;;;; woman
    `(woman-addition ((,class :foreground ,magenta-alt-other)))
    `(woman-bold ((,class :inherit bold :foreground ,magenta)))
    `(woman-italic ((,class :inherit italic :foreground ,cyan)))
    `(woman-unknown ((,class :inherit italic :foreground ,yellow)))
;;;;; xah-elisp-mode
    `(xah-elisp-at-symbol ((,class :inherit font-lock-warning-face)))
    `(xah-elisp-cap-variable ((,class :inherit font-lock-preprocessor-face)))
    `(xah-elisp-command-face ((,class :inherit font-lock-type-face)))
    `(xah-elisp-dollar-symbol ((,class :inherit font-lock-variable-name-face)))
;;;;; xref
    `(xref-file-header ((,class :inherit bold :foreground ,fg-special-cold)))
    `(xref-line-number ((,class :inherit shadow)))
    `(xref-match ((,class :inherit match)))
;;;;; yaml-mode
    `(yaml-tab-face ((,class :inherit modus-theme-intense-red)))
;;;;; yasnippet
    `(yas-field-highlight-face ((,class :background ,bg-hl-alt-intense)))
;;;;; ztree
    `(ztreep-arrow-face ((,class :foreground ,fg-inactive)))
    `(ztreep-diff-header-face ((,class :inherit bold :height 1.2 :foreground ,fg-special-cold)))
    `(ztreep-diff-header-small-face ((,class :inherit bold :foreground ,fg-special-mild)))
    `(ztreep-diff-model-add-face ((,class :foreground ,green)))
    `(ztreep-diff-model-diff-face ((,class :foreground ,red)))
    `(ztreep-diff-model-ignored-face ((,class :inherit shadow :strike-through t)))
    `(ztreep-diff-model-normal-face ((,class :inherit shadow)))
    `(ztreep-expand-sign-face ((,class :foreground ,blue)))
    `(ztreep-header-face ((,class :inherit bold :height 1.2 :foreground ,fg-special-cold)))
    `(ztreep-leaf-face ((,class :foreground ,cyan)))
    `(ztreep-node-count-children-face ((,class :foreground ,fg-special-warm)))
    `(ztreep-node-face ((,class :foreground ,fg-main))))
  "Face specs for use with `modus-themes-theme'.")

(defconst modus-themes-custom-variables
  '(
;;;; ansi-colors
    `(ansi-color-faces-vector [default bold shadow italic underline success warning error])
    `(ansi-color-names-vector ["gray35" ,red ,green ,yellow ,blue ,magenta ,cyan "gray65"])
;;;; awesome-tray
    `(awesome-tray-mode-line-active-color ,blue)
    `(awesome-tray-mode-line-inactive-color ,bg-active)
;;;; exwm
    `(exwm-floating-border-color ,fg-window-divider-inner)
;;;; flymake fringe indicators
    `(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
    `(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
    `(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
;;;; ibuffer
    `(ibuffer-deletion-face 'modus-theme-mark-del)
    `(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
    `(ibuffer-marked-face 'modus-theme-mark-sel)
    `(ibuffer-title-face 'modus-theme-pseudo-header)
;;;; highlight-tail
    `(highlight-tail-colors
      '((,green-subtle-bg . 0)
        (,cyan-subtle-bg . 20)))
;;;; hl-todo
    `(hl-todo-keyword-faces
      '(("HOLD" . ,yellow-alt)
        ("TODO" . ,magenta)
        ("NEXT" . ,magenta-alt-other)
        ("THEM" . ,magenta-alt)
        ("PROG" . ,cyan)
        ("OKAY" . ,cyan-alt)
        ("DONT" . ,green-alt)
        ("FAIL" . ,red)
        ("BUG" . ,red)
        ("DONE" . ,green)
        ("NOTE" . ,yellow-alt-other)
        ("KLUDGE" . ,yellow)
        ("HACK" . ,yellow)
        ("TEMP" . ,red-nuanced-fg)
        ("FIXME" . ,red-alt-other)
        ("XXX+" . ,red-alt)
        ("REVIEW" . ,cyan-alt-other)
        ("DEPRECATED" . ,blue-nuanced-fg)))
;;;; pdf-tools
    `(pdf-view-midnight-colors
      '(,fg-main . ,bg-dim))
;;;; vc-annotate (C-x v g)
    `(vc-annotate-background nil)
    `(vc-annotate-background-mode nil)
    `(vc-annotate-color-map
      '((20 . ,red)
        (40 . ,magenta)
        (60 . ,magenta-alt)
        (80 . ,red-alt)
        (100 . ,yellow)
        (120 . ,yellow-alt)
        (140 . ,fg-special-warm)
        (160 . ,fg-special-mild)
        (180 . ,green)
        (200 . ,green-alt)
        (220 . ,cyan-alt-other)
        (240 . ,cyan-alt)
        (260 . ,cyan)
        (280 . ,fg-special-cold)
        (300 . ,blue)
        (320 . ,blue-alt)
        (340 . ,blue-alt-other)
        (360 . ,magenta-alt-other)))
    `(vc-annotate-very-old-color nil)
;;;; xterm-color
    `(xterm-color-names ["black" ,red ,green ,yellow ,blue ,magenta ,cyan "gray65"])
    `(xterm-color-names-bright ["gray35" ,red-alt ,green-alt ,yellow-alt ,blue-alt ,magenta-alt ,cyan-alt "white"])
    (if (eq modus-themes-org-blocks 'rainbow)
        `(org-src-block-faces              ; TODO this list should be expanded
          `(("emacs-lisp" modus-theme-nuanced-magenta)
            ("elisp" modus-theme-nuanced-magenta)
            ("clojure" modus-theme-nuanced-magenta)
            ("clojurescript" modus-theme-nuanced-magenta)
            ("c" modus-theme-nuanced-blue)
            ("c++" modus-theme-nuanced-blue)
            ("sh" modus-theme-nuanced-green)
            ("shell" modus-theme-nuanced-green)
            ("html" modus-theme-nuanced-yellow)
            ("xml" modus-theme-nuanced-yellow)
            ("css" modus-theme-nuanced-red)
            ("scss" modus-theme-nuanced-red)
            ("python" modus-theme-nuanced-green)
            ("ipython" modus-theme-nuanced-magenta)
            ("r" modus-theme-nuanced-cyan)
            ("yaml" modus-theme-nuanced-cyan)
            ("conf" modus-theme-nuanced-cyan)
            ("docker" modus-theme-nuanced-cyan)))
      `(org-src-block-faces '())))
  "Custom variables for `modus-themes-theme'.")

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'modus-themes)
;;; modus-themes.el ends here
