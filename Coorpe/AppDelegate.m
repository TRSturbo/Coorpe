//
//  AppDelegate.m
//  Coorpe
//
//  Created by Aaron Tharpe and Kevin Cooper on 10/2/14.
//  Copyright (c) 2014 Corpe Inc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

@synthesize statusMenu = _statusMenu;
@synthesize statusBarApplet = _statusBar;




- (void) applicationWillFinishLaunching:(NSNotification *)aNotification
{
    NSMutableArray * clipContentsArray = [[NSMutableArray alloc] init];
    
    NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard]; //create clipboard object
    NSString * clipContents; //string variable to later store clipboard contents
    int i = 0; //for counting
    NSLog(clipContents); //print test
    
    
    if ([clipBoard  stringForType:NSPasteboardTypeString] != clipContents){
        //if the current clipboard contents differ from what is already stored in clipContents variable
        
        clipContents = [clipBoard  stringForType:NSPasteboardTypeString];
        //copy clipboard into clipContents variable
        
        [clipContentsArray insertObject:clipContents atIndex:i];
       
        
        
        //store string in array
        i++;
        NSLog(clipContents);
        
        if (i == 2){
            for (NSString *line in clipContentsArray) {
                // Results from NSLog are in the Console
                NSLog([NSString stringWithFormat:@"line: %@", line]);
            }
            i = 0;
        }
    }
    
    

}



- (void) awakeFromNib {
    self.statusBarApplet = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    
    self.statusBarApplet.menu = self.statusMenu;
    self.statusBarApplet.highlightMode = YES;
    self.statusBarApplet.title = @"Coorpe";
    
}


- (IBAction)test:(id)sender {
    NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard];
    NSString* clipContents = [clipBoard  stringForType:NSPasteboardTypeString];
    NSLog(@"%@", clipContents);
}


@end
