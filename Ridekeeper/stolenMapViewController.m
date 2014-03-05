//
//  stolenMapViewController.m
//  Ridekeeper
//
//  Created by CLICC User on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "stolenMapViewController.h"
#import "StolenMapPin.h"

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
    region.center.latitude = 34.0205;   //temp USC map view
    region.center.longitude = -118.2856;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [stolenmapview setRegion:region animated:YES];
    
    StolenMapPin *anno = [[StolenMapPin alloc] init];
    anno.stolentitle = @"Your Stolen Bike";
    anno.stolensubtitle = @"USC";
    anno.stolencoordinate = region.center;
    [stolenmapview addAnnotation:anno];
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

-(IBAction)Direction:(id)sender{
    NSString *urlString = @"http://maps.apple.com/maps?daddr=34.0205,-118.2856";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
