//
//  Round.m
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "Round.h"

@implementation Round

@synthesize scoreNous, scoreEux;
@synthesize scoreTotalNous, scoreTotalEux;
@synthesize isPointsFaits;
@synthesize nousSelected, euxSelected;
@synthesize score, isFait, capotSelected;
@synthesize annonce, aCapotSelected;
@synthesize aContreSelected, aSurContreSelected;

#pragma mark - Game Logic

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
            if (score > 0 && score < 170) {
                return TRUE;
            }
        }
    } else {
        return TRUE;
    }
    
    return FALSE;
}

-(void)computePoints {
    [self roundScore];
    
    if (isPointsFaits) {
        int scorePartant = 0;
        int scoreDefense = 0;
        
        if (aCapotSelected) {
            if (capotSelected) {
                scorePartant = 500;
                scoreDefense = 0;
            } else {
                scorePartant = 0;
                scoreDefense = 410;
            }
        } else {
            if (score > annonce) {
                scorePartant = annonce + score;
                scoreDefense = 160 - score;
            } else {
                scorePartant = 0;
                scoreDefense = annonce + 160;
            }
        }
        
        // Gestion contré + sur-contré
        int boost = 1;
        if(aSurContreSelected ) {
            boost = 4;
        } else if (aContreSelected) {
            boost = 2;
        }
        if (scorePartant > scoreDefense) {
            scorePartant = scorePartant * boost;
        } else {
            scoreDefense = scoreDefense * boost;
        }
        
        
        if (nousSelected) {
            scoreNous = scorePartant;
            scoreEux = scoreDefense;
        } else {
            scoreNous = scoreDefense;
            scoreEux = scorePartant;
        }
    } else {
        int points = 0;
        
        if (aCapotSelected) {
            points = 250;
        } else {
            points = annonce;
        }
        
        if (aSurContreSelected) {
            points = points * 4;
        } else if (aContreSelected) {
            points = points * 2;
        }
        
        if (isFait || capotSelected) {
            if (nousSelected) {
                scoreNous = points;
                scoreEux = 0;
            } else {
                scoreNous = 0;
                scoreEux = points;
            }
        } else {
            if (nousSelected) {
                scoreNous = 0;
                scoreEux = points;
            } else {
                scoreNous = points;
                scoreEux = 0;
            }
        }
    }
}

-(int)roundScore {
    int mod = score % 10;
    if (mod < 5) {
        score -= mod;
    } else {
        score += 10 - mod;
    }
    
    return score;
}

#pragma Override Getters

-(int)scoreNous{
    if(!scoreNous) {
        [self computePoints];
    }
    return scoreNous;
}

-(int)scoreEux{
    if(!scoreEux) {
        [self computePoints];
    }
    return scoreEux;
}

@end
