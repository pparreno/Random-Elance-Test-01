//
//  FileReader.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/19/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "FileReader.h"

#define FILE_VALUE_DELIMITER @","
#define DEFAUlT_FILENAME @"textfile.txt"

@implementation FileReader

- (void) beginFileReading
{
    
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/%@",
                          documentsDirectory, DEFAUlT_FILENAME];
    
    NSString * contents = [NSString stringWithContentsOfFile:fileName encoding:NSASCIIStringEncoding error:nil];
    NSArray * lines = [contents componentsSeparatedByString:FILE_VALUE_DELIMITER];
    
    NSLog(@"Logging number of items from file. COUNT: %lu", (unsigned long)lines.count);


}

@end
