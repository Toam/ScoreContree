//
//  Game.h
//  ScoreContree
//
//  Created by Tom on 22/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic) int scoreNous;
@property (nonatomic) int scoreEux;
@property (nonatomic, getter = isPointsFaits) BOOL pointsFaits;

-(int)addRound;

@end
