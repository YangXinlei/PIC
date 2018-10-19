//
//  MyWindow.m
//  PicViewer
//
//  Created by 杨鑫磊 on 2018/10/16.
//  Copyright © 2018 杨鑫磊. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

- (void)keyDown:(NSEvent *)event {
    float interval = 0.15;
    if (event.modifierFlags & NSEventModifierFlagOption) {
        interval = 0.05;
    }

    if (event.keyCode == 126 || event.keyCode == 24) { // arrow up or +
        self.alphaValue += interval;
    } else if (event.keyCode == 125 || event.keyCode == 27) {
        self.alphaValue = MAX(0.1, self.alphaValue - interval);
    }
}

@end
