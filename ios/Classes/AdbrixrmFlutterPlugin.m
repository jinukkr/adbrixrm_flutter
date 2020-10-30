#import "AdbrixrmFlutterPlugin.h"
#if __has_include(<adbrixrm_flutter/adbrixrm_flutter-Swift.h>)
#import <adbrixrm_flutter/adbrixrm_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "adbrixrm_flutter-Swift.h"
#endif

@implementation AdbrixrmFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdbrixrmFlutterPlugin registerWithRegistrar:registrar];
}
@end
