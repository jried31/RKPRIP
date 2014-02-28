//
//  garageViewController.h
//  Ridekeeper
//
//  Created by CLICC User on 2/27/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface garageViewController : UITableViewController

@property (nonatomic,strong) NSArray *Make;
@property (nonatomic,strong) NSArray *Model;
@property (nonatomic,strong) NSArray *Year;
@property (nonatomic,strong) NSArray *Images;

@end
