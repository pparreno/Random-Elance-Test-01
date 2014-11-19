//
//  NSString+Random.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "NSString+Random.h"
#include <stdlib.h>

#define MAX_INLINE_SPACES_ALLOWED 10

@implementation NSString (Random)

+ (NSString *)defaultAlphaNumeric
{
    return @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
}

+ (NSString *)defaultAlphabetOnly
{
    return @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY";
}

+ (id)randomizedString
{
    return [self randomizedStringWithAlphabet:[self defaultAlphaNumeric]];
}

+ (id)randomizedAlphanumericStringWithLength:(NSUInteger)len
{
    NSString *stringToReturn  = [[self alloc] initWithAlphabet:[self defaultAlphaNumeric] length:len];
    
    int startSpacesCount = arc4random_uniform(MAX_INLINE_SPACES_ALLOWED);
    int endSpacesCount = arc4random_uniform(MAX_INLINE_SPACES_ALLOWED);
    
    if((startSpacesCount+endSpacesCount) > MAX_INLINE_SPACES_ALLOWED)
    {
        if(arc4random_uniform(2) == 0)
            endSpacesCount = MAX_INLINE_SPACES_ALLOWED - startSpacesCount;
        else
            startSpacesCount = MAX_INLINE_SPACES_ALLOWED - endSpacesCount;
    }
    
    for (int x = 0; x < startSpacesCount; x++) {
        NSString *spaceString = @" ";
        NSString *tempString = [spaceString stringByAppendingString:stringToReturn];
        stringToReturn = tempString;
    }
    
    for (int y = 0; y < endSpacesCount; y++) {
        NSString *spaceString = @" ";
        NSString *tempString = [stringToReturn stringByAppendingString:spaceString];
        stringToReturn = tempString;
    }
    
    return stringToReturn;
}

+ (id)randomizedAlphabetOnlyStringWithLength:(NSUInteger)len
{
    return [[self alloc] initWithAlphabet:[self defaultAlphabetOnly] length:len];
}


+ (id)randomizedStringWithAlphabet:(NSString *)alphabet
{
    return [self randomizedStringWithAlphabet:alphabet length:DEFAULT_LENGTH];
}

+ (id)randomizedStringWithAlphabet:(NSString *)alphabet length:(NSUInteger)len
{
    return [[self alloc] initWithAlphabet:alphabet length:len];
}

- (id)initWithDefaultAlphabet
{
    return [self initWithAlphabet:[NSString defaultAlphaNumeric]];
}

- (id)initWithAlphabet:(NSString *)alphabet
{
    return [self initWithAlphabet:alphabet length:DEFAULT_LENGTH];
}

- (id)initWithAlphabet:(NSString *)alphabet length:(NSUInteger)len
{
    NSMutableString *s = [NSMutableString stringWithCapacity:len];
    for (NSUInteger i = 0U; i < len; i++) {
        u_int32_t r = arc4random_uniform((unsigned)RAND_MAX + 1) % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return [NSString stringWithString:s];
}
@end
