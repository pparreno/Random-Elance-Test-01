//
//  NSString+Random.h
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_LENGTH  8

@interface NSString (Random)
+ (NSString *)defaultAlphaNumeric;
+ (NSString *)defaultAlphabetOnly;
+ (id)randomizedString;
+ (id)randomizedAlphanumericStringWithLength:(NSUInteger)len;
+ (id)randomizedAlphabetOnlyStringWithLength:(NSUInteger)len;
+ (id)randomizedStringWithAlphabet:(NSString *)alphabet;
+ (id)randomizedStringWithAlphabet:(NSString *)alphabet length:(NSUInteger)len;
- (id)initWithDefaultAlphabet;
- (id)initWithAlphabet:(NSString *)alphabet;
- (id)initWithAlphabet:(NSString *)alphabet length:(NSUInteger)len;
@end
