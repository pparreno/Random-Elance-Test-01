//
//  main.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileWriter.h"
#import "FileReader.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hi There!");
        NSLog(@"Starting writing operation!");
        FileWriter *writer = [[FileWriter alloc] init];
        [writer writeToExternalFilePathWithItems:nil];
        NSLog(@"Finished writing operation!");
        
        NSLog(@"Starting reading operation!");
        FileReader *reader = [[FileReader alloc] init];
        [reader beginFileReading];
        NSLog(@"Finished reading operation!");
    }
    return 0;
}
