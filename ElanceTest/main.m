//
//  main.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileWriter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        FileWriter *writer = [[FileWriter alloc] init];
        [writer writeToExternalFilePathWithItems:nil];
        
        
    }
    return 0;
}
