#define QT_VERSION_MAJOR    5
#define QT_VERSION_MINOR    6
#define QT_VERSION_PATCH    3
#define QT_VERSION_STR      "5.6.3"

/* Everything */

/* License information */
#define QT_PRODUCT_LICENSEE "Open Source"
#define QT_PRODUCT_LICENSE "OpenSource"


// Compiler sub-arch support
#define QT_COMPILER_SUPPORTS_SSE2 1
#define QT_COMPILER_SUPPORTS_SSE3 1
#define QT_COMPILER_SUPPORTS_SSSE3 1
#define QT_COMPILER_SUPPORTS_SSE4_1 1
#define QT_COMPILER_SUPPORTS_SSE4_2 1
#define QT_COMPILER_SUPPORTS_AVX 1
#define QT_COMPILER_SUPPORTS_AVX2 1

// Compile time features
#if defined(QT_LARGEFILE_SUPPORT) && defined(QT_NO_LARGEFILE_SUPPORT)
# undef QT_LARGEFILE_SUPPORT
#elif !defined(QT_LARGEFILE_SUPPORT)
# define QT_LARGEFILE_SUPPORT 64
#endif

#if defined(QT_NO_CUPS) && defined(QT_CUPS)
# undef QT_NO_CUPS
#elif !defined(QT_NO_CUPS)
# define QT_NO_CUPS
#endif

#if defined(QT_NO_EVDEV) && defined(QT_EVDEV)
# undef QT_NO_EVDEV
#elif !defined(QT_NO_EVDEV)
# define QT_NO_EVDEV
#endif

#if defined(QT_NO_EVENTFD) && defined(QT_EVENTFD)
# undef QT_NO_EVENTFD
#elif !defined(QT_NO_EVENTFD)
# define QT_NO_EVENTFD
#endif

#if defined(QT_NO_FONTCONFIG) && defined(QT_FONTCONFIG)
# undef QT_NO_FONTCONFIG
#elif !defined(QT_NO_FONTCONFIG)
# define QT_NO_FONTCONFIG
#endif

#if defined(QT_NO_GLIB) && defined(QT_GLIB)
# undef QT_NO_GLIB
#elif !defined(QT_NO_GLIB)
# define QT_NO_GLIB
#endif

#if defined(QT_NO_IMAGEFORMAT_JPEG) && defined(QT_IMAGEFORMAT_JPEG)
# undef QT_NO_IMAGEFORMAT_JPEG
#elif !defined(QT_NO_IMAGEFORMAT_JPEG)
# define QT_NO_IMAGEFORMAT_JPEG
#endif

#if defined(QT_NO_INOTIFY) && defined(QT_INOTIFY)
# undef QT_NO_INOTIFY
#elif !defined(QT_NO_INOTIFY)
# define QT_NO_INOTIFY
#endif

#if defined(QT_NO_MTDEV) && defined(QT_MTDEV)
# undef QT_NO_MTDEV
#elif !defined(QT_NO_MTDEV)
# define QT_NO_MTDEV
#endif

#if defined(QT_NO_NIS) && defined(QT_NIS)
# undef QT_NO_NIS
#elif !defined(QT_NO_NIS)
# define QT_NO_NIS
#endif

#if defined(QT_NO_OPENVG) && defined(QT_OPENVG)
# undef QT_NO_OPENVG
#elif !defined(QT_NO_OPENVG)
# define QT_NO_OPENVG
#endif

#if defined(QT_NO_STYLE_GTK) && defined(QT_STYLE_GTK)
# undef QT_NO_STYLE_GTK
#elif !defined(QT_NO_STYLE_GTK)
# define QT_NO_STYLE_GTK
#endif

#if defined(QT_NO_STYLE_WINDOWSCE) && defined(QT_STYLE_WINDOWSCE)
# undef QT_NO_STYLE_WINDOWSCE
#elif !defined(QT_NO_STYLE_WINDOWSCE)
# define QT_NO_STYLE_WINDOWSCE
#endif

#if defined(QT_NO_STYLE_WINDOWSMOBILE) && defined(QT_STYLE_WINDOWSMOBILE)
# undef QT_NO_STYLE_WINDOWSMOBILE
#elif !defined(QT_NO_STYLE_WINDOWSMOBILE)
# define QT_NO_STYLE_WINDOWSMOBILE
#endif

#if defined(QT_NO_TSLIB) && defined(QT_TSLIB)
# undef QT_NO_TSLIB
#elif !defined(QT_NO_TSLIB)
# define QT_NO_TSLIB
#endif

#if defined(QT_OPENGL_DYNAMIC) && defined(QT_NO_OPENGL_DYNAMIC)
# undef QT_OPENGL_DYNAMIC
#elif !defined(QT_OPENGL_DYNAMIC)
# define QT_OPENGL_DYNAMIC
#endif

#define QT_QPA_DEFAULT_PLATFORM_NAME "windows"
