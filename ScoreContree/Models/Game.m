//
//  Game.m
//  ScoreContree
//
//  Created by Tom on 22/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize scoreNous, scoreEux;

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.scoreNous = 0;
        self.scoreEux = 0;
    }
    return self;
}

- (int)addRound {
    return 12;
}

@end
