(define-module (emacs general)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix git-download))

(define-public emacs-general
  (let ((commit "ce3bc12bd6b928310f7a13f855e5c86183d1e0c2")
        (revision "1"))
    (package
      (name "emacs-general")
      (version
       (git-version "20180327.1753" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/noctuid/general.el.git")
               (commit commit)))
         (sha256
          (base32
           "08jbmln6mpqc6xmf0d606baai25y26l67a68i2cfns09gk8k8pqi"))))
      (build-system emacs-build-system)
      (home-page
       "https://github.com/noctuid/general.el")
      (synopsis
       "Convenience wrappers for keybindings.")
      (description
       "This package provides convenient wrappers for more succinctly defining
keybindings. It allows defining multiple keys at once, specifying an arbitrary
number of named prefix keys to be used in key definitions, implicitly wrapping
key strings with (kbd ...), and more. It provides a single function for standard
emacs key definitions as well as evil key definitions for any evil state and any
keymap. It also provides a setup function to generate \"nmap\", \"vmap\", etc.
keybinding functions for evil.")
      (license license:gpl3+))))
