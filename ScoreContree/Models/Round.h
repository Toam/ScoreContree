//
//  Round.h
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

@property (nonatomic) int scoreNous;
@property (nonatomic) int scoreEux;

// for history :
@property (nonatomic) int scoreTotalNous;
@property (nonatomic) int scoreTotalEux;

@property (nonatomic) BOOL isPointsFaits;
@property (nonatomic) BOOL nousSelected;
@property (nonatomic) BOOL euxSelected;
@property (nonatomic) int score;
@property (nonatomic) BOOL isFait;
@property (nonatomic) BOOL capotSelected;
@property (nonatomic) int annonce;
@property (nonatomic) BOOL aCapotSelected;
@property (nonatomic) BOOL aContreSelected;
@property (nonatomic) BOOL aSurContreSelected;

-(BOOL)isValid;
-(void)computePoints;
-(int)roundScore;

@end
