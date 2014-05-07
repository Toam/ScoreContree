//
//  MancheViewController.h
//  ScoreContree
//
//  Created by Tom on 23/04/2014.
//  Copyright (c) 2014 LabStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Round.h"

@interface MancheViewController : UIViewController

@property (nonatomic) BOOL nousSelected;
@property (nonatomic) BOOL euxSelected;
@property (nonatomic) int score;
@property (nonatomic) BOOL capotSelected;
@property (nonatomic) int annonce;
@property (nonatomic) BOOL aCapotSelected;
@property (nonatomic) BOOL aContreSelected;
@property (nonatomic) BOOL aSurContreSelected;

@property (strong, nonatomic) Round *round;

@property (weak, nonatomic) IBOutlet UIButton *nousButton;
@property (weak, nonatomic) IBOutlet UIButton *euxButton;

@property (weak, nonatomic) IBOutlet UIButton *capotButton;
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;

//TODO A refacto
@property (weak, nonatomic) IBOutlet UIButton *a80Button;
@property (weak, nonatomic) IBOutlet UIButton *a90Button;
@property (weak, nonatomic) IBOutlet UIButton *a100Button;
@property (weak, nonatomic) IBOutlet UIButton *a110Button;
@property (weak, nonatomic) IBOutlet UIButton *a120Button;
@property (weak, nonatomic) IBOutlet UIButton *a130Button;
@property (weak, nonatomic) IBOutlet UIButton *a140Button;
@property (weak, nonatomic) IBOutlet UIButton *a150Button;
@property (weak, nonatomic) IBOutlet UIButton *a160Button;
@property (weak, nonatomic) IBOutlet UIButton *a170Button;
@property (weak, nonatomic) IBOutlet UIButton *aCapotButton;

@property (weak, nonatomic) IBOutlet UIButton *aContreButton;
@property (weak, nonatomic) IBOutlet UIButton *aSurContreButton;

@property (weak, nonatomic) IBOutlet UIButton *validerButton;

- (IBAction)nousClic:(id)sender;
- (IBAction)euxClic:(id)sender;

- (IBAction)capotSelected:(id)sender;

- (IBAction)a80Clic:(id)sender;
- (IBAction)a90Clic:(id)sender;
- (IBAction)a100Clic:(id)sender;
- (IBAction)a110Clic:(id)sender;
- (IBAction)a120Clic:(id)sender;
- (IBAction)a130Clic:(id)sender;
- (IBAction)a140Clic:(id)sender;
- (IBAction)a150Clic:(id)sender;
- (IBAction)a160Clic:(id)sender;
- (IBAction)a170Clic:(id)sender;
- (IBAction)aCapotClic:(id)sender;
- (IBAction)aContreClic:(id)sender;
- (IBAction)aSurContreClic:(id)sender;

@end
