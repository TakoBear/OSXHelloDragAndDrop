//
//  MainWindowController.m
//  HelloMusic
//
//  Created by Bear on 2014/3/29.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@property (nonatomic, strong) NSSound *airSound;

@end

@implementation MainWindowController

/*
 * 依 URL 建立 NSSound 物件
 */
- (void)loadSoundFromURL:(NSURL *)url
{
    // 如果重新讀取檔案，務必要先清除之前的 NSSound 物件
    if(self.airSound) {
        [self.airSound stop];
        self.airSound = nil;
    }
    
    // 使用 URL 建立 NSSound 物件
    self.airSound = [[NSSound alloc] initWithContentsOfURL:url byReference:YES];
    if(self.airSound) {
        // 顯示檔案名稱
        [self.infoTextField setStringValue:[[url pathComponents] lastObject]];
    }
    else {
        [self.infoTextField setStringValue:@"Sound failed to load..."];
    }
    
}

- (IBAction)play:(id)sender
{
    if(self.airSound && ![self.airSound isPlaying]) {
        [self.airSound play];
    }
}

- (IBAction)stop:(id)sender
{
    if([self.airSound isPlaying]) {
        [self.airSound stop];
    }
}

- (IBAction)loadSoundOpenPanel:(id)sender
{
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
    NSArray *filesToOpen;
    NSURL *url;
    
    // 不允許多選檔案開啓
    // 不允許選擇目錄開啓
    [oPanel setAllowsMultipleSelection:NO];
    [oPanel setCanChooseDirectories:NO];
    
    long result = [oPanel runModal];
    if (result == NSOKButton) {
        // 從 NSOpenPanel 物件中取得選取的 URL 陣列
        // 由於先前設定只能單選，所以一個元素就是我們要的 URL
        filesToOpen = [oPanel URLs];
        url = [filesToOpen objectAtIndex:0];
        
        [self loadSoundFromURL:url];
    }
    // 讀取失敗，或是使用者按下取消按鈕
    else {
        [self.infoTextField setStringValue:@"Sound failed to load..."];
    }
}

#pragma mark Drag and Drop
/*
 * 初始化時將自身設定成 DragView 的 delegate
 */
- (void)windowDidLoad
{
    [super windowDidLoad];
    
    self.dragView.delegate = self;
}

/*
 * 實作 DragViewDelagate protocol 
 * 載入音樂檔
 */
- (BOOL)dragFileURL:(NSURL *)fileURL
{
    [self loadSoundFromURL:fileURL];
    
    return YES;
}

@end
