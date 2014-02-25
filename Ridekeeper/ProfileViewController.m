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
@synthesize NameLabel = _NameLabel;
@synthesize EmailLabel = _EmailLabel;
@synthesize PhoneLabel = _PhoneLabel;

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
    
    //update view
    if(![self.NameTextField.text  isEqual: @""]){
    
        self.NameLabel.text = self.NameTextField.text;
    }
    
    if(![self.EmailTextField.text  isEqual: @""]){
        
        self.EmailLabel.text = self.EmailTextField.text;
    }
    
    if(![self.PhoneTextField.text  isEqual: @""]){
    
        self.PhoneLabel.text = self.PhoneTextField.text;
    }
    
    //clear fields on the view
    self.NameTextField.text = @"";
    self.EmailTextField.text = @"";
    self.PhoneTextField.text = @"";
}
@end
