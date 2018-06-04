(define-module (emacs rcirc-color)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public emacs-rcirc-color
  (package
    (name "emacs-rcirc-color")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://elpa.gnu.org/packages/rcirc-color-"
             version
             ".el"))
       (sha256
        (base32
         "1ya4agh63x60lv8qzrjrng02dnrc70ci0s05b800iq71k71ss3dl"))))
    (build-system emacs-build-system)
    (home-page
     "http://elpa.gnu.org/packages/rcirc-color.html")
    (synopsis "color nicks")
    (description
     "Use /COLOR to list all colored nicks with their color
Use /COLOR NICK COLOR to color NICK using COLOR")
    (license license:gpl3+)))
