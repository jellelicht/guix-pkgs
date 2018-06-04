(define-module (emacs counsel)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix download)
  ;; Custom modules
  #:use-module (emacs swiper)
  )

(define-public emacs-counsel
(package
  (name "emacs-counsel")
  (version "0.10.0")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://stable.melpa.org/packages/counsel-"
             version
             ".el"))
      (sha256
        (base32
          "0sci55q1g4d0551v2k0ffd3nk64jxd1ywkw8yrq20n6xzmdiwfvb"))))
  (build-system emacs-build-system)
  (propagated-inputs
    `(("emacs-swiper" ,emacs-swiper)))
  (home-page "https://github.com/abo-abo/swiper")
  (synopsis
    "Various completion functions using Ivy")
  (description
    "Just call one of the interactive functions in this file to complete
the corresponding thing using `ivy'.

Currently available:
- Symbol completion for Elisp, Common Lisp, Python and Clojure.
- Describe fuctions for Elisp: function, variable, library, command,
  bindings, theme.
- Navigation functions: imenu, ace-line, semantic, outline
- Git utilities: git-files, git-grep, git-log, git-stash.
- Grep utitilies: grep, ag, pt, recoll.
- System utilities: process list, rhythmbox, linux-app.
- Many more.
")
  (license #f)))
