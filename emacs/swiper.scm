(define-module (emacs swiper)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public emacs-swiper
(package
  (name "emacs-swiper")
  (version "0.10.0")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://stable.melpa.org/packages/swiper-"
             version
             ".el"))
      (sha256
        (base32
          "1wwsr3zwhc6piby06gb8srqa1nd172fn6zhsx46ff0njsq7nn4jw"))))
  (build-system emacs-build-system)
  (propagated-inputs `(("emacs-ivy" ,emacs-ivy)))
  (home-page "https://github.com/abo-abo/swiper")
  (synopsis "Isearch with an overview. Oh, man!")
  (description
    "This package gives an overview of the current regex search
candidates.  The search regex can be split into groups with a
space.  Each group is highlighted with a different face.

It can double as a quick `regex-builder', although only single
lines will be matched.
")
  (license #f)))
