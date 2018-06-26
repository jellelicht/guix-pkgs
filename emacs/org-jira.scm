(define-module (emacs org-jira)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages mail)
  #:use-module (guix download))

(define-public emacs-org-jira
  (package
   (name "emacs-org-jira")
   (version "3.0.0")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://stable.melpa.org/packages/org-jira-"
           version
           ".tar"))
     (sha256
      (base32
       "160ih1c2wi8mv0mc5zl370vbvf0m4j45ri3alra143q4l2frc576"))))
   (build-system emacs-build-system)
   (propagated-inputs
    `(("emacs-request" ,emacs-request)
      ("emacs-s" ,emacs-s)))
   (home-page "https://github.com/ahungry/org-jira")
   (synopsis "Syncing between Jira and Org-mode.")
   (description
    "This provides an extension to org-mode for syncing issues with JIRA
issue servers.
")
   (license #f)))
