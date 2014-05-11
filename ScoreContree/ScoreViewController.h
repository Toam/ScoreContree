//
//  ScoreViewController.h
//  ScoreContree
//
//  Created by Tom on 21/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface ScoreViewController : UIViewController <UITableViewDelegate, UITableViewDelegate>

@property (nonatomic) Game *game;

@end
