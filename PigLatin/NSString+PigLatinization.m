//
//  NSString+PigLatinization.m
//  PigLatin
//
//  Created by Jun Oh on 2019-01-11.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "NSString+PigLatinization.h"

@implementation NSString (PigLatinization)

- (NSString *)stringByPigLatinization {
    NSArray* letterOnlyStringArray = [[self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] componentsSeparatedByCharactersInSet:NSCharacterSet.letterCharacterSet.invertedSet];
    
    NSMutableArray* pigLatinizedStringArray = [[NSMutableArray alloc] init];
    NSCharacterSet* vowels = [NSCharacterSet characterSetWithCharactersInString:@"AaEeIiOoUu"];
    
    for(NSString* letterOnlyString in letterOnlyStringArray) {
        NSUInteger firstVowelLocation = [letterOnlyString rangeOfCharacterFromSet:vowels].location;
        if(firstVowelLocation == 0) {
            // If string starts with vowel, add "way" at the end
            [pigLatinizedStringArray addObject: [letterOnlyString stringByAppendingString:@"way"]];
        } else if(firstVowelLocation == NSNotFound) {
            // If there is no vowel, simply add "ay" at the end
            // take the first group of consonants (i.e. the whole string), attach it at the 'end' (i.e. leave it alone), and add "ay" at the end
            
            [pigLatinizedStringArray addObject:[letterOnlyString stringByAppendingString:@"ay"]];
        } else {
            NSString* stringToAdd = [NSString string];
            
            // If string starts with consonants, first take substring that starts with first vowel
            stringToAdd = [letterOnlyString substringFromIndex:firstVowelLocation];
            
            // Then, attach the beginning set of consonants (substring that starts at beginning and ends at first vowel) and add "ay" at the end
            stringToAdd = [stringToAdd stringByAppendingFormat:@"%@ay", [letterOnlyString substringToIndex:firstVowelLocation]];
            [pigLatinizedStringArray addObject:stringToAdd];
        }
    }
    
    return [pigLatinizedStringArray componentsJoinedByString:@" "];
}

@end
