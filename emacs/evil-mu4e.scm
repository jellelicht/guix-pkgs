(define-module (emacs evil-mu4e)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages mail)
  #:use-module (guix download))

(define-public emacs-evil-mu4e
  (package
   (name "emacs-evil-mu4e")
   (version "20180522.953")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://melpa.org/packages/evil-mu4e-"
           version
           ".el"))
     (sha256
      (base32
       "004cv3cqwjwcnx8l1wf688n3qr4chczf942757zx00jnrv76ai6r"))))
   (build-system emacs-build-system)
   (propagated-inputs
    `(("emacs-dash" ,emacs-dash)
      ("emacs-evil" ,emacs-evil)
      ("mu" ,mu)
      )
    )
   (home-page "https://github.com/JorisE/evil-mu4e")
   (synopsis "evil-based key bindings for mu4e")
   (description
    "evil-mu4e keybindings for Mu4e that make sense for Evil users.")
   (license #f)))
