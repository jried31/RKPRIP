//
//  settingsViewController.m
//  Ridekeeper
//
//  Created by Eduardo Urrego - 7145100075 on 2/25/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "settingsViewController.h"


/*  COMMENTS FOR GROUP / DECISIONS THAT NEED TO BE MADE
 
 AUDIO SESSIONS:
 
        WE MUST USE "AUDIO SESSION API"
        DURING PHONE CALL WE STILL WANT TO KNOW A VEHICLE IS BEING STOLEN.  MAYBE ONLY OUR OWN???
 The system can also deactivate your audio session—which it does, for example, when a phone call arrives or an alarm sounds. Such a deactivation is called an interruption. The audio session APIs provide ways to respond to and recover from interruptions.
 
        WE MUST CHOOSE AN AUDIO SESSION CATEGORY.
 
 
        WE NEED TO MAKE DECISIONS ON SOME OF THESE SETTINGS.
 Do you intend to mix your application’s sounds with those from other applications (such as the iPod), or do you intend to silence other audio?
 How do you want your application to respond to an audio interruption, such as a Clock alarm?
 How should your application respond when a user plugs in or unplugs a headset?
 
        ARE WE GOING TO TAKE INTO ACCOUNT HARDWARE CHARACTERISTICS OF DEVICE?
 query the audio session to discover hardware characteristics of the device your application is on—characteristics such as channel count, sample rate, and availability of audio input.
 
        WE SHOULD ASK USER WHAT BEHAVIOR HE WANTS WHEN PHONE IS ON RING, OR ON VIBRATE
 
        BEST (LONGEST) SOLUTION IS TO ADD THE InAppSettingsKit: InAppSettingsKit is an open source solution to to easily add in-app settings to your iPhone apps. It uses a hybrid approach by maintaining the Settings.app pane.
 
*/

@interface settingsViewController ()

// Set of outlets that allow referencing of the three labels that
// display the current sound setting for each of the three possible cases
@property (weak, nonatomic) IBOutlet UILabel *myVehicleBeingStolenSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *myVehicleBeingMovedSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *stolenVehicleIsNearbySettingLabel;


// Set of outlets that allow referencing of three buttons used to change
// "ONE OF YOUR VEHICLES IS BEING STOLEN" sounds by name
@property (weak, nonatomic) IBOutlet UIButton *myVehicleBeingStolenSoundOnlyButton;
@property (weak, nonatomic) IBOutlet UIButton *myVehicleBeingStolenSoundAndVibrationButton;
@property (weak, nonatomic) IBOutlet UIButton *myVehicleBeingStolenVibrationOnlyButton;

// Set of outlets that allow referencing of three buttons used to change
// "ONE OF YOUR VEHICLES IS BEING LIFTED / TILTED" sounds by name
@property (weak, nonatomic) IBOutlet UIButton *myVehicleBeingMovedSoundOnlyButton;
@property (weak, nonatomic) IBOutlet UIButton *myVehicleBeingMovedSoundAndVibrationButton;
@property (weak, nonatomic) IBOutlet UIButton *myVehicleBeingMovedVibrationOnlyButton;

// Set of outlets that allow referencing of three buttons used to change
// "THERE ARE NEARBY STOLEN VEHICLES" sounds by name
@property (weak, nonatomic) IBOutlet UIButton *otherVehicleBeingStolenSoundOnlyButton;
@property (weak, nonatomic) IBOutlet UIButton *otherVehicleBeingStolenSoundAndVibrationButton;
@property (weak, nonatomic) IBOutlet UIButton *otherVehicleBeingStolenVibrationOnlyButton;


@end



@implementation settingsViewController

// URL and File objects used for the sound files to be played by the App
//@synthesize soundFileURLReference;
@synthesize soundRevFileURLReference;
//@synthesize soundFileObject;
@synthesize soundRevFileObject;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Create the URL for the source audio file with the URLForResource:withExtension: method
    NSURL *revEngineAndSquealSound = [[NSBundle mainBundle] URLForResource:@"rev_engine_and_squeal" withExtension:@"aif"];
    
    // Create the URL Reference for the sound object.
    self.soundRevFileURLReference = (__bridge CFURLRef) (revEngineAndSquealSound);
    
    // Create a system sound object representing the sound file.
    AudioServicesCreateSystemSoundID(soundRevFileURLReference , &soundRevFileObject);

}



// Functions that declares an action that plays a sound for a button.
// Implementation occurs in a different "action function".
- (IBAction)playSound:(id)sender{}
- (IBAction)playSoundAndVibrate:(id)sender {}
- (IBAction)vibrate:(id)sender {}



// Function that both declares, and implements what happens when one of the
// three "ONE OF YOUR VEHICLES IS BEING STOLEN" buttons is activated
// (Uses the "Touch Up Inside " Trigger)
- (IBAction)changeSettingsToMyVehicleBeingStolen:(UIButton *)sender
{
    //Save setting to device.

    if (sender == self.myVehicleBeingStolenSoundOnlyButton )
    {
        // Changes the "text" property of the appropriate label.
        self.myVehicleBeingStolenSettingLabel.text = @"ONE OF YOUR VEHICLES IS BEING STOLEN:  Only play a sound";
        
        // IOS method called to play appropriate sound file (ONLY SOUND).
        AudioServicesPlaySystemSound (soundRevFileObject);
    }
    
    else if (sender == self.myVehicleBeingStolenSoundAndVibrationButton)
    {
        // Changes the "text" property of the appropriate label.
        self.myVehicleBeingStolenSettingLabel.text = @"ONE OF YOUR VEHICLES IS BEING STOLEN:  Play sound and vibrate";
        
        // IOS method called to play appropriate sound file (SOUND AND VIBRATION).
        AudioServicesPlayAlertSound (soundRevFileObject);
    }

    else if (sender == self.myVehicleBeingStolenVibrationOnlyButton)
    {
        // Changes the "text" property of the appropriate label.
        self.myVehicleBeingStolenSettingLabel.text = @"ONE OF YOUR VEHICLES IS BEING STOLEN:  Only Vibrate";
        
        // IOS method called to play appropriate sound file (ONLY VIBRATION).
        AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
    }
}


// Function that both declares, and implements what happens when one of the
// three "ONE OF YOUR VEHICLES IS BEING LIFTED / TILTED" buttons is activated
// (Uses the "Touch Up Inside " Trigger)
- (IBAction)changeSettingsToMyVehicleBeingMoved:(UIButton *)sender
{
    //Save setting to device.
    
    if (sender == self.myVehicleBeingMovedSoundOnlyButton )
    {
        // Changes the "text" property of the appropriate label.
        self.myVehicleBeingMovedSettingLabel.text = @"ONE OF YOUR VEHICLES IS BEING LIFTED / TILTED:  Only play a sound";
        
        // IOS method called to play appropriate sound file (ONLY SOUND).
        AudioServicesPlaySystemSound (soundRevFileObject);
    }
    
    else if (sender == self.myVehicleBeingMovedSoundAndVibrationButton)
    {
        // Changes the "text" property of the appropriate label.
        self.myVehicleBeingMovedSettingLabel.text = @"ONE OF YOUR VEHICLES IS BEING LIFTED / TILTED:  Play sound and vibrate";
        
        // IOS method called to play appropriate sound file (SOUND AND VIBRATION).
        AudioServicesPlayAlertSound (soundRevFileObject);
    }
    
    else if (sender == self.myVehicleBeingMovedVibrationOnlyButton)
    {
        // Changes the "text" property of the appropriate label.
        self.myVehicleBeingMovedSettingLabel.text = @"ONE OF YOUR VEHICLES IS BEING LIFTED / TILTED:  Only Vibrate";
        
        // IOS method called to play appropriate sound file (ONLY VIBRATION).
        AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
    }
}


// Function that both declares, and implements what happens when one of the
// three "THERE ARE NEARBY STOLEN VEHICLES" buttons is activated
// (Uses the "Touch Up Inside " Trigger)
- (IBAction)changeSettingsToOtherVehicleBeingStolen:(UIButton *)sender
{
    //Save setting to device.
    
    if (sender == self.otherVehicleBeingStolenSoundOnlyButton )
    {
        // Changes the "text" property of the appropriate label.
        self.stolenVehicleIsNearbySettingLabel.text = @"THERE ARE NEARBY STOLEN VEHICLES:  Only play a sound";
        
        // IOS method called to play appropriate sound file (SOUND ONLY).
        AudioServicesPlaySystemSound (soundRevFileObject);
    }
    else if (sender == self.otherVehicleBeingStolenSoundAndVibrationButton)
    {
        // Changes the "text" property of the appropriate label.
        self.stolenVehicleIsNearbySettingLabel.text = @"THERE ARE NEARBY STOLEN VEHICLES:  Play sound and vibrate";
        
        // IOS method called to play appropriate sound file (SOUND AND VIBRATION).
        AudioServicesPlayAlertSound (soundRevFileObject);
    }
    
    else if (sender == self.otherVehicleBeingStolenVibrationOnlyButton)
    {
        // Changes the "text" property of the appropriate label.
        self.stolenVehicleIsNearbySettingLabel.text = @"THERE ARE NEARBY STOLEN VEHICLES:  Only Vibrate";
        
        // IOS method called to play appropriate sound file (VIBRATION ONLY).
        AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
    }
}


/////////////METHODS NOT USED /////////////////////
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 */

@end
