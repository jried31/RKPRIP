//
//  CustomLogInViewController.m
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 2/20/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "CustomLogInViewController.h"

@interface CustomLogInViewController ()

@end

@implementation CustomLogInViewController

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

-(void)viewDidAppear:(BOOL)animated{
    PFUser *user =[PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//chek if any of the field are left empty
/*-(void) checkfieldempty{
    if ([_usernamefield.text isEqualToString:@""] || [_passwordfield.text isEqualToString:@""])
    {
        UIAlertView *empty = [[UIAlertView alloc]
                              initWithTitle:@"Empty fields" message:@"Please provide your user name and password"
                              delegate:self
                              cancelButtonTitle:@"ok"
                              otherButtonTitles:nil, nil];
        [empty show];
    }
}*/

//for the signup window

//check if all fields are complete and legally valid
-(void) checkfieldvalid{
    if ([_usernamesignup.text isEqualToString:@""]||[_emailsignup.text isEqualToString:@""]||[_passwordsignup.text isEqualToString:@""]||[_retypepasswordsignup.text isEqualToString:@""]) {
        UIAlertView *empty =[[UIAlertView alloc] initWithTitle:@"OOPS!!" message:@"All fields must be completed" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:  nil];
        [empty show];
    }
    else{
        [self PassWordMatch];
    }
}

//check if the two password fields are similar during signup
-(void) PassWordMatch{
    if (![_passwordsignup.text isEqualToString:_retypepasswordsignup.text]) {
        UIAlertView *mismatch =[[UIAlertView alloc] initWithTitle:@"OOPS!!" message:@"Passwords are different. Please make sure they are same" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [mismatch show];
    }
    else{
        [self registerNewUser];
    }
}

//register a new user
-(void) registerNewUser{
    PFUser *user =[PFUser user];
    user.username = _usernamesignup.text;
    user.password = _passwordsignup.text;
    user.email = _emailsignup.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (!error) {
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        else{
            //do sth to handle the error
        }
    
    
    }];
    
}

- (IBAction)SignUp:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _SignUpOverlayView.frame = self.view.frame;
    }];
}

- (IBAction)login:(id)sender {
    [PFUser logInWithUsernameInBackground:_usernamefield.text password:_passwordfield.text block:^(PFUser *user,NSError *error)
    {
        if (!error) {
            //add how to notify
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        else{
            //add how to notify
        }
    }];
}

- (IBAction)register:(id)sender {
    //when the button is pressed make the keyboard disappear first
    [_usernamesignup resignFirstResponder];
    [_emailsignup resignFirstResponder];
    [_passwordsignup resignFirstResponder];
    [_retypepasswordsignup resignFirstResponder];
    [self checkfieldvalid];

}

@end
