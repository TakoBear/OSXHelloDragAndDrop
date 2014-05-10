//
//  bearAppDelegate.h
//  HelloMusic
//
//  Created by Bear on 2014/3/29.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MainWindowController;

@interface bearAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MainWindowController *mainWindowController;

@end


