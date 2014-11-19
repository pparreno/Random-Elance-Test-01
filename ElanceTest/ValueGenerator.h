//
//  ValueGenerator.h
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValueGenerator : NSObject

- (NSString *) generateStringRepresentationOfRandomValue;
- (NSString *) removesNonASCIICharacters:(NSString *) nonASCIIString;

@end
