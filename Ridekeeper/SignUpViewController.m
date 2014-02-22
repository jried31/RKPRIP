//
//  SignUpViewController.m
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 2/21/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)register:(id)sender {
    [_usernamefield resignFirstResponder];
    [_emailfield resignFirstResponder];
    [_passwordfield resignFirstResponder];
    [_retypepasswordfield resignFirstResponder];
    [self checkfieldvalid];
}


//check if all the fields are valid
-(void) checkfieldvalid{
    //if all the fields are not valid notify user
    if ([_usernamefield.text isEqualToString:@""]||[_emailfield.text isEqualToString:@""]||[_passwordfield.text isEqualToString:@""]||[_retypepasswordfield.text isEqualToString:@""]) {
        UIAlertView *empty =[[UIAlertView alloc] initWithTitle:@"OOPS!!" message:@"All fields must be completed" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:  nil];
        [empty show];
    }
    //else shekc if the passwords match
    else{
        [self PassWordMatch];
    }
}
-(void) PassWordMatch{
    //if the passwords dont match notify the user
    if (![_passwordfield.text isEqualToString:_retypepasswordfield.text]) {
        UIAlertView *mismatch =[[UIAlertView alloc] initWithTitle:@"OOPS!!" message:@"Passwords are different. Please make sure they are same" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [mismatch show];
    }
    //if they match try to register the user with the given information
    else{
        [self registerNewUser];
    }
}

//register a new user
-(void) registerNewUser{
    PFUser *user =[PFUser user];
    user.username = _usernamefield.text;
    user.password = _passwordfield.text;
    user.email = _emailfield.text;
    //try signing up with the information provided
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        // if there is no error go back to the login window so the user can login to his account
        if (!error) {
            [self performSegueWithIdentifier:@"backlogin" sender:self];
        }
        //if there is an error in registering 
        else{
            //do sth to handle the error
            UIAlertView *failure = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error in signing up try using a different username or email" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:  nil];
            [failure show];
        }
        
        
    }];
    
}

@end
