//
//  garageMapViewController.h
//  Ridekeeper
//
//  Created by CLICC User on 3/3/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface garageMapViewController : UIViewController {
    MKMapView *mapview;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapview;

-(IBAction)SetMap:(id)sender;

-(IBAction)GetLocation:(id)sender;

@end
