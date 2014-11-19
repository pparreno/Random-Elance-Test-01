//
//  ValueGenerator.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "ValueGenerator.h"

@implementation ValueGenerator

-(NSString *)generateStringRepresentationOfRandomValue
{
    return nil;
}

-(NSString *)removesNonASCIICharacters:(NSString *) nonASCIIString
{
    NSString *asciiString = nil;
    NSMutableString *asciiCharacters = [NSMutableString string];
    for (NSInteger i = 32; i < 127; i++)  {
        [asciiCharacters appendFormat:@"%c", (char)i];
    }
    
    NSCharacterSet *nonAsciiCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:asciiCharacters] invertedSet];
    
    asciiString = [[nonASCIIString componentsSeparatedByCharactersInSet:nonAsciiCharacterSet] componentsJoinedByString:@""];
    
    return asciiString;
}

@end
