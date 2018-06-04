(define-module (emacs rust-mode)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public emacs-rust-mode
  (package
   (name "emacs-rust-mode")
   (version "0.3.0")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://stable.melpa.org/packages/rust-mode-"
           version
           ".el"))
     (sha256
      (base32
       "1l9jxnkzxykrssymdg297y6dg2yywi90jjccyawykwvw6mhqphkw"))))
   (build-system emacs-build-system)
   (home-page
    "https://github.com/rust-lang/rust-mode")
   (synopsis
    "A major emacs mode for editing Rust source code")
   (description "")
   (license (list license:asl2.0 license:expat))))
