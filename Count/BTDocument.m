//
//  BTDocument.m
//  Count
//
//  Created by Thaddeus Ternes on 6/18/13.
//  Copyright (c) 2013 Bluetoo. All rights reserved.
//

#import "BTDocument.h"

@implementation BTDocument

- (void)timerTick:(id)sender
{
    [self.counterField setStringValue:[NSString stringWithFormat:@"%li", (unsigned long)++count]];
    [self.customBox setFillColor:[NSColor colorWithDeviceRed:(float)rand()/RAND_MAX
                                                       green:(float)rand()/RAND_MAX
                                                        blue:(float)rand()/RAND_MAX
                                                       alpha:1.0]];
}

- (void)dealloc
{
    [tickTimer invalidate];
    [tickTimer release];
    [super dealloc];
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"BTDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];

    srand((unsigned int)time(NULL));
    [self.counterField setStringValue:@"0"];
    
    tickTimer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES] retain];
}

- (void)canCloseDocumentWithDelegate:(id)delegate shouldCloseSelector:(SEL)shouldCloseSelector contextInfo:(void *)contextInfo
{
    [tickTimer invalidate];
    [tickTimer release];
    tickTimer = nil;
    
    [super canCloseDocumentWithDelegate:delegate shouldCloseSelector:shouldCloseSelector contextInfo:contextInfo];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

#pragma mark Saving / Loading
// Note: we don't support saving, so these are no-op
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    return YES;
}

@end
