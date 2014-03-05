//
//  StolenMapPin.h
//  Ridekeeper
//
//  Created by CLICC User on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface StolenMapPin : NSObject <MKAnnotation> {
    CLLocationCoordinate2D stolencoordinate;
    NSString *stolentitle;
    NSString *stolensubtitle;
}

@property (nonatomic,assign) CLLocationCoordinate2D stolencoordinate;
@property (nonatomic,copy) NSString *stolentitle;
@property (nonatomic,copy) NSString *stolensubtitle;

@end
