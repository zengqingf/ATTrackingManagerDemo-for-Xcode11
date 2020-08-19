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
        NSLog(@"current status：%ld", QFTrackingManager.trackingAuthorizationStatus);
    } else {
        // Fallback on earlier versions
    }
    
    BOOL enable = [ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled;
    NSLog(@"广告id是否可获得 = %ld", enable);//iOS14上，这个状态一直是0
    
    NSString *udidString = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    NSLog(@"广告id = %@", udidString);//模拟器上，这个一直是00000000-0000-0000-0000-000000000000
}

- (IBAction)reqTrackBtnAction:(id)sender {
    
    if (@available(iOS 14, *)) {
        [QFTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            NSLog(@"request status：%ld", status);
        }];
    } else {
        // Fallback on earlier versions
    }
}

@end
