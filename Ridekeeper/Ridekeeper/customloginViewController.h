//
//  customloginViewController.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/6/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//
#import "Parse/Parse.h"
@interface customloginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *passwordfield;
@property (weak, nonatomic) IBOutlet UITextField *usernamefield;


- (IBAction)login:(id)sender;

@end