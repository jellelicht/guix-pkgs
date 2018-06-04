(define-module (emacs indent-guide)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix download))

(define-public emacs-indent-guide
(package
  (name "emacs-indent-guide")
  (version "20160630")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://stable.melpa.org/packages/indent-guide-"
             version
             ".el"))
      (sha256
        (base32
          "1mwvbgx1916ffdpk588p2idjh1d77lwgzda5gsa90iliwdq5h4a4"))))
  (build-system emacs-build-system)
  (home-page "http://hins11.yu-yake.com/")
  (synopsis
    "Show vertical lines to guide indentation.")
  (description
    "Show vertical lines to guide indentation.")
  (license license:gpl2+)))
