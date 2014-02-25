//
//  ProfileViewController.h
//  RideKeeper
//
//  Created by Dennis Grijalva on 2/24/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *EmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *PhoneTextField;

- (IBAction)SaveProfile:(UIButton *)sender;



@end
