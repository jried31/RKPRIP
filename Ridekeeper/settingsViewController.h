//
//  settingsViewController.h
//  Ridekeeper
//
//  Created by Eduardo Urrego - 7145100075 on 2/25/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//


#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>

#import "AppDelegate.h"
//What else needs to be imported??


@interface settingsViewController : UIViewController
{
    CFURLRef		soundFileURLReference;
	SystemSoundID	soundFileObject;
}

// Objects used for the use of a sound file (type aif)
//@property (readwrite)	CFURLRef		soundFileURLReference;
@property (readwrite)   CFURLRef soundRevFileURLReference;
//@property (readonly)	SystemSoundID	soundFileObject;
@property (readonly)	SystemSoundID	soundRevFileObject;

@end
