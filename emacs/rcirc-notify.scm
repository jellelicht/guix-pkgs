(define-module (emacs rcirc-notify)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (guix git-download))


(define-public emacs-rcirc-notify
  (let ((commit "841a7b5a6cdb0c11a812df924d2c6a7d364fd455")
        (revision "1"))
    (package
     (name "emacs-rcirc-notify")
     (version (git-version "1.0.0" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri
	(git-reference
	 (url "https://github.com/nicferrier/rcirc-notify.git")
	 (commit commit)))
       (sha256
	(base32
	 "1k4knsrca626pikgaalqbqwy7im4wz1vrmzzhdrdb4lhdz6sq3q3"
	 ))))
     (build-system emacs-build-system)
     (home-page "https://github.com/nicferrier/rcirc-notify.git")
     (synopsis "libnotify popups")
     (description
      "This code is inspired in part by erc-page-me.el and offers
the same functionality as it, but for rcirc.")
     (license license:gpl3+))))
