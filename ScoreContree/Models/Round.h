//
//  Round.h
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

@property (nonatomic) BOOL nousSelected;
@property (nonatomic) BOOL euxSelected;
@property (nonatomic) int score;
@property (nonatomic) BOOL capotSelected;
@property (nonatomic) int annonce;
@property (nonatomic) BOOL aCapotSelected;
@property (nonatomic) BOOL aContreSelected;
@property (nonatomic) BOOL aSurContreSelected;

-(BOOL)isValid;

@end
