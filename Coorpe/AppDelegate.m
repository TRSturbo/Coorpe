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

NSString * firstClip;
NSString * secondClip;
NSString * thirdClip;
NSString * fourthClip;



- (void) applicationWillFinishLaunching:(NSNotification *)aNotification
{
    [_statusMenu setDelegate:self];
    _clipContentsArray = [[NSMutableArray alloc] init];
    _menuArray = [[NSMutableArray alloc]initWithObjects:_firstOption,_secondOption,_thirdOption,_fourthOption, nil];
    
    [self getClipboardContents];
    [_clipContentsArray addObject:_clipContents];
    [self redrawMenu];
    
}

- (void) awakeFromNib {
    self.statusBarApplet = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    
    self.statusBarApplet.menu = self.statusMenu;
    self.statusBarApplet.highlightMode = YES;
    self.statusBarApplet.title = @"Coorpe";
    
}

- (void)menuWillOpen:(NSMenu *)statusMenu{
        [self checkPasteBoard];
}

- (IBAction)firstClip:(id)sender{
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:firstClip  forType:NSStringPboardType];
}

- (IBAction)secondClip:(id)sender{
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:secondClip  forType:NSStringPboardType];
}

- (IBAction)thirdClip:(id)sender{
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:thirdClip  forType:NSStringPboardType];
}

- (IBAction)fourthClip:(id)sender{
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:fourthClip  forType:NSStringPboardType];
}

- (IBAction)printAll:(id)sender {
    for (id obj in _clipContentsArray)
        NSLog(@"obj: %@", obj);
}

-(void)getClipboardContents{
    NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard]; //create clipboard object
    if ([clipBoard stringForType:NSPasteboardTypeString]){
        //if the current clipboard contents is not nil
        _clipContents = [clipBoard  stringForType:NSPasteboardTypeString];
    }
}

- (void)checkPasteBoard{
    
    //get the new clipboard contents
    [self getClipboardContents];
    
    if ([_clipContents isNotEqualTo:_clipContentsArray[0]]){
        //if the current clipboard contents differ from what is already stored in the first array object
        [_clipContentsArray insertObject:_clipContents atIndex:0];
        [self redrawMenu];
    }
    
}

-(void)redrawMenu{
    //basic for loop to set every menuArray item title to the corresponding array element of _clipContentsArray
    for(int i = 0; i < [_clipContentsArray count] && i < [_menuArray count]; i++){
        [_menuArray[i] setTitle:_clipContentsArray[i]];
    }
}


@end
