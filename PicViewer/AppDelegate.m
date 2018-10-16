//
//  AppDelegate.m
//  PicViewer
//
//  Created by 杨鑫磊 on 2018/10/15.
//  Copyright © 2018 杨鑫磊. All rights reserved.
//

#import "AppDelegate.h"
#import <Masonry.h>
#import "MovableImageView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // Insert code here to initialize your application
    NSImage *testImage =[NSImage imageNamed:@"a"];
    NSImageView *imageView = [MovableImageView imageViewWithImage:testImage];
    [self.window.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.window.contentView);
    }];
    
    [imageView setContentCompressionResistancePriority:NSLayoutPriorityDragThatCannotResizeWindow forOrientation:NSLayoutConstraintOrientationVertical];
    [imageView setContentCompressionResistancePriority:NSLayoutPriorityDragThatCannotResizeWindow forOrientation:NSLayoutConstraintOrientationHorizontal];
    
    self.window.titlebarAppearsTransparent = YES;
    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.styleMask |= NSWindowStyleMaskFullSizeContentView;
    
    self.window.movableByWindowBackground = YES;
    [self.window setAlphaValue:0.75];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
