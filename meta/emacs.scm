(define-module (meta emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1)
  ;; Custom modules:
  #:use-module (emacs auth-source-pass)
  #:use-module (emacs counsel)
  #:use-module (emacs evil-escape)
  #:use-module (emacs general)
  #:use-module (emacs indent-guide)
  #:use-module (emacs material-theme)
  #:use-module (emacs org-jira)
  ;; #:use-module (emacs pinentry)
  #:use-module (emacs protobuf-mode)
  #:use-module (emacs ranger)
  #:use-module (emacs rcirc-color)
  #:use-module (emacs rcirc-notify)
  #:use-module (emacs rust-mode)
  #:use-module (emacs telephone-line))

(define packages
  (list emacs-academic-phrases
	emacs-company
        emacs-daemons
        emacs-debbugs
        emacs-diminish
	emacs-dumb-jump
	emacs-elfeed
        emacs-esup
        emacs-evil
        emacs-evil-collection
        emacs-evil-magit
        emacs-guix
        emacs-htmlize
        emacs-lispy
        emacs-lispyville
        emacs-olivetti
        emacs-org
        emacs-org-pomodoro
	emacs-org-ref
        emacs-pass
	emacs-pdf-tools
	emacs-pinentry
        emacs-projectile
        ;; emacs-realgud
        emacs-undo-tree
        emacs-use-package
        emacs-which-key
        geiser
        magit
        ;; Custom packages:
        emacs-auth-source-pass
        emacs-counsel
        emacs-evil-escape
        emacs-general
        emacs-indent-guide
        emacs-material-theme
	emacs-org-jira
	emacs-protobuf-mode
        emacs-ranger
        emacs-rcirc-color
        emacs-rcirc-notify
        emacs-rust-mode 
        emacs-telephone-line))

(define-public meta-emacs
  (package
   (name "meta-emacs")
   (version "1")
   (source #f)
   (build-system trivial-build-system)
   (arguments
    '(#:modules ((guix build union))
      #:builder (begin
                  (use-modules (ice-9 match)
                               (guix build union))
                  (match %build-inputs
                    (((names . directories) ...)
                     (union-build (assoc-ref %outputs "out")
                                  directories))))))
   (inputs (map (lambda (package)
                  (list (package-name package) package))
                packages))
   (synopsis "Union of my emacs packages")
   (description "Union of my emacs packages")
   (home-page #f)
   (license #f)))
