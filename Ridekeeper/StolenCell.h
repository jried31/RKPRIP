//
//  StolenCell.h
//  Ridekeeper
//
//  Created by CLICC User on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StolenCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *StolenMakeLabel;
@property (strong, nonatomic) IBOutlet UILabel *StolenModelLabel;
@property (strong, nonatomic) IBOutlet UILabel *StolenYearLabel;
@property (strong, nonatomic) IBOutlet UIImageView *StolenThumbImage;

@end
