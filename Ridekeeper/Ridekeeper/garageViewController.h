//
//  garageViewController.h
//  Ridekeeper
//
//  Created by CLICC User on 2/27/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface garageViewController : UITableViewController{
    /*NSArray *Make;
    NSArray *Model;
    NSArray *Year;
    NSArray *Images;*/
    NSArray *obj;
    
}

@property (nonatomic,strong) NSString *Make;
@property (nonatomic,strong) NSString *Model;
@property  int *Year;
@property (nonatomic,strong) NSMutableArray *Images;
@property (strong, nonatomic) IBOutlet UITableView *vehicletable;

@end
