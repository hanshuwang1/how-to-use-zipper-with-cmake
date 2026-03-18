
#ifndef ZIPPER_EXPORT_H
#define ZIPPER_EXPORT_H

#ifdef ZIPPER_STATIC_DEFINE
#  define ZIPPER_EXPORT
#  define ZIPPER_NO_EXPORT
#else
#  ifndef ZIPPER_EXPORT
#    ifdef zipper_EXPORTS
        /* We are building this library */
#      define ZIPPER_EXPORT __declspec(dllexport)
#    else
        /* We are using this library */
#      define ZIPPER_EXPORT __declspec(dllimport)
#    endif
#  endif

#  ifndef ZIPPER_NO_EXPORT
#    define ZIPPER_NO_EXPORT 
#  endif
#endif

#ifndef ZIPPER_DEPRECATED
#  define ZIPPER_DEPRECATED __declspec(deprecated)
#endif

#ifndef ZIPPER_DEPRECATED_EXPORT
#  define ZIPPER_DEPRECATED_EXPORT ZIPPER_EXPORT ZIPPER_DEPRECATED
#endif

#ifndef ZIPPER_DEPRECATED_NO_EXPORT
#  define ZIPPER_DEPRECATED_NO_EXPORT ZIPPER_NO_EXPORT ZIPPER_DEPRECATED
#endif

/* NOLINTNEXTLINE(readability-avoid-unconditional-preprocessor-if) */
#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ZIPPER_NO_DEPRECATED
#    define ZIPPER_NO_DEPRECATED
#  endif
#endif

#endif /* ZIPPER_EXPORT_H */
