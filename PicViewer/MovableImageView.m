//
//  MovableImageView.m
//  PicViewer
//
//  Created by 杨鑫磊 on 2018/10/16.
//  Copyright © 2018 杨鑫磊. All rights reserved.
//

#import "MovableImageView.h"

@implementation MovableImageView

- (instancetype)init {
    if (self = [super init]) {
        [self registerForDraggedTypes:[NSImage imageTypes]];
        self.imageScaling = NSImageScaleProportionallyUpOrDown;
    }
    return self;
}

- (BOOL)mouseDownCanMoveWindow {
    return YES;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    if ( [NSImage canInitWithPasteboard:[sender draggingPasteboard]] &&
        [sender draggingSourceOperationMask] &
        NSDragOperationCopy ) {
        //accept data as a copy operation
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    return [NSImage canInitWithPasteboard:[sender draggingPasteboard]];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    /*------------------------------------------------------
     method that should handle the drop data
     --------------------------------------------------------*/
    if ([sender draggingSource] != self ) {
        
        //set the image using the best representation we can get from the pasteboard
        if([NSImage canInitWithPasteboard: [sender draggingPasteboard]]) {
            NSImage *newImage = [[NSImage alloc] initWithPasteboard: [sender draggingPasteboard]];
            [self setImage:newImage];
            //            NSRect selfFrame = self.frame;
            //            selfFrame.size = newImage.size;
            //            selfFrame.origin = CGPointMake(0, 0);
            //            self.frame = selfFrame;
            //            self.superview.frame = self.frame;
            //            [newImage release];
            if (self.imageChanged) {
                self.imageChanged(newImage);
            }
        }
        
        //if the drag comes from a file, set the window title to the filename
//        fileURL=[NSURL URLFromPasteboard: [sender draggingPasteboard]];
    }
    
    return YES;
}

@end
