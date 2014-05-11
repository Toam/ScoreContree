//
//  ScoreViewController.h
//  ScoreContree
//
//  Created by Tom on 21/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "Game.h"

@interface ScoreViewController : GAITrackedViewController <UITableViewDelegate, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic) Game *game;

- (IBAction)exitButton:(id)sender;

@end
