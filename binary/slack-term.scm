(define-module (binary slack-term)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix download))

(define-public slack-term
  (package
    (name "slack-term")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/erroneousboat/slack-term/releases/download/"
                                  "v" version "/slack-term-linux-amd64"))
              (sha256
               (base32
                "0mfsbmwcd7f3im3kpf9r5416y3bkq0d5b2w66y2kgd6iv7pv8vaj"))))
    (build-system trivial-build-system)
    (arguments
     '(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let* ((binary (assoc-ref %build-inputs "source"))
                (out (assoc-ref %outputs "out"))
                (bin (string-append out "/bin")))
           (mkdir-p bin)
           (with-directory-excursion bin
             (copy-file binary "slack-term")
             (chmod "slack-term" #o555))
           #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/erroneousboat/slack-term")
    (synopsis "Slack client for your terminal ")
    (description "Slack client for your terminal")
    (license license:expat)))
