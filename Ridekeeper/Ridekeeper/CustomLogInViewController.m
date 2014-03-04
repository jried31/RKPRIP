//
//  CustomLogInViewController.m
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 2/20/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "CustomLogInViewController.h"
#import <Quickblox/Quickblox.h>
#define typicalLoginContext @"typicalLoginContext"

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
        UIAlertView *alertview =[[UIAlertView alloc] initWithTitle:@"Logged in" message:@"" delegate:self cancelButtonTitle:@"continue" otherButtonTitles:@"Logout", nil];
        [alertview show];
    }
    /*else{
        UIAlertView *empty =[[UIAlertView alloc] initWithTitle:@"Error!!" message:@"username or password field empty" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                             [empty show];
    }*/
}

//controls what the alertview buttons should do
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView cancelButtonIndex]) {
        //checks if the title of the button is continue then switch the view
        if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"continue"]) {
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        
    }
    else if (buttonIndex == [alertView firstOtherButtonIndex] && [[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Logout"]){
        [PFUser logOut];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






//starts the login process
- (IBAction)login:(id)sender {
    //check if the given info is valid
    [self checkfieldempty];
    
}

// QuickBlox queries delegate
- (void)completedWithResult:(Result *)result{
    
    // Create session result
    if(result.success && [result isKindOfClass:QBAAuthSessionCreationResult.class]){
        // You have successfully created the session
        QBAAuthSessionCreationResult *res = (QBAAuthSessionCreationResult *)result;
        
        // Sign In to QuickBlox Chat
        QBUUser *currentUser = [QBUUser user];
        currentUser.ID = res.session.userID; // your current user's ID
        currentUser.password = @"testtest"; // your current user's password
        
        // set Chat delegate
        [QBChat instance].delegate = self;
        
        // login to Chat
        [[QBChat instance] loginWithUser:currentUser];
        
    }
}

//chek if any of the field are left empty
-(void) checkfieldempty{
    //check if any of the fields are empty
    if ([_usernamefield.text isEqualToString:@""] || [_passwordfield.text isEqualToString:@""])
    {
        //create alert to show fields are emoty
        UIAlertView *empty = [[UIAlertView alloc]
                              initWithTitle:@"Empty fields" message:@"Please provide your username and password"
                              delegate:self
                              cancelButtonTitle:@"ok"
                              otherButtonTitles:nil, nil];
        [empty show];
    }
    else{
        // if not emoty try to log the user
        [PFUser logInWithUsernameInBackground:_usernamefield.text password:_passwordfield.text block:^(PFUser *user,NSError *error)
         {
             if (!error) {
                 // Create session with user
                 QBASessionCreationRequest *extendedAuthRequest = [QBASessionCreationRequest request];
                 extendedAuthRequest.userLogin = @"test";
                 extendedAuthRequest.userPassword = @"testtest";
                 
                 
                 
                 /*[QBAuth createSessionWithDelegate:self];
                 [QBUsers logInWithUserLogin:@"test"
                                    password:@"testtest"
                                    delegate:self context:typicalLoginContext];*/
                 //if no error show succes message and then show the nxt view
                 
                 UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Login success" message:@"" delegate:self cancelButtonTitle:@"continue" otherButtonTitles: nil];
                 [success show];
                 //continue button calls the seque so no need to call it again
                 //[self performSegueWithIdentifier:@"login" sender:self];
             }
             else{
                 //if there is show the error and stay in the same window and show error alert
                 UIAlertView *logerror = [[UIAlertView alloc] initWithTitle:@"error" message:@"wrong user name or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                 [logerror show];
             }
         }];
    }
}




@end
