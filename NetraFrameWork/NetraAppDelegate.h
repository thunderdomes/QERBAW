//
//  NetraAppDelegate.h
//  NetraFrameWork
//
//  Created by Arie on 12/15/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JASidePanelController;

@interface NetraAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JASidePanelController *viewController;

@end
