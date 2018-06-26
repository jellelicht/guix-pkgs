(define-module (emacs protobuf-mode)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages mail)
  #:use-module (guix download))

(define-public emacs-protobuf-mode
  (package
   (name "emacs-protobuf-mode")
   (version "3.6.0.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://stable.melpa.org/packages/protobuf-mode-"
           version
           ".el"))
     (sha256
      (base32
       "0zw2492dp1rm82lqc6nh6i95afa4j2msd90746lrygk4l7bl1bln"))))
   (build-system emacs-build-system)
   (home-page "unspecified")
   (synopsis
    "major mode for editing protocol buffers.")
   (description
    "Installation:
  - Put `protobuf-mode.el' in your Emacs load-path.
  - Add this line to your .emacs file:
      (require 'protobuf-mode)")
   (license #f)))
