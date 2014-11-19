//
//  RealNumberGenerator.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/18/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "RealNumberGenerator.h"

@implementation RealNumberGenerator

- (NSString *)generateStringRepresentationOfRandomValue
{
    NSString *stringToReturn = [super generateStringRepresentationOfRandomValue];
    
    if(stringToReturn == nil)
    {
        double randomNum = (double)(arc4random_uniform(((unsigned)RAND_MAX + 1))) / ((arc4random_uniform(6)+1));
        stringToReturn = [NSString stringWithFormat:@"%.25g", randomNum];
    }
    
    stringToReturn = [self removesNonASCIICharacters:stringToReturn];
    return stringToReturn;
}

@end
