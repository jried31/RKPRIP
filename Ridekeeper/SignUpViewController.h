//
//  SignUpViewController.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 2/21/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernamefield;
@property (weak, nonatomic) IBOutlet UITextField *emailfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordfield;
@property (weak, nonatomic) IBOutlet UITextField *retypepasswordfield;

- (IBAction)register:(id)sender;

@end
