//
//  AppDelegate.m
//  ATTrackingManagerDemo
//
//  Created by dev on 2020/8/5.
//  Copyright © 2020 dev. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    DemoViewController *vc = [[DemoViewController alloc] init];
    self.window.rootViewController = vc;
    return YES;
}

@end
