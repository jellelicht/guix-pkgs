(define-module (emacs telephone-line)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix download))

(define-public emacs-telephone-line
(package
  (name "emacs-telephone-line")
  (version "0.4")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://stable.melpa.org/packages/telephone-line-"
             version
             ".tar"))
      (sha256
        (base32
          "13g79sljmaj0zx648ga3qxhhyzxshv6bqkf5c1043dm4sm7v37v5"))))
  (build-system emacs-build-system)
  (propagated-inputs
    `(("emacs-cl-generic" ,emacs-cl-generic)))
  (home-page
    "https://github.com/dbordak/telephone-line")
  (synopsis "Rewrite of Powerline")
  (description
    "Telephone Line is a library for customizing the mode-line that is
based on the Vim Powerline.  Themes can be created by customizing
the telephone-line-lhs and telephone-line-rhs variables.
")
  (license license:gpl3+))
    )
