(defpackage #:lem-mant-conf
  (:use #:cl #:lem :alexandria-2)
  (:import-from #:lem-lisp-mode
                 :lisp-mode
                 :current-connection
                 :buffer-package
                 :self-connection-p)
  (:import-from #:lem-lisp-mode/swank-protocol
                 :connection-pid
                 :connection-implementation-name)
  #+lem-sdl2 (:import-from #:lem-sdl2/display #:change-font)
  (:import-from #:lem/frame-multiplexer #:frame-multiplexer-active-frame-name-attribute
                                        #:frame-multiplexer-frame-name-attribute
                                        #:frame-multiplexer-background-attribute
                                        ;#:frame-multiplexer-create-with-new-buffer-list
  )
)
(in-package :lem-mant-conf)
;; now give more heap to the sbcl repl.
;; numcl needs 2048, and magicl needs 3072. yikes.
(setf lem-lisp-mode/implementation::*default-command* "sbcl --dynamic-space-size 2048")
;;; BEGIN CUSTOM IMPORTS ----------------------------------------------------------------------------
(let ((asdf:*central-registry* (cons #P"~/.lem/my-tweaks/" asdf:*central-registry*)))
  ()
)

;;; END CUSTOM IMPORTS ------------------------------------------------------------------------------
;;; BEGIN KEYBINDINGS -------------------------------------------------------------------------------
(define-keys lem:*global-keymap* 
  ("C-c c"               'lem-core/commands/edit:copy-region-to-clipboard)
  ("C-c v"               'lem-core/commands/edit:paste-from-clipboard)
  
  ("C-<"                 'lem-core/commands/edit:undo)
  ("C->"                 'lem-core/commands/edit:redo)
  
  ;("C-b n"               'lem/frame-multiplexer:frame-multiplexer-create-with-new-buffer-list)
  
  ("Shift-Right"         'grow-window-horizontally)
  ("Shift-Left"          'shrink-window-horizontally)
  ("Shift-Up"            'grow-window)
  ("Shift-Down"          'shrink-window)
  ("M-m Right"           'window-move-right)
  ("M-m Left"            'window-move-left)
  ("M-m Up"              'window-move-up)
  ("M-m Down"            'window-move-down)
  ("C-["                 'split-active-window-vertically)
  ("C-]"                 'split-active-window-horizontally)
)

;;; END KEYBINDINGS ---------------------------------------------------------------------------------

;;; BEGIN THEMES ------------------------------------------------------------------------------------
;; Define the line-wrap indicator
(setf (variable-value 'wrap-line-character :global) #\↩)

(define-color-theme "oros" ()
  (:foreground "#8abaae")
  (:background "#232d2b")
    
  (cursor                                                                       :foreground "#232d2b" :background "#8abaae")
  (region                                                                       :foreground "#48af81" :background "#1b4136")
    
  (modeline                                                             :bold t :foreground "#8abaae" :background "#325146")
  (modeline-inactive                                                    :bold t :foreground "#4f705f" :background "#293b34")
  
  (lem/frame-multiplexer::frame-multiplexer-active-frame-name-attribute :bold t :foreground "#48af81" :background "#1b4136")
  (lem/frame-multiplexer::frame-multiplexer-frame-name-attribute                :foreground "#3d5a51" :background "#1d2a25")
  (lem/frame-multiplexer::frame-multiplexer-background-attribute                :foreground "#667e6c" :background "#182321")
    
  (syntax-warning-attribute                                                     :foreground "#f6294f" :background "#232d2b")
  (syntax-string-attribute                                                      :foreground "#53be81" :background "#232d2b")
  (syntax-comment-attribute                                                     :foreground "#3D5A51" :background "#232d2b")
  (syntax-keyword-attribute                                             :bold t :foreground "#ecdf7d" :background "#232d2b")
  (syntax-constant-attribute                                                    :foreground "#EE8D37" :background "#232d2b")
  (syntax-function-name-attribute                                               :foreground "#A367F6" :background "#232d2b")
  (syntax-variable-attribute                                                    :foreground "#ff5c50" :background "#232d2b")
  (syntax-type-attribute                                                        :foreground "#2677EA" :background "#232d2b")
  (syntax-builtin-attribute                                                     :foreground "#5c9985" :background "#232d2b")
)

(define-color-theme "oros-repl" ()
  (:foreground "#89e5c6")
  (:background nil) ;; remove background
  
  (cursor                                                                       :foreground "#131918" :background "#8abaae")
  (region                                                                       :foreground "#48af81" :background "#181f1e")
  
  (modeline                                                             :bold t :foreground "#8abaae" :background "#325146")
  (modeline-inactive                                                    :bold t :foreground "#667e6c" :background "#192420")
  
  (lem/frame-multiplexer::frame-multiplexer-active-frame-name-attribute :bold t :foreground "#48af81" :background "#1b4136")
  (lem/frame-multiplexer::frame-multiplexer-frame-name-attribute                :foreground "#3d5a51" :background "#192420")
  (lem/frame-multiplexer::frame-multiplexer-background-attribute                :foreground "#667e6c" :background "#232d2b")
  
  (syntax-warning-attribute                                                     :foreground "#f6294f" :background "#131918")
  (syntax-string-attribute                                                      :foreground "#53be81" :background "#131918")
  (syntax-comment-attribute                                                     :foreground "#3D5A51" :background "#131918")
  (syntax-keyword-attribute                                             :bold t :foreground "#ecdf7d" :background "#131918")
  (syntax-constant-attribute                                                    :foreground "#EE8D37" :background "#131918")
  (syntax-function-name-attribute                                               :foreground "#A367F6" :background "#131918")
  (syntax-variable-attribute                                                    :foreground "#ff5c50" :background "#131918")
  (syntax-type-attribute                                                        :foreground "#2677EA" :background "#131918")
  (syntax-builtin-attribute                                             :bold t :foreground "#89e5c6" :background "#131918")
)
;;; END THEMES --------------------------------------------------------------------------------------
;;; BEGIN FONT CONFIG -------------------------------------------------------------------------------
#-lem-ncurses (let ((font-regular #p"/home/mantacid/builds/lem/frontends/sdl2/resources/fonts/JetBrainsMono-Light.ttf")
       (font-bold #p"/home/mantacid/builds/lem/frontends/sdl2/resources/fonts/JetBrainsMono-SemiBold.ttf"))
   (if (and (uiop:file-exists-p font-regular)
            (uiop:file-exists-p font-bold))
       (lem-sdl2/display:change-font (lem-sdl2/display:current-display)
                                     (lem-sdl2/font:make-font-config
                                      :latin-normal-file font-regular
                                      :latin-bold-file font-bold
                                      :cjk-normal-file font-regular
                                      :cjk-bold-file font-bold))
       (message "Fonts not found.")))

;;; END FONT CONFIG ---------------------------------------------------------------------------------
;;; BEGIN MODELINE CONFIG ---------------------------------------------------------------------------
(defparameter *show-minor-modes* nil)
(defparameter *show-lisp-connection* t)
(defparameter *show-lisp-package* nil)

(define-command toggle-modeline-minor-modes () ()
  (setf *show-minor-modes* (not *show-minor-modes*)))

(define-command toggle-modeline-lisp-connection () ()
  (setf *show-lisp-connection* (not *show-lisp-connection*)))

(define-command toggle-modeline-lisp-package () ()
  (setf *show-lisp-package* (not *show-lisp-package*)))

(defun garlic/modeline-minor-modes (window)
  (if *show-minor-modes*
      (lem-core::modeline-minor-modes window)
      ""))

(setf (variable-value 'lem-core:modeline-format :global)
      '("  "
        lem-core::modeline-write-info
        lem-core::modeline-name
        (lem-core::modeline-position nil :right)
        (garlic/modeline-minor-modes nil :right)
        (lem-core::modeline-major-mode nil :right)))

(lem-vi-mode/modeline::initialize-vi-modeline)

(defmethod lem-core:convert-modeline-element ((element (eql 'lisp-mode)) window)
  "Remove package name from lisp modeline."
  (format nil "  ~A~A"
          (if *show-lisp-package*
              (buffer-package (window-buffer window) "CL-USER")
              "")
          (if (and *show-lisp-connection* (current-connection))
              (format nil " ~A:~A"
                      (connection-implementation-name (current-connection))
                      (or (self-connection-p (current-connection))
                          "micros"))
              "")))

;;; END MODELINE CONFIG -----------------------------------------------------------------------------

;;; BEGIN GENERAL WINDOW SETUP ----------------------------------------------------------------------
;;; Enter Paredit Mode
(defun pared-hook ()
  (lem-paredit-mode:paredit-mode t)
)

(add-hook lem-lisp-mode:*lisp-mode-hook* #'pared-hook)
;;; Enable Color previews
;; TODO
;;; END GENERAL WINDOW SETUP ------------------------------------------------------------------------
;;; BEGIN GENERAL BEGAVIOR CONFIG--------------------------------------------------------------------
(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))

;;; END GENERAL BEHAVIOR CONFIG ---------------------------------------------------------------------
;;; BEGIN SDL2-SPECIFIC CONFIGS ---------------------------------------------------------------------
#+lem-sdl2 (load-theme "oros")
#+lem-sdl2 (lem/line-numbers:toggle-line-numbers)

;; Start a Lisp REPL in a split to the right, and a file browser to the left.
#+lem-sdl2 (lem/directory-mode::directory-mode-sort-files)
#+lem-sdl2 (lem/directory-mode::directory-mode-sort-files)
#+lem-sdl2 (lem/directory-mode::directory-mode-sort-files) ;; repeated thrice to sort by name

#+lem-sdl2 (split-window-horizontally (current-window))
#+lem-sdl2 (lem-lisp-mode:start-lisp-repl)
;; TODO: focus editor window and not the REPL. havent implemented this because lem wont start when I do.
;;; END SDL2-SPECIFIC CONFIGS -----------------------------------------------------------------------

;;; BEGIN NCURSES-SPECIFIC CONFIGS ------------------------------------------------------------------
;; Load gruvbox theme since oros is broken on ncurses for some reason.
;; This issue persists after recompilation of the binary AND after redefinition of the theme.
;; This crap is haunted.
(load-theme #+lem-ncurses "oros-repl" #+lem-sdl2 "oros")

;; Open the repl immediately.
;;#+lem-ncurses (lem-lisp-mode:start-lisp-repl t)
;;; END NCURSES-SPECIFIC CONFIGS --------------------------------------------------------------------


