(define-module (emacs lispy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (guix git-download))


(define-public emacs-lispy-next
  (let ((commit "582c9994688fcbbda454207e4112ad4a0cd80970")
        (revision "1"))
    (package
     (inherit emacs-lispy)
     (name "emacs-lispy-next")
     (version (git-version (package-version emacs-lispy) revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/abo-abo/lispy.git")
             (commit commit)))
       (sha256
        (base32
	 "02frf3r2m0hfz3xf3vvcccxi4gvkl9fz5asrgrc0f6v45850mdv2")))))))
