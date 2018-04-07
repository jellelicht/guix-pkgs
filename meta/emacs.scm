(define-module (meta emacs)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages emacs)
  #:use-module (guix git-download)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-1)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix build-system trivial)
  #:use-module (emacs evil-collection))

(define packages
  (list emacs-use-package
        emacs-evil
        emacs-evil-collection))

(define-public meta-emacs
  (package
    (name "meta-emacs")
    (version "0")
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
    (synopsis "Union of emacs packages")
    (description "Union of emacs packages")
    (home-page #f)
    (license #f)))
