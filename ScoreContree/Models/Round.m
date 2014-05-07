//
//  Round.m
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "Round.h"

@implementation Round

@synthesize isPointsFaits;
@synthesize nousSelected, euxSelected;
@synthesize score, isFait, capotSelected;
@synthesize annonce, aCapotSelected;
@synthesize aContreSelected, aSurContreSelected;

-(BOOL)isValid {
    if (nousSelected || euxSelected) {
        // OK
    } else {
        return FALSE;
    }
    
    if (annonce == 0 && !aCapotSelected) {
        return FALSE;
    }
    
    if (isPointsFaits) {
        if (capotSelected == TRUE) {
            if (score == 0) {
                return TRUE;
            }
        } else {
            if (score > 80 && score < 170) {
                return TRUE;
            }
        }
    } else {
        return TRUE;
    }
    
    
    return FALSE;
}

-(int)computePoints {
    if (isPointsFaits) {
        return 42;
    } else {
        int points = 0;
        
        if (isFait) {
            points = annonce;
        }
        
        return points;
    }
    
}

@end
