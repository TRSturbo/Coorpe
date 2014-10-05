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
        [_clipContentsArray addObject:_clipContents];
        //copy clipboard into clipContents variable
    }
}

- (void) awakeFromNib {
    self.statusBarApplet = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    
    self.statusBarApplet.menu = self.statusMenu;
    self.statusBarApplet.highlightMode = YES;
    self.statusBarApplet.title = @"Coorpe";
    
}

- (void)menuWillOpen:(NSMenu *)statusMenu //when menu is opened
{
    NSUInteger arrayLength = [_clipContentsArray count]; //get length of array
    
    if(arrayLength == 1){ //if there is one element in mutable array
        
        [self checkPasteBoard];
        NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard]; //create clipboard
        NSUInteger tempInt = [_clipContentsArray indexOfObject:([clipBoard  stringForType:NSPasteboardTypeString])]; //finding index of object in mutable array
        firstClip = [_clipContentsArray objectAtIndex:tempInt]; //assigning object to string
        [_firstOption setTitle:firstClip]; //change name to reflect copied obj
        NSLog(@"%@",firstClip);
        
    } else if (arrayLength == 2){
        
        [self checkPasteBoard];
        NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard];
        NSUInteger tempInt = [_clipContentsArray indexOfObject:([clipBoard  stringForType:NSPasteboardTypeString])];
        secondClip = [_clipContentsArray objectAtIndex:tempInt];
        [_secondOption setTitle:secondClip];
        NSLog(@"%@",secondClip);
        
    } else if (arrayLength == 3){
        
        [self checkPasteBoard];
        NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard];
        NSUInteger tempInt = [_clipContentsArray indexOfObject:([clipBoard  stringForType:NSPasteboardTypeString])];
        thirdClip = [_clipContentsArray objectAtIndex:tempInt];
        [_thirdOption setTitle:thirdClip];
        NSLog(@"%@",thirdClip);
        
    } else if (arrayLength == 4){
        
        [self checkPasteBoard];
        NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard];
        NSUInteger tempInt = [_clipContentsArray indexOfObject:([clipBoard  stringForType:NSPasteboardTypeString])];
        fourthClip = [_clipContentsArray objectAtIndex:tempInt];
        [_fourthOption setTitle:fourthClip];
        NSLog(@"%@",fourthClip);
        
    } else { //if mutable array exceeds four items
        
        [_clipContentsArray removeAllObjects]; //clear all items, start over at one
        
        [self checkPasteBoard];
        NSPasteboard*  clipBoard  = [NSPasteboard generalPasteboard];
        NSUInteger tempInt = [_clipContentsArray indexOfObject:([clipBoard  stringForType:NSPasteboardTypeString])];
        firstClip = [_clipContentsArray objectAtIndex:tempInt];
        [_firstOption setTitle:firstClip];
        NSLog(@"%@",firstClip);
    }
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
