(define-module (emacs ranger)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public emacs-ranger
  (package
    (name "emacs-ranger")
    (version "0.9.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://stable.melpa.org/packages/ranger-"
             version
             ".el"))
       (sha256
        (base32
         "1v3f55m7ybbl025frf2p69nwi0xkw1mmaa6z0bkwnxql6x92xila"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/ralesi/ranger")
    (synopsis "Make dired more like ranger")
    (description
     "This is a derived major mode that runs within dired emulating many of the
features of ranger <https://github.com/hut/ranger>.")
    (license license:gpl3+)))
