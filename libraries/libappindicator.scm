(define-module (libraries libappindicator)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (guix download))

(define-public libdbusmenu
  (package
    (name "libdbusmenu")
    (version "16.04.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
		    "https://launchpad.net/" "libdbusmenu/16.04/" version
		    "/+download/libdbusmenu-" version ".tar.gz"))
              (sha256
               (base32
		"12l7z8dhl917iy9h02sxmpclnhkdjryn08r8i4sr8l3lrlm4mk5r" 
		))))
    (build-system glib-or-gtk-build-system)
    (arguments
     '(#:tests? #f))
    (native-inputs
     `(
       ;; ("imagemagick" ,imagemagick)
        ("pkg-config" ,pkg-config)
        ("intltool" ,intltool)
       ;; ("util-linux" ,util-linux)
       ;; ("sox" ,sox)
       ))
    (inputs
     `(
       ("gtk+" ,gtk+)
       ("gtk+" ,gtk+-2)
       ("glib" ,glib)
       ("json-glib" ,json-glib)
       ("gobject-introspection" ,gobject-introspection)
       ;; (boost" ,boost)
       ;; ("libconfig" ,libconfig)
       ;; ("sdl-union" ,(sdl-union (list sdl sdl-image sdl-mixer)))
       ;; ("zlib" ,zlib)
       ))
    (home-page "")
    (synopsis "")
    (description
     "") 
    (license (list license:lgpl2.1 license:lgpl3))))

(define-public libappindicator
  (package
    (name "libappindicator")
    (version "12.10.0")
    (source (origin
              (method url-fetch)
	      ;; https://launchpad.net/libappindicator/12.10/12.10.0/+download/libappindicator-12.10.0.tar.gz
              (uri (string-append
		    "https://launchpad.net/libappindicator/12.10/"
		    version "/+download/libappindicator-" version
		    ".tar.gz"))
              (sha256
               (base32
		"17xlqd60v0zllrxp8bgq3k5a1jkj0svkqn8rzllcyjh8k0gpr46m"))))
    (build-system glib-or-gtk-build-system)
    (native-inputs
     `(
       ;; ("imagemagick" ,imagemagick)
        ("pkg-config" ,pkg-config)
       ;; ("util-linux" ,util-linux)
       ;; ("sox" ,sox)
       ))
    (inputs
     `(
       ("gtk+" ,gtk+-2)
       ("glib" ,glib)
       ("libdbusmenu" ,libdbusmenu)
       ;; (boost" ,boost)
       ;; ("libconfig" ,libconfig)
       ;; ("sdl-union" ,(sdl-union (list sdl sdl-image sdl-mixer)))
       ;; ("zlib" ,zlib)
       ))
    (home-page "https://launchpad.net/libappindicator")
    (synopsis "Allow applications to export a menu into the menubar")
    (description
     "Libappindicator allows applications to export a menu into the menubar") 
    (license (list license:lgpl2.1 license:lgpl3))))
