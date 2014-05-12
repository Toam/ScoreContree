//
//  MancheViewController.m
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import "MancheViewController.h"

@interface MancheViewController ()

@end

@implementation MancheViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.screenName = @"Ajout Manche Screen";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Game *game = [Game sharedInstance];
    if (game.isPointsFaits) {
        _pointsFaitsLabel.hidden = FALSE;
        _scoreTextField.hidden = FALSE;
        _capotButton.hidden = FALSE;
        _contratRemplisLabel.hidden = TRUE;
        _faitBouton.hidden = TRUE;
        _chuteBouton.hidden = TRUE;
    } else {
        _pointsFaitsLabel.hidden = TRUE;
        _scoreTextField.hidden = TRUE;
        _capotButton.hidden = TRUE;
        _contratRemplisLabel.hidden = FALSE;
        _faitBouton.hidden = FALSE;
        _chuteBouton.hidden = FALSE;
    }
    
    _nousSelected = FALSE;
    _euxSelected = FALSE;
    _capotSelected = FALSE;
    _annonce = 0;
    _aCapotSelected = FALSE;
    
    _round = [[Round alloc] init];
    _round.isPointsFaits = game.isPointsFaits;
    _round.nousSelected = FALSE;
    _round.euxSelected = FALSE;
    _round.isFait = TRUE;
    _round.capotSelected = FALSE;
    _round.annonce = 0;
    _round.aCapotSelected = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([_scoreTextField isFirstResponder] && [touch view] != _scoreTextField) {
        _round.capotSelected = FALSE;
        [_scoreTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
    [self updateBoutons];
}

- (IBAction)cancelClic:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Annuler la saisie de cette manche ?"
                                                     delegate:self
                                            cancelButtonTitle:@"Non"
                                            otherButtonTitles:@"Oui",nil];
    
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self performSegueWithIdentifier:@"segue.quit" sender:self];
    }
}

- (IBAction)nousClic:(id)sender {
    _round.nousSelected = TRUE;
    _round.euxSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)euxClic:(id)sender {
    _round.nousSelected = FALSE;
    _round.euxSelected = TRUE;
    [self updateBoutons];
}

- (IBAction)capotSelected:(id)sender {
    _round.capotSelected = !_round.capotSelected;
    _scoreTextField.text = @"";
    [self updateBoutons];
}

- (IBAction)faitSelected:(id)sender {
    _round.isFait = TRUE;
    [self updateBoutons];
}

- (IBAction)chuteSelected:(id)sender {
    _round.isFait = FALSE;
    [self updateBoutons];
}

- (IBAction)a80Clic:(id)sender {
    _round.annonce = 80;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a90Clic:(id)sender {
    _round.annonce = 90;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a100Clic:(id)sender {
    _round.annonce = 100;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a110Clic:(id)sender {
    _round.annonce = 110;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a120Clic:(id)sender {
    _round.annonce = 120;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a130Clic:(id)sender {
    _round.annonce = 130;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a140Clic:(id)sender {
    _round.annonce = 140;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a150Clic:(id)sender {
    _round.annonce = 150;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a160Clic:(id)sender {
    _round.annonce = 160;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a170Clic:(id)sender {
    _round.annonce = 170;
    _round.aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)aCapotClic:(id)sender {
    _round.annonce = 0;
    _round.aCapotSelected = TRUE;
    [self updateBoutons];
}

- (IBAction)aContreClic:(id)sender {
    _round.aContreSelected = !_round.aContreSelected;
    _round.aSurContreSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)aSurContreClic:(id)sender {
    _round.aContreSelected = FALSE;
    _round.aSurContreSelected = !_round.aSurContreSelected;
    [self updateBoutons];
}

- (void)updateBoutons {
    
    _round.score = [_scoreTextField.text intValue];
    
    [self setBigButtonBackground:_nousButton isActive:_round.nousSelected];
    [self setBigButtonBackground:_euxButton isActive:_round.euxSelected];
    
    [_scoreTextField resignFirstResponder];
    [self setBigButtonBackground:_capotButton isActive:_round.capotSelected];
    
    [self setBigButtonBackground:_faitBouton isActive:_round.isFait];
    [self setBigButtonBackground:_chuteBouton isActive:!_round.isFait];
    
    [self setButtonBackground:_a80Button isActive:(_round.annonce == 80)];
    [self setButtonBackground:_a90Button isActive:(_round.annonce == 90)];
    [self setButtonBackground:_a100Button isActive:(_round.annonce == 100)];
    [self setButtonBackground:_a110Button isActive:(_round.annonce == 110)];
    [self setButtonBackground:_a120Button isActive:(_round.annonce == 120)];
    [self setButtonBackground:_a130Button isActive:(_round.annonce == 130)];
    [self setButtonBackground:_a140Button isActive:(_round.annonce == 140)];
    [self setButtonBackground:_a150Button isActive:(_round.annonce == 150)];
    [self setButtonBackground:_a160Button isActive:(_round.annonce == 160)];
    [self setButtonBackground:_a170Button isActive:(_round.annonce == 170)];
    
    [self setBigButtonBackground:_aCapotButton isActive:_round.aCapotSelected];
    
    [self setBigButtonBackground:_aContreButton isActive:_round.aContreSelected];
    [self setBigButtonBackground:_aSurContreButton isActive:_round.aSurContreSelected];
    
    _validerButton.enabled = _round.isValid;
}

-(void)setButtonBackground:(UIButton *)button isActive:(BOOL)active {
    if (active) {
        [button setBackgroundImage:[UIImage imageNamed:@"BoutonOn.png"] forState:UIControlStateNormal];
    } else {
        [button setBackgroundImage:[UIImage imageNamed:@"BoutonOff.png"] forState:UIControlStateNormal];
    }
}

-(void)setBigButtonBackground:(UIButton *)button isActive:(BOOL)active {
    if (active) {
        [button setBackgroundImage:[UIImage imageNamed:@"BoutonBigOn.png"] forState:UIControlStateNormal];
    } else {
        [button setBackgroundImage:[UIImage imageNamed:@"BoutonBigOff.png"] forState:UIControlStateNormal];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue.quit"]) {
        //Do Nothing
    } else {
        Game *game = [Game sharedInstance];
        [game addRound:_round];
    }
    
}
@end
