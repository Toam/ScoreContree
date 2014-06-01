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

- (void)testRoundPointsFaitsInvalid
{
    Round *round = [[Round alloc] init];
    XCTAssertEqual(round.isValid, FALSE);
    
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.score = 0;
    round.capotSelected = FALSE;
    XCTAssertEqual(round.isValid, FALSE);
    
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.score = 10000;
    round.annonce = 120;
    XCTAssertEqual(round.isValid, FALSE);
    
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.score = 14;
    round.annonce = 120;
    XCTAssertEqual(round.isValid, TRUE);
    
    Round *round2 = [[Round alloc] init];
    round2.isPointsFaits = TRUE;
    round2.nousSelected = TRUE;
    round2.score = 120;
    round2.annonce = 0;
    XCTAssertEqual(round2.isValid, FALSE);
}

- (void)testRoundPointsAnnoncesInvalid
{
    Round *round = [[Round alloc] init];
    XCTAssertEqual(round.isValid, FALSE);
    
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.isFait = FALSE;
    round.capotSelected = FALSE;
    XCTAssertEqual(round.isValid, FALSE);
    
    Round *round2 = [[Round alloc] init];
    round2.isPointsFaits = FALSE;
    round2.nousSelected = TRUE;
    round2.isFait = FALSE;
    round2.annonce = 0;
    XCTAssertEqual(round2.isValid, FALSE);
}

- (void)testRoundPointsFaitsValid
{
    Round *round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 134;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    
    Round *round2 = [[Round alloc] init];
    round2.isPointsFaits = TRUE;
    round2.nousSelected = TRUE;
    round2.euxSelected = FALSE;
    round2.score = 0;
    round2.capotSelected = TRUE;
    round2.annonce = 90;
    round2.aCapotSelected = FALSE;
    round2.aContreSelected = FALSE;
    round2.aSurContreSelected = FALSE;
    XCTAssertEqual(round2.isValid, TRUE);
    
    Round *round3 = [[Round alloc] init];
    round3.isPointsFaits = TRUE;
    round3.nousSelected = TRUE;
    round3.euxSelected = FALSE;
    round3.score = 130;
    round3.capotSelected = FALSE;
    round3.annonce = 90;
    round3.aCapotSelected = FALSE;
    round3.aContreSelected = FALSE;
    round3.aSurContreSelected = FALSE;
    XCTAssertEqual(round3.isValid, TRUE);
    
    Round *round4 = [[Round alloc] init];
    round4.isPointsFaits = TRUE;
    round4.nousSelected = FALSE;
    round4.euxSelected = TRUE;
    round4.score = 130;
    round4.capotSelected = FALSE;
    round4.annonce = 0;
    round4.aCapotSelected = TRUE;
    round4.aContreSelected = FALSE;
    round4.aSurContreSelected = FALSE;
    XCTAssertEqual(round4.isValid, TRUE);
}

- (void)testRoundPointsAnnoncesValid
{
    Round *round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = TRUE;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    
    Round *round2 = [[Round alloc] init];
    round2.isPointsFaits = FALSE;
    round2.nousSelected = TRUE;
    round2.euxSelected = FALSE;
    round2.isFait = TRUE;
    round2.capotSelected = TRUE;
    round2.annonce = 90;
    round2.aCapotSelected = FALSE;
    round2.aContreSelected = FALSE;
    round2.aSurContreSelected = FALSE;
    XCTAssertEqual(round2.isValid, TRUE);
    
    Round *round3 = [[Round alloc] init];
    round3.isPointsFaits = FALSE;
    round3.nousSelected = TRUE;
    round3.euxSelected = FALSE;
    round3.isFait = TRUE;
    round3.capotSelected = FALSE;
    round3.annonce = 90;
    round3.aCapotSelected = FALSE;
    round3.aContreSelected = FALSE;
    round3.aSurContreSelected = FALSE;
    XCTAssertEqual(round3.isValid, TRUE);
    
    Round *round4 = [[Round alloc] init];
    round4.isPointsFaits = FALSE;
    round4.nousSelected = FALSE;
    round4.euxSelected = TRUE;
    round4.isFait = TRUE;
    round4.capotSelected = FALSE;
    round4.annonce = 0;
    round4.aCapotSelected = TRUE;
    round4.aContreSelected = FALSE;
    round4.aSurContreSelected = FALSE;
    XCTAssertEqual(round4.isValid, TRUE);
}

- (void)testScorePointsAnnonces {
    Round *round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = TRUE;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 120);
    XCTAssertEqual(round.scoreEux, 0);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = FALSE;
    round.euxSelected = TRUE;
    round.isFait = TRUE;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 120);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = FALSE;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 120);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = FALSE;
    round.capotSelected = TRUE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 120);
    XCTAssertEqual(round.scoreEux, 0);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = FALSE;
    round.capotSelected = TRUE;
    round.annonce = 0;
    round.aCapotSelected = TRUE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 250);
    XCTAssertEqual(round.scoreEux, 0);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = FALSE;
    round.capotSelected = TRUE;
    round.annonce = 0;
    round.aCapotSelected = TRUE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 250);
    XCTAssertEqual(round.scoreEux, 0);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = TRUE;
    round.capotSelected = FALSE;
    round.annonce = 0;
    round.aCapotSelected = TRUE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 250);
    XCTAssertEqual(round.scoreEux, 0);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = FALSE;
    round.capotSelected = TRUE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 240);
    XCTAssertEqual(round.scoreEux, 0);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = FALSE;
    round.euxSelected = TRUE;
    round.isFait = TRUE;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 240);
    
    round = [[Round alloc] init];
    round.isPointsFaits = FALSE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.isFait = TRUE;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = TRUE;
    XCTAssertEqual(round.isValid, TRUE);
    XCTAssertEqual(round.scoreNous, 480);
    XCTAssertEqual(round.scoreEux, 0);
}

- (void)testScorePointsFaits {
    Round *round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 88;
    round.capotSelected = FALSE;
    round.annonce = 80;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 170);
    XCTAssertEqual(round.scoreEux, 70);

    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 84;
    round.capotSelected = FALSE;
    round.annonce = 90;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 250);

    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 0;
    round.capotSelected = TRUE;
    round.annonce = 0;
    round.aCapotSelected = TRUE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 500);
    XCTAssertEqual(round.scoreEux, 0);

    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 80;
    round.capotSelected = FALSE;
    round.annonce = 0;
    round.aCapotSelected = TRUE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 410);
    
    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 88;
    round.capotSelected = FALSE;
    round.annonce = 80;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 340);
    XCTAssertEqual(round.scoreEux, 70);
    
    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 84;
    round.capotSelected = FALSE;
    round.annonce = 90;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 500);
    
    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 88;
    round.capotSelected = FALSE;
    round.annonce = 80;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = TRUE;
    XCTAssertEqual(round.scoreNous, 680);
    XCTAssertEqual(round.scoreEux, 70);
    
    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = TRUE;
    round.euxSelected = FALSE;
    round.score = 84;
    round.capotSelected = FALSE;
    round.annonce = 90;
    round.aCapotSelected = FALSE;
    round.aContreSelected = TRUE;
    round.aSurContreSelected = TRUE;
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 1000);
    
    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = FALSE;
    round.euxSelected = TRUE;
    round.score = 0;
    round.capotSelected = TRUE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 0);
    XCTAssertEqual(round.scoreEux, 280);
    
    round = [[Round alloc] init];
    round.isPointsFaits = TRUE;
    round.nousSelected = FALSE;
    round.euxSelected = TRUE;
    round.score = 120;
    round.capotSelected = FALSE;
    round.annonce = 120;
    round.aCapotSelected = FALSE;
    round.aContreSelected = FALSE;
    round.aSurContreSelected = FALSE;
    XCTAssertEqual(round.scoreNous, 40);
    XCTAssertEqual(round.scoreEux, 240);
}

- (void)testRoundScore
{
    Round *round;
    
    round = [[Round alloc] init];
    round.score = 82;
    XCTAssertEqual(round.roundScore, 80);
    
    round = [[Round alloc] init];
    round.score = 85;
    XCTAssertEqual(round.roundScore, 90);
    
    round = [[Round alloc] init];
    round.score = 88;
    XCTAssertEqual(round.roundScore, 90);
    
    round = [[Round alloc] init];
    round.score = 90;
    XCTAssertEqual(round.roundScore, 90);
    
    round = [[Round alloc] init];
    round.score = 122;
    XCTAssertEqual(round.roundScore, 120);
}

@end
