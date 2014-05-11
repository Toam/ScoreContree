//
//  Game.m
//  ScoreContree
//
//  Created by Tom on 22/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize isPointsFaits;
@synthesize scoreNous, scoreEux;

static Game *sharedInstance = nil;

#pragma mark - Singleton

+ (Game *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scoreNous = 0;
        self.scoreEux = 0;
        self.rounds = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Game Logic

- (void)reset {
    self.scoreNous = 0;
    self.scoreEux = 0;
    self.rounds = [[NSMutableArray alloc] init];
}

- (void)addRound:(Round *)round {
    [self.rounds addObject:round];
    self.scoreNous += round.scoreNous;
    self.scoreEux += round.scoreEux;
    
    round.scoreTotalNous = self.scoreNous;
    round.scoreTotalEux = self.scoreEux;
}

@end
