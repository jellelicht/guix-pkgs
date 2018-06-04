(define-module (libraries mgl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xorg)
  #:use-module (guix git-download))

(define-public mgl
  (let ((commit "c1146a40f675457cafd786c6f1d459fcd2d4f345")
        (revision "1"))
    (package
      (name "mgl")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri
	  (git-reference
	   (url "https://github.com/Aaron-SP/mgl.git")
	   (commit commit)))
         (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "1mni2fdbj3f8q98lppr125z256wh8b1rlizlpvzzn8rdc3fxa1nl"))
	 (modules '((guix build utils)))
	 (snippet
	  '(begin
	     ;; Remove redirection in makefile
	     (substitute* '("makefile")
	       (("2> .*$") "\n"))
	     ;; HACK: make gcc shut up about nameclashes
	     (substitute* '("source/math/min/vec2.h"
			    "source/math/min/utility.h"
			    "source/math/min/vec3.h"
			    "source/math/min/vec4.h")
	       (("swap\\(") "min_swap("))
	     #t))))
     (build-system gnu-build-system)
     (arguments
      `(#:test-target "tests"
	#:make-flags
	(list (string-append "MGL_DESTDIR=" (assoc-ref %outputs "out") "/include"))
	#:phases
	(modify-phases %standard-phases
	  (delete 'configure)
	  (delete 'build))))
     (native-inputs
      `(("pkg-config" ,pkg-config)))
     (inputs
      `(("libvorbis" ,libvorbis)
	("openal" ,openal)
        ("freetype" ,freetype)
        ("libx11" ,libx11)
	("glew" ,glew)))
     (home-page "https://github.com/Aaron-SP/mgl")
     (synopsis "Minimal Graphics Library.")
     (description
      "This package includes the distribution of the Minimal Graphics
Library, hence abbreviated MGL.")
     (license license:asl2.0))))

(define-public bds
  (let ((commit "dbd0988169731de090928f5d47b097c01767fe1e")
        (revision "1"))
    (package
      (name "bds")
      (version (git-version "0.1.245" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri
	  (git-reference
	   (url "https://github.com/Aaron-SP/bds.git")
	   (commit commit)))
         (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "1y27j2s98qqzfx5na6lcqb74c2rn6ypz1g8d9fqf4gpxz8m7a9qn"))
	 (modules '((guix build utils)))
	 (snippet '(begin
 		     ;; Remove redirection in makefile
 		     (substitute* '("makefile")
 		       (("2> .*$") "\n"))
		     (substitute* '("source/game/ui_bg_assets.h")
		       (("static_assert\\((.*)\\);" _ value)
			(string-append "static_assert(" value ", \"asdf\");")))
		     (substitute* '("source/game/world.h")
		       (("return \\{(.*)\\};" _ value)
			(string-append "return std::tuple<bool, float, float>(" value ");")))
		     #t))))
      (build-system gnu-build-system)
      (arguments
       `(#:test-target "tests"
	 #:make-flags
	(list (string-append "MGL_DESTDIR=" (assoc-ref %build-inputs "mgl") "/include"))
	 #:phases
	 (modify-phases %standard-phases
	   (delete 'configure)
	   (replace 'build
             (lambda* (#:key inputs #:allow-other-keys)
	       (invoke "make" "build" (string-append "MGL_DESTDIR=" (assoc-ref inputs "mgl") "/include"))))
	   (replace 'install
	     (lambda* (#:key outputs #:allow-other-keys)
	       (let* ((out (assoc-ref outputs "out"))
		      (bin (string-append out "/bin")))
		 (install-file "bin/game" bin)
		 #t))))))
      (native-inputs
       `(("pkg-config" ,pkg-config)))
      (inputs
       `( ("libvorbis" ,libvorbis)
	  ("openal" ,openal)
	  ("mgl" ,mgl)
          ("freetype" ,freetype)
          ("libx11" ,libx11)
	  ("glew" ,glew)))
      (home-page "https://github.com/Aaron-SP/bds")
      (synopsis "Beyond Dying Skies Official Simulation.")
      (description
       "This package includes the distribution of the Beyond Dying Skies,
, hence abbreviated BDS.")
      (license license:asl2.0))))
