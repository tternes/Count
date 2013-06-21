//
//  BTDocument.h
//  Count
//
//  Created by Thaddeus Ternes on 6/18/13.
//  Copyright (c) 2013 Bluetoo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BTDocument : NSDocument
{
    NSTimer *_tickTimer;
    NSUInteger _count;
    
    NSTextField *_counterField;
    NSBox *_customBox;
}

@property (assign) IBOutlet NSTextField *counterField;
@property (assign) IBOutlet NSBox *customBox;
@end
