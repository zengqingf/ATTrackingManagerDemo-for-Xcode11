//
//  DemoViewController.m
//  ATTrackingManagerDemo
//
//  Created by dev on 2020/8/5.
//  Copyright © 2020 dev. All rights reserved.
//

#import "DemoViewController.h"
#import "QFTrackingManager.h"

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
