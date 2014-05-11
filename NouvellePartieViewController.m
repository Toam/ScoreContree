//
//  NouvellePartieViewController.m
//  ScoreContree
//
//  Created by Tom on 08/05/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "NouvellePartieViewController.h"

@interface NouvellePartieViewController ()

@end

@implementation NouvellePartieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.screenName = @"Nouvelle Partie Screen";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Game *game = [Game sharedInstance];
    [game reset];
    
    [[UIApplication sharedApplication] setIdleTimerDisabled: YES];
    
    if ([segue.identifier isEqualToString:@"pointsFaits"]) {
        game.isPointsFaits = TRUE;
    }

    if ([segue.identifier isEqualToString:@"pointsAnnonces"]) {
        game.isPointsFaits = FALSE;
    }
}

@end
