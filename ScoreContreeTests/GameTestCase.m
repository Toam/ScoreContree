//
//  GameTestCase.m
//  ScoreContree
//
//  Created by Tom on 22/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Game.h"

@interface GameTestCase : XCTestCase
@end

@implementation GameTestCase

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCanSetMode
{
    Game *game = [[Game alloc] init];
    
    [game setPointsFaits:TRUE];
    XCTAssertEqual([game isPointsFaits], TRUE, @"Should be Points Faits");
    
    [game setPointsFaits:FALSE];
    XCTAssertEqual([game isPointsFaits], FALSE, @"Should not be Points Faits");
}

- (void)testInitScore
{
    Game *game = [[Game alloc] init];
    XCTAssertEqual(game.scoreNous, 0, @"ScoreNous should equal 0");
    XCTAssertEqual(game.scoreEux, 0, @"ScoreEux should equal 0");
}

@end
