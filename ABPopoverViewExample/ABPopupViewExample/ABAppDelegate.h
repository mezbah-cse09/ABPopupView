//
//  ABAppDelegate.h
//  ABPopupViewExample
//
//  Created by Aron Bury on 24/12/12.
//  Copyright (c) 2012 Aron Bury. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABViewController;

@interface ABAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ABViewController *viewController;

@end
