(define-module (emacs evil-escape)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix download))

(define-public emacs-evil-escape
  (package
  (name "emacs-evil-escape")
  (version "3.14")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://stable.melpa.org/packages/evil-escape-"
             version
             ".el"))
      (sha256
        (base32
          "0y579vpdmi0fvixgxvw5mcwmlv7mhdc46wr7gmn8qvyjpfs7pxal"))))
  (build-system emacs-build-system)
  (propagated-inputs `(("emacs-evil" ,emacs-evil)))
  (home-page
    "https://github.com/syl20bnr/evil-escape")
  (synopsis
    "Escape from anything with a customizable key sequence")
  (description
    "Press `fd` quickly to escape, and more to come.")
  (license license:gpl3+)))
