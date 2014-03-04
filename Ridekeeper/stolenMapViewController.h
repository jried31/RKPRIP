//
//  stolenMapViewController.h
//  Ridekeeper
//
//  Created by CLICC User on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface stolenMapViewController : UIViewController {
    MKMapView *stolenmapview;
}

@property (nonatomic,retain) IBOutlet MKMapView *stolenmapview;

-(IBAction)SetMap:(id)sender;

-(IBAction)GetLocation:(id)sender;

@end
