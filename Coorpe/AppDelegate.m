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
    _clipContentsArray = [[NSMutableArray alloc] init];
    [self checkPasteBoard];
    
}

-(void)addToArray{
    if(_clipContents){
        [_clipContentsArray addObject:_clipContents];
        NSLog(@"%@",_clipContentsArray[0]);
    }
}

-(void)getClipboardContents{
    NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard]; //create clipboard object
    if ([clipBoard stringForType:NSPasteboardTypeString]){
        //if the current clipboard contents differ from what is already stored in clipContents variable
        
        _clipContents = [clipBoard  stringForType:NSPasteboardTypeString];
        //copy clipboard into clipContents variable
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

- (void)checkPasteBoard{
    NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard]; //create clipboard object
    [self getClipboardContents];
    
    if ([clipBoard  stringForType:NSPasteboardTypeString] != _clipContents){
        //if the current clipboard contents differ from what is already stored in clipContents variable
        
        _clipContents = [clipBoard  stringForType:NSPasteboardTypeString];
        //copy clipboard into clipContents variable
        
    }

}


@end
