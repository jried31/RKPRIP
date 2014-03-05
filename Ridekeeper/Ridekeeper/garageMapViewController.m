//
//  garageMapViewController.m
//  Ridekeeper
//
//  Created by CLICC User on 3/3/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "garageMapViewController.h"
#import "VehicleMapPin.h"

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
    
    VehicleMapPin *ann = [[VehicleMapPin alloc] init];
    ann.title = @"Your Bike";
    ann.subtitle = @"UCLA";
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];
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

-(IBAction)Direction:(id)sender{
    NSString *urlString = @"http://maps.apple.com/maps?daddr=34.0722,-118.4441";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
