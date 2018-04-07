(define-module (emacs evil-collection)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix git-download))

(define-public emacs-evil-collection
  (let ((commit "935e895cdf7c27d82e229bb72b135a2f3b87398b")
        (revision "1"))
    (package
      (name "emacs-evil-collection")
      (version (git-version "0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/emacs-evil/evil-collection.git")
               (commit commit)))
         (sha256
          (base32
           "0mhjlvd7f8yypc1k34y3b15z9hk2yhlxfw2sz8dq3903aj330naf"))))
      (build-system emacs-build-system)
      (propagated-inputs `(("emacs-evil" ,emacs-evil)))
      (home-page
       "https://github.com/emacs-evil/evil-collection")
      (synopsis "A set of keybindings for Evil mode")
      (description
       "A set of keybindings for Evil mode.

If you want to use Evil in the minibuffer, you'll have to enable it by
setting `evil-collection-setup-minibuffer' to t before loading this package.
This is so because many users find it confusing.")
      (license license:gpl3+))))
