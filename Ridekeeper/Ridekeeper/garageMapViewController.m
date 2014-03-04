//
//  garageMapViewController.m
//  Ridekeeper
//
//  Created by CLICC User on 3/3/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "garageMapViewController.h"

@interface garageMapViewController ()

@end

@implementation garageMapViewController

@synthesize mapview;

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
    [mapview setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SetMap:(id)sender {
    
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

-(IBAction)GetLocation:(id)sender{
    mapview.showsUserLocation = YES;
}

@end