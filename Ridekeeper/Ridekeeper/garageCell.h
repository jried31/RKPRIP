//
//  garageCell.h
//  Ridekeeper
//
//  Created by CLICC User on 2/27/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface garageCell : UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *MakeLabel;
@property (strong,nonatomic) IBOutlet UILabel *ModelLabel;
@property (strong,nonatomic) IBOutlet UILabel *YearLabel;
@property (strong,nonatomic) IBOutlet UIImageView *ThumbImage;

@end
