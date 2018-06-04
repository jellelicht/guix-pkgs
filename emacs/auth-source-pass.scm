(define-module (emacs auth-source-pass)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public emacs-auth-source-pass
  (package
    (name "emacs-auth-source-pass")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://stable.melpa.org/packages/auth-source-pass-"
             version ".el"))
       (sha256
        (base32
         "1vrrjl86sqv5aw4hhvp4x14b70fn20l40wx2p0zrc857g87gby80"))))
    (build-system emacs-build-system)
    (home-page
     "https://github.com/DamienCassou/auth-password-store")
    (synopsis
     "Integrate auth-source with password-store")
    (description
     "Integrates password-store (http://passwordstore.org/) within
auth-source.")
    (license license:gpl3+)))
