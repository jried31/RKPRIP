//
//  LoginViewController.h
//  RideKeeper
//
//  Created by Dennis Grijalva on 2/15/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface LoginViewController : PFLogInViewController

@end

// Implement both delegates
@interface DefaultSettingsViewController :
UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@end