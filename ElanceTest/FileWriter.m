//
//  FileWriter.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "FileWriter.h"

#import "RealNumberGenerator.h"
#import "NSString+Random.h"

#define MAX_FILE_SIZE_IN_BYTES 10485760
#define FILE_VALUE_DELIMITER @","
#define DEFAUlT_FILENAME @"textfile.txt"
#define RAND_MAX_FOR_STRINGS 50

@interface FileWriter ()
{
    int _characterSize;
}

@property (nonatomic, strong) RealNumberGenerator *realNumberGenerator;

@end

@implementation FileWriter

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _realNumberGenerator = [[RealNumberGenerator alloc] init];
        _characterSize = 0;
    }
    
    return self;
}

- (void)writeToExternalFilePathWithItems:(NSArray *)items
{
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/%@",
                          documentsDirectory, DEFAUlT_FILENAME];
    
    NSOutputStream *stream = [[NSOutputStream alloc] initToFileAtPath:fileName append:NO];
    [stream open];
    NSString *content = [self retrieveStringToWrite];
    
    while ([self computeStringLengthInCharBytes:content] < (MAX_FILE_SIZE_IN_BYTES)){
        // Make NSData object from string:
        NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
        // Write data to output file:
        [stream write:data.bytes maxLength:data.length];
        content = [NSString stringWithString: [NSString stringWithFormat:@"%@%@",FILE_VALUE_DELIMITER,[self retrieveStringToWrite]]];
        
    }
    
    [stream close];
    
    
}

- (NSString *) retrieveStringToWrite
{
    switch (arc4random_uniform(4)) {
        case 0:
            return [NSString stringWithString: [self.realNumberGenerator generateStringRepresentationOfRandomValue]];
        case 1:
            return [NSString randomizedAlphanumericStringWithLength:arc4random_uniform(RAND_MAX_FOR_STRINGS)+ DEFAULT_LENGTH];
        case 2:
            return [NSString randomizedAlphabetOnlyStringWithLength:arc4random_uniform(RAND_MAX_FOR_STRINGS)+ DEFAULT_LENGTH];
        case 3:
            return [NSString stringWithFormat:@"%d", arc4random_uniform(RAND_MAX)];
        default:
            return nil;
    }
}

- (int) computeStringLengthInCharBytes:(NSString *) string
{
    
    int length = (int)[string length];
    _characterSize = _characterSize + (length * sizeof(char));
    return _characterSize;
}

@end
