//
//  ProfileViewController.m
//  RideKeeper
//
//  Created by Dennis Grijalva on 2/24/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize NameTextField = _NameTextField;
@synthesize EmailTextField = _EmailTextField;
@synthesize PhoneTextField = _PhoneTextField;

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
    
    //load values current stored in parse
    //self.NameLabel.text = @"Currently saved Name";
    //self.EmailLabel.text = @"Currently saved email";
    //self.PhoneLabel.text = @"Currently saved #";
    
    self.NameTextField.text = @"value saved in parse";
    self.EmailTextField.text = @"value saved in parse";
    self.PhoneTextField.text = @"value saved in parse";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField){
        [textField resignFirstResponder];
    }
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField == self.EmailTextField){
        [UIView beginAnimations:Nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 25), self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
    else if(textField == self.PhoneTextField){
        [UIView beginAnimations:Nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 90), self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == self.EmailTextField){
        [UIView beginAnimations:Nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y + 25), self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
    else if(textField == self.PhoneTextField){
        [UIView beginAnimations:Nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y + 90), self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//save new values to parse and update view
- (IBAction)SaveProfile:(UIButton *)sender {
    
    //save these updated fields to parse
    /*
     self.NameTextField.text
     self.EmailTextField.text
     self.PhoneTextField.text*/
}
@end
