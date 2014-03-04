//
//  stolenMapViewController.m
//  Ridekeeper
//
//  Created by CLICC User on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "stolenMapViewController.h"

@interface stolenMapViewController ()

@end

@implementation stolenMapViewController

@synthesize stolenmapview;

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
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 34.0722;   //temp UCLA map view
    region.center.longitude = -118.4441;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [stolenmapview setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SetMap:(id)sender {
    
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            stolenmapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            stolenmapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            stolenmapview.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

-(IBAction)GetLocation:(id)sender{
    stolenmapview.showsUserLocation = YES;
}

@end
