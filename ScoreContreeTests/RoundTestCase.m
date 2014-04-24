//
//  RoundTestCase.m
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Round.h"

@interface RoundTestCase : XCTestCase
@end

@implementation RoundTestCase

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testRoundInvalid
{
    Round *round = [[Round alloc] init];
    XCTAssertEqual(round.isValid, FALSE);
    
    round.nousSelected = TRUE;
    round.score = 0;
    round.capotSelected = FALSE;
    XCTAssertEqual(round.isValid, FALSE);
    
    round.nousSelected = TRUE;
    round.score = 10000;
    round.annonce = 120;
    XCTAssertEqual(round.isValid, FALSE);
    
    round.nousSelected = TRUE;
    round.score = 14;
    round.annonce = 120;
    XCTAssertEqual(round.isValid, FALSE);
}

- (void)testRoundValid
{
    Round *round = [[Round alloc] init];
    round.nousSelected = TRUE;
    round.score = 134;
    round.annonce = 120;
    XCTAssertEqual(round.isValid, TRUE);
    
    Round *round2 = [[Round alloc] init];
    round2.nousSelected = TRUE;
    round2.score = 0;
    round2.capotSelected = TRUE;
    round2.annonce = 120;
    XCTAssertEqual(round2.isValid, TRUE);
}

@end
