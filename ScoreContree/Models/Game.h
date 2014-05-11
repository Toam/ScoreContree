//
//  Game.h
//  ScoreContree
//
//  Created by Tom on 22/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Round.h"

@interface Game : NSObject

@property (nonatomic) NSMutableArray *rounds;

@property (nonatomic) int scoreNous;
@property (nonatomic) int scoreEux;
@property (nonatomic) BOOL isPointsFaits;

+(id)sharedInstance;
-(void)reset;
-(void)addRound:(Round *)round;

@end
