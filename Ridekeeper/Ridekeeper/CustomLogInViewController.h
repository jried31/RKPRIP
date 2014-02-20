//
//  CustomLogInViewController.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 2/20/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CustomLogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *passwordfield;
@property (weak, nonatomic) IBOutlet UITextField *usernamefield;


@property (weak, nonatomic) IBOutlet UIView *SignUpOverlayView;
@property (weak, nonatomic) IBOutlet UITextField *usernamesignup;
@property (weak, nonatomic) IBOutlet UITextField *emailsignup;
@property (weak, nonatomic) IBOutlet UITextField *passwordsignup;
@property (weak, nonatomic) IBOutlet UITextField *retypepasswordsignup;



- (IBAction)SignUp:(id)sender;
- (IBAction)login:(id)sender;

- (IBAction)register:(id)sender;

@end
