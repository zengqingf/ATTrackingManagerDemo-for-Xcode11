//
//  QFTrackingManager.m
//  ATTrackTest
//
//  Created by dev on 2020/8/5.
//

#import "QFTrackingManager.h"

#ifndef QFTrackingManager
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
            static NSString *const targetPath = @"/System/Library/Frameworks/AppTrackingTransparency.framework";
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
