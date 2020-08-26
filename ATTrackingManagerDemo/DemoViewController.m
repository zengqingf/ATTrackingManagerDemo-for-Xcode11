//
//  DemoViewController.m
//  ATTrackingManagerDemo
//
//  Created by dev on 2020/8/5.
//  Copyright © 2020 dev. All rights reserved.
//

#import "DemoViewController.h"
#import "QFTrackingManager.h"
#import <AdSupport/AdSupport.h>
@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)trackStatusBtnAction:(id)sender {
    
    if (@available(iOS 14, *)) {
        NSLog(@"trackingAuthorizationStatus：%ld", ATTrackingManager.trackingAuthorizationStatus);
    } else {
        // Fallback on earlier versions
    }
    
    BOOL enable = [ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled;
    NSLog(@"isAdvertisingTrackingEnabled = %ld", enable);//in iOS14，This state is always NO

    NSString *udidString = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    NSLog(@"advertisingIdentifier = %@", udidString);//On the simulator，This state is always 00000000-0000-0000-0000-000000000000
}

- (IBAction)reqTrackBtnAction:(id)sender {
    
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            NSLog(@"request status：%ld", status);
        }];
    } else {
        // Fallback on earlier versions
        NSLog(@"not allow");
    }
}

@end
