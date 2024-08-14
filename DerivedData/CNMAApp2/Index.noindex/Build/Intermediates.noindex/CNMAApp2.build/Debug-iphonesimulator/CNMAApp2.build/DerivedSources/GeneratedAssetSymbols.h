#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.apple.CNMAApp2";

/// The "BL" asset catalog color resource.
static NSString * const ACColorNameBL AC_SWIFT_PRIVATE = @"BL";

/// The "DK" asset catalog color resource.
static NSString * const ACColorNameDK AC_SWIFT_PRIVATE = @"DK";

/// The "WhiteAlpha" asset catalog color resource.
static NSString * const ACColorNameWhiteAlpha AC_SWIFT_PRIVATE = @"WhiteAlpha";

/// The "bg" asset catalog image resource.
static NSString * const ACImageNameBg AC_SWIFT_PRIVATE = @"bg";

#undef AC_SWIFT_PRIVATE
