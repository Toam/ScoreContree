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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _nousSelected = FALSE;
    _euxSelected = FALSE;
    _capotSelected = FALSE;
    _annonce = 0;
    _aCapotSelected = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([_scoreTextField isFirstResponder] && [touch view] != _scoreTextField) {
        [_scoreTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)nousClic:(id)sender {
    _nousSelected = TRUE;
    _euxSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)euxClic:(id)sender {
    _nousSelected = FALSE;
    _euxSelected = TRUE;
    [self updateBoutons];
}

- (IBAction)capotSelected:(id)sender {
    _capotSelected = !_capotSelected;
    [self updateBoutons];
}

- (IBAction)a80Clic:(id)sender {
    _annonce = 80;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a90Clic:(id)sender {
    _annonce = 90;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a100Clic:(id)sender {
    _annonce = 100;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a110Clic:(id)sender {
    _annonce = 110;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a120Clic:(id)sender {
    _annonce = 120;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a130Clic:(id)sender {
    _annonce = 130;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a140Clic:(id)sender {
    _annonce = 140;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a150Clic:(id)sender {
    _annonce = 150;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a160Clic:(id)sender {
    _annonce = 160;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)a170Clic:(id)sender {
    _annonce = 170;
    _aCapotSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)aCapotClic:(id)sender {
    _annonce = 0;
    _aCapotSelected = TRUE;
    [self updateBoutons];
}

- (IBAction)aContreClic:(id)sender {
    _aContreSelected = !_aContreSelected;
    _aSurContreSelected = FALSE;
    [self updateBoutons];
}

- (IBAction)aSurContreClic:(id)sender {
    _aContreSelected = FALSE;
    _aSurContreSelected = !_aSurContreSelected;
    [self updateBoutons];
}

- (void)updateBoutons {
    [self setBigButtonBackground:_nousButton isActive:_nousSelected];
    [self setBigButtonBackground:_euxButton isActive:_euxSelected];
    
    [_scoreTextField resignFirstResponder];
    [self setBigButtonBackground:_capotButton isActive:_capotSelected];
    
    [self setButtonBackground:_a80Button isActive:(_annonce == 80)];
    [self setButtonBackground:_a90Button isActive:(_annonce == 90)];
    [self setButtonBackground:_a100Button isActive:(_annonce == 100)];
    [self setButtonBackground:_a110Button isActive:(_annonce == 110)];
    [self setButtonBackground:_a120Button isActive:(_annonce == 120)];
    [self setButtonBackground:_a130Button isActive:(_annonce == 130)];
    [self setButtonBackground:_a140Button isActive:(_annonce == 140)];
    [self setButtonBackground:_a150Button isActive:(_annonce == 150)];
    [self setButtonBackground:_a160Button isActive:(_annonce == 160)];
    [self setButtonBackground:_a170Button isActive:(_annonce == 170)];
    
    [self setBigButtonBackground:_aCapotButton isActive:_aCapotSelected];
    
    [self setBigButtonBackground:_aContreButton isActive:_aContreSelected];
    [self setBigButtonBackground:_aSurContreButton isActive:_aSurContreSelected];
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
@end
