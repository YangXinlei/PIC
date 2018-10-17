//
//  MovableImageView.h
//  PicViewer
//
//  Created by 杨鑫磊 on 2018/10/16.
//  Copyright © 2018 杨鑫磊. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MovableImageView : NSImageView

@property (nonatomic, copy) void(^imageChanged)(NSImage *image);

@end

