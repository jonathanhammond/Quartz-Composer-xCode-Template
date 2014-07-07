//
//  OZAppDelegate.h
//  Swoosh
//
//  Created by Benoît LAHOZ on 15/01/14.
//  Copyright (c) 2014 L'ange Carasuelo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@class OZQuartzComposerLoader;

@interface OZAppDelegate : NSObject <NSApplicationDelegate>
{
    OZQuartzComposerLoader              *_qcLoader;
}

@property (assign) IBOutlet NSWindow    *window;


// ---- Setup the Quartz Rendering
//
- (void) setupQuartzRendering;



@end
