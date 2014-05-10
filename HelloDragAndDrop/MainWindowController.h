//
//  MainWindowController.h
//  HelloMusic
//
//  Created by Bear on 2014/3/29.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DragView.h"

@interface MainWindowController : NSWindowController<DragViewDelagate>

// 新增 DragView 物件，藉以初始化時設定 delegate
@property (weak) IBOutlet DragView *dragView;
@property (weak) IBOutlet NSTextField *infoTextField;

@end
