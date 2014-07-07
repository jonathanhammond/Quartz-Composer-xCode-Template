//
//  OZAppDelegate.m
//  Swoosh
//
//  Created by Benoît LAHOZ on 15/01/14.
//  Copyright (c) 2014 L'ange Carasuelo. All rights reserved.
//

#import "OZAppDelegate.h"
#import "kineme/QCPatch.h"
#import "OZQuartzComposerLoader.h"

@implementation OZAppDelegate

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // ---- Load the plugins, patches, the composition and setup the view
    //
    [self setupQuartzRendering];
    
    
    // ---- Sends the events of the view to the composition
    //
    [_qcLoader setEventForwardingMask:NSAnyEventMask];
    
    
    
    
    // ---- Observe the composition output values
    //
    // [[_qcLoader view] addObserver:self forKeyPath:[_qcLoader keyPathForOutputKey:@"myCount"] options:NSKeyValueObservingOptionNew context:nil];
    
    
    
    
    
    
    
    // ---- Render
    //
    [_qcLoader startRendering];
    
    // ---- Setup inputs
    //
    [self setupComposition];
    
    
    
    
    
    

}

- (void) applicationWillTerminate:(NSNotification *)notification {

    if (_qcLoader) {
        
        // [[_qcLoader view] removeObserver:self forKeyPath:[_qcLoader keyPathForOutputKey:@"myCount"]];
        
        [_qcLoader setValue:(@"95") forInputKey:@"volume"];
        
    }

}







- (void) setupQuartzRendering
{
    _qcLoader = [[OZQuartzComposerLoader alloc] init];
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    
    // ---- Load the plugins from the bundle
    //
    [_qcLoader loadPlugins:@[@"hOz Leap Motion",
                             @"hOz OpenAL",
                             @"iTunesQuartzComposerPlugin",
                             @"QCColourArt",
                             @"Syphon"]
                    atPath:[resourcePath stringByAppendingPathComponent:@"Plug-Ins"]];
    
    
    // ---- Loads the kineme patches from the bundle
    //
    [_qcLoader loadPatches:@[@"AudioTools",
                             @"DataTools",
                             @"FileTools",
                             @"GLTools",
                             @"Line",
                             @"Kineme3D"]
                    atPath:[resourcePath stringByAppendingPathComponent:@"Patches"]];
    
    
    // ---- Loads the composition and setup the view
    //
    [_qcLoader initViewWithComposition:@"swoosh"
                                atPath:[resourcePath stringByAppendingPathComponent:@"Compositions"]
                         inContentView:[_window contentView]];
    
    
}





- (void) setupComposition
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userPref = [userDefaults persistentDomainForName:@"com.apple.iApps"];

    NSArray *recentDatabases = [userPref objectForKey:@"iTunesRecentDatabases"];
    
    for (NSString *key in recentDatabases) {
        
       // [_qcLoader setValue:(@"%@", key) forInputKey:@"iTunesLibraryXML"];
        
    }
    
   // [_qcLoader setValue:([[NSBundle mainBundle] resourcePath]) forInputKey:@"comp_loc"];
   // [_qcLoader setValue:(@"0") forInputKey:@"volume"];

}



// ---- Observers
//
/*
- (void) observeValueForKeyPath:(NSString*)keyPath
					   ofObject:(id)object
						 change:(NSDictionary*)change
						context:(void*)context
{
    if ([keyPath isEqualToString:[_qcLoader keyPathForOutputKey:@"myCount"]]) {
        
        int val = [[_qcLoader valueForOutputKey:@"myCount"] intValue];
        NSLog(@"%d", val);
        
    }
}
*/

@end
