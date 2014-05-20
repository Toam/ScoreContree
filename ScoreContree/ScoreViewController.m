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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _game = [Game sharedInstance];
    self.screenName = @"Scores Screen";
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
    
    UILabel *label;

    label = (UILabel *)[cell viewWithTag:1];
    if (round.scoreNous > 0) {
        label.text = [NSString stringWithFormat:@"+%d", round.scoreNous];
    } else {
        label.text = @"";
    }

    label = (UILabel *)[cell viewWithTag:2];
    label.text = [NSString stringWithFormat:@"%d", round.scoreTotalNous];
    if([_game.rounds count] == (indexPath.row + 1)) {
        [label setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:24]];
    }
    
    label = (UILabel *)[cell viewWithTag:3];
    if (round.scoreEux > 0) {
        label.text = [NSString stringWithFormat:@"+%d", round.scoreEux];
    } else {
        label.text = @"";
    }
    
    
    label = (UILabel *)[cell viewWithTag:4];
    label.text = [NSString stringWithFormat:@"%d", round.scoreTotalEux];
    if([_game.rounds count] == (indexPath.row + 1)) {
        [label setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:24]];
    }
    
    if([_game.rounds count] == (indexPath.row + 1)) {
        UIButton *cancel = (UIButton *)[cell viewWithTag:5];
        cancel.hidden = FALSE;
    }
    
    return cell;
}

- (IBAction)exitButton:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Êtes-vous sur de vouloir quitter la partie ?"
                                                     delegate:self
                                            cancelButtonTitle:@"Annuler"
                                            otherButtonTitles:@"Quitter",nil];
    
    _actionCancel = FALSE;
    
    [message show];
}

- (IBAction)cancelClic:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Supprimer cette manche ?"
                                                     delegate:self
                                            cancelButtonTitle:@"Non"
                                            otherButtonTitles:@"Oui",nil];
    _actionCancel = TRUE;
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        if (_actionCancel) {
            Round *lastRound = [_game.rounds lastObject];
            _game.scoreNous -= lastRound.scoreNous;
            _game.scoreEux -= lastRound.scoreEux;
            [_game.rounds removeLastObject];
            [self.table reloadData];
        } else {
            [self performSegueWithIdentifier:@"segue.quit" sender:self];
        }
    }
}





@end
