//
//  ValueIdentifier.m
//  ElanceTest
//
//  Created by Paul John Parreno on 11/19/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "ValueIdentifier.h"

#define PERIOD_STRING @"."

#define ALPHANUMERIC_LABEL @"alphanumeric"
#define REAL_LABEL @"real numbers"
#define ALPHAHBETIC_LABEL @"alphabetical strings"
#define INTEGER_LABEL @"integer"


@interface ValueIdentifier()
{
    NSCharacterSet *_integerCharacterSet;
    NSCharacterSet *_alphabetCharacterSet;
}

@property (nonatomic, strong) NSArray *valuesArray;

@end

@implementation ValueIdentifier

- (id) initWithValuesArray:(NSArray *) valuesArray
{
    self = [super init];
    
    if (self != nil) {
        _valuesArray = [NSArray arrayWithArray:valuesArray];
        
        _integerCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
        _alphabetCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    }
    
    return self;
}

- (void) beginValuesIdentificationProcess
{
    int index = 0;
    
    for(NSString *value in self.valuesArray)
    {
        if([value containsString:PERIOD_STRING])
        {
            NSLog(@"[%d] \"%@\" - %@", index, value, REAL_LABEL);
        } else {
            
            BOOL isAplhabet = YES;
            BOOL isInteger = YES;
            
            NSRange r01 = [value rangeOfCharacterFromSet:_integerCharacterSet];
            NSRange r02 = [value rangeOfCharacterFromSet:_alphabetCharacterSet];
            
            if(r01.location == NSNotFound)
            {
                isInteger = NO;
            }
            
            if(r02.location == NSNotFound)
            {
                isAplhabet = NO;
            }
            
            if((isAplhabet == YES) && (isInteger == NO))
            {
                NSLog(@"[%d] \"%@\" - %@", index, value, ALPHAHBETIC_LABEL);
            } else if((isAplhabet == NO) && (isInteger == YES)) {
                NSLog(@"[%d] \"%@\" - %@", index, value, INTEGER_LABEL);
            } else {
                NSLog(@"[%d] \"%@\" - %@", index, [value stringByReplacingOccurrencesOfString:@" " withString:@""], ALPHANUMERIC_LABEL);
            }
        
        }
        
        index++;
    }

}


@end
