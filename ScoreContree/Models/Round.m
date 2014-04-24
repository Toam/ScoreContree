//
//  Round.m
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "Round.h"

@implementation Round

@synthesize nousSelected, euxSelected;
@synthesize score, capotSelected;
@synthesize annonce, aCapotSelected;
@synthesize aContreSelected, aSurContreSelected;

-(BOOL)isValid {
    if (nousSelected || euxSelected) {
        // OK
    } else {
        return FALSE;
    }
    
    if (score > 0 || capotSelected) {
        // OK
    } else {
        return FALSE;
    }
    
    if (capotSelected == FALSE && (score > 170 || score < 80)) {
        return FALSE;
    }
    
    return TRUE;
}


@end
