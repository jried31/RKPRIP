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


- (IBAction)login:(id)sender;

@end
