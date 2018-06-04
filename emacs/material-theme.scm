(define-module (emacs material-theme)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public emacs-material-theme
  (package
   (name "emacs-material-theme")
   (version "1.2")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://stable.melpa.org/packages/material-theme-"
                         version ".tar"))
     (sha256
      (base32
       "1d621i6zm6bqghlzv0ijw5vdnskc6v08ypmcway7w0f7sb5sx9iz"))))
   (build-system emacs-build-system)
   (home-page
    "http://github.com/cpaulik/emacs-material-theme")
   (synopsis
    "A Theme based on the colors of the Google Material Design")
   (description
    "To use it, put the following in your Emacs configuration file: (load-theme
'material t).")
   (license license:expat)))
