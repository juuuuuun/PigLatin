//
//  main.m
//  PigLatin
//
//  Created by Jun Oh on 2019-01-11.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while(true) {
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* inputString = [[NSString stringWithUTF8String:userInput] stringByPigLatinization];
            
            NSLog(@"%@", inputString);
        }
        
    }
    return 0;
}
