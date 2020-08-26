//
//  QFTrackingManager.m
//  ATTrackTest
//
//  Created by dev on 2020/8/5.
//

#import "QFTrackingManager.h"
#ifdef ATTrackingManager
@implementation QFTrackingManager

+ (ATTrackingManagerAuthorizationStatus) trackingAuthorizationStatus {
    return [[self ATTrackingManagerClass] trackingAuthorizationStatus];
}

+ (void)requestTrackingAuthorizationWithCompletionHandler:(void(^)(ATTrackingManagerAuthorizationStatus status))completion {
    [[self ATTrackingManagerClass] requestTrackingAuthorizationWithCompletionHandler:completion];
}

+ (Class)ATTrackingManagerClass {
    Class cls = NSClassFromString(@"ATTrackingManager");
    if (cls == nil) {
        if (@available(iOS 14.0, *)) {
#if TARGET_OS_SIMULATOR
            NSString *xcodeName = @"Xcode-beta.app";
            NSString *targetPath = [NSString stringWithFormat:@"/Applications/%@/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks/AppTrackingTransparency.framework", xcodeName];
#else
            static NSString *const targetPath = @"/System/Library/Frameworks/AppTrackingTransparency.framework";
#endif
            NSBundle *bundle = [NSBundle bundleWithPath:targetPath];
            [bundle load];
            cls = NSClassFromString(@"ATTrackingManager");
            NSAssert(cls, @"Check if the ATTrackingManager class exists, please link AppTrackingTransparency.framework");
        }
    }
    return cls;
}
@end
#endif
