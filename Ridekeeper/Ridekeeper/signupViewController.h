//
//  signupViewController.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/6/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface signupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernamefield;
@property (weak, nonatomic) IBOutlet UITextField *emailfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordfield;
@property (weak, nonatomic) IBOutlet UITextField *retypepasswordfield;


- (IBAction)register:(id)sender;

@end