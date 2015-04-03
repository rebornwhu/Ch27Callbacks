//
//  main.m
//  Ch27Callbacks
//
//  Created by Xiao Lu on 3/28/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // Callback type 3: Notification
//        [[NSNotificationCenter defaultCenter] addObserver:logger
//                                                 selector:@selector(zoneChange:)
//                                                     name:NSSystemTimeZoneDidChangeNotification
//                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemClockDidChangeNotification
                                                          object:nil
                                                           queue:nil
                                                      usingBlock:^(NSNotification *note) {
                                                          NSLog(@"The system time zone has changed!");
                                                      }];
        

        // Callback type 2: helper object or delegate
//        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        
//        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
//                                                                              delegate:logger
//                                                                      startImmediately:YES];
        
        // Callback type 1: target-action: timer
        /*
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                   target:logger
                                                                 selector:@selector(updateLastTime:)
                                                                 userInfo:nil
                                                                  repeats:YES];
         */
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
