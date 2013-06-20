//
//  BTCountAppDelegate.m
//  Count
//
//  Created by Thaddeus Ternes on 6/20/13.
//  Copyright (c) 2013 Bluetoo. All rights reserved.
//

#import "BTCountAppDelegate.h"

@implementation BTCountAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    srand((unsigned int)time(NULL));
}

- (IBAction)tileOpenWindows:(id)sender
{
    // Tile across primary display
    NSScreen *mainScreen = [NSScreen mainScreen];
    NSRect mainFrame = mainScreen.frame;
    
    NSUInteger windowCount = [[NSApp windows] count];

    NSInteger across = 8;
    NSInteger down = (windowCount/across) + 1;

    NSSize windowSize = NSMakeSize(mainFrame.size.width/across, mainFrame.size.height/down);
    NSInteger x = 0;
    NSInteger y = 0;
    for(NSWindow *window in [NSApp windows])
    {
        if(x >= across) x = 0, y++;
        
        NSRect windowFrame = NSMakeRect(x * windowSize.width, y * windowSize.height, windowSize.width, windowSize.height);
        [window setFrame:windowFrame display:YES];
//        NSLog(@"Window: %i %@: %@", (int)window.windowNumber, window.title, NSStringFromRect(windowFrame));
        x++;
    }
}

@end
