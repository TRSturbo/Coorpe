//
//  AppDelegate.h
//  Coorpe
//
//  Created by Aaron Tharpe and Kevin Cooper on 10/2/14.
//  Copyright (c) 2014 Corpe Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSStatusItem *statusBarApplet;

@property (assign) IBOutlet NSMenu *statusMenu;
@property (strong, nonatomic) NSString *clipContents;
@property (strong, nonatomic) NSMutableArray *clipContentsArray;
@property (assign) IBOutlet NSMenuItem * firstOption;
@property (assign) IBOutlet NSMenuItem * secondOption;
@property (assign) IBOutlet NSMenuItem * thirdOption;
@property (assign) IBOutlet NSMenuItem * fourthOption;



- (NSString *)stringForType:(NSString *)dataType;

- (IBAction)test:(id)sender;

@end

