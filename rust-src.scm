(define-module (rust-src)
  #:use-module (guix build-system gnu)
  #:use-module (guix packages)
  #:use-module (gnu packages rust))

(define (rust-source-package rust-pkg)
  (package
    (name "rust-src")
    (version (package-version rust-pkg))
    (source (package-source rust-pkg))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out    (assoc-ref outputs "out"))
                    (target (string-append
                             out "/src/rust-" ,version)))
               (mkdir-p target)
               (copy-recursively "src" target)
               #t))))))
    (native-search-paths
     (list (search-path-specification
            (variable "RUST_SRC_PATH")
            (files (list (string-append "src/rust-" version))))))
    (synopsis (string-append "Sources for: " (package-synopsis rust-pkg)))
    (description (string-append "Sources for: " (package-description rust-pkg)))
    (home-page (package-home-page rust-pkg))
    (license (package-license rust-pkg))))

(define-public rust-src
  (rust-source-package rust))
