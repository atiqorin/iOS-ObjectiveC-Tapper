//
//  ViewController.m
//  tapper-objc
//
//  Created by A S M Atiqur Rahim Khan on 5/24/16.
//  Copyright © 2016 atiqorin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int tapsToWin;
    int currentTaps;
}

@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UITextField *howManyTapsField;
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;
@property (weak, nonatomic) IBOutlet UILabel *howManylabel;
@property (weak, nonatomic) IBOutlet UIButton *coinImg;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tapsToWin = 0;
    currentTaps = 0;
    [self startGame];
}

- (IBAction)playBtnTapped:(id)sender{
    if(![self.howManyTapsField.text isEqual:@""]){
        tapsToWin = [self.howManyTapsField.text intValue];
        if(tapsToWin){
            [self playGame];
        } else{
            [self showAlert:@"Number Required" message:@"Please enter a valid number"];
        }
    } else{
        [self showAlert:@"No value entered" message:@"please enter number of taps to win"];
    }
}

- (IBAction)coinImgTapped:(id)sender{
    currentTaps++;
    if(currentTaps < tapsToWin){
        self.howManylabel.text = [NSString stringWithFormat:
                                  @"%d Taps", currentTaps];
    } else{
        [self gameOver];
    }
}

-(void) startGame{
    currentTaps = 0;
    tapsToWin = 0;
    
    self.playBtn.hidden = NO;
    self.titleImg.hidden =NO;
    self.coinImg.hidden = YES;
    self.howManyTapsField.hidden =NO;
    self.howManylabel.hidden =YES;
    self.howManyTapsField.text =@"";
}

-(void) playGame{
    self.playBtn.hidden = YES;
    self.howManyTapsField.hidden = YES;
    self.titleImg.hidden = YES;
    self.coinImg.hidden = NO;
    self.howManylabel.hidden = NO;
    self.howManylabel.text = @"0 Taps";
}

-(void) gameOver{
    currentTaps = 0;
    tapsToWin = 0;
    
    self.playBtn.hidden = NO;
    self.titleImg.hidden =NO;
    self.coinImg.hidden = YES;
    self.howManyTapsField.hidden =NO;
    self.howManylabel.hidden =YES;
    self.howManyTapsField.text =@"";
    
    [self showAlert:@"Game Over" message:@"Press OK to restart"];
}

-(void) showAlert:(NSString*) alertTitle message:(NSString*) message {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:alertTitle message:message preferredStyle:
                                UIAlertControllerStyleAlert];
    UIAlertAction *okBtn = [UIAlertAction
                            actionWithTitle:@"Ok" style:
                            UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                [self startGame];
                            }];
    [alert addAction:okBtn];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
