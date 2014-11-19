//
//  ValueIdentifier.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/19/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "ValueIdentifier.h"

@interface ValueIdentifier()

@property (nonatomic, strong) NSArray *valuesArray;

@end

@implementation ValueIdentifier

- (id) initWithValuesArray:(NSArray *) valuesArray
{
    self = [super init];
    
    if (self != nil) {
        _valuesArray = [NSArray arrayWithArray:valuesArray];
    }
    
    return self;
}


@end
