//
//  ScoreViewController.m
//  ScoreContree
//
//  Created by Tom on 21/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _game = [Game sharedInstance];
        self.screenName = @"Scores Screen";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _game = [Game sharedInstance];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([_game.rounds count] > 0)
        [_table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[_game.rounds count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_game.rounds count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"scoreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Round *round = _game.rounds[indexPath.row];
    
    if([_game.rounds count] - indexPath.row - 1 == 0) {
    //    cell.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f];
    }
    
    UILabel *label;

    label = (UILabel *)[cell viewWithTag:1];
    if (round.scoreNous > 0) {
        label.text = [NSString stringWithFormat:@"+%d", round.scoreNous];
    } else {
        label.text = @"";
    }

    label = (UILabel *)[cell viewWithTag:2];
    label.text = [NSString stringWithFormat:@"%d", round.scoreTotalNous];
    
    label = (UILabel *)[cell viewWithTag:3];
    if (round.scoreEux > 0) {
        label.text = [NSString stringWithFormat:@"+%d", round.scoreEux];
    } else {
        label.text = @"";
    }
    
    
    label = (UILabel *)[cell viewWithTag:4];
    label.text = [NSString stringWithFormat:@"%d", round.scoreTotalEux];
    
    return cell;
}

- (IBAction)exitButton:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Êtes-vous sur de vouloir quitter la partie ?"
                                                     delegate:self
                                            cancelButtonTitle:@"Annuler"
                                            otherButtonTitles:@"Quitter",nil];
    
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self performSegueWithIdentifier:@"segue.quit" sender:self];
    }
}

@end
