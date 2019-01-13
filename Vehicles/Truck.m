//
//  Truck.m
//  Vehicles
//
//  Created by Jenny Chang on 12/01/2019.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

#import "Truck.h"

@implementation Truck

// since there are so many different types of trucks, you don't need to create an init method that provides any of those details automatically. You can simply override the superclass methods which would be the same no matter the size of the truck

#pragma mark - Superclass overrides
- (NSString *)goForward
{
    return [NSString stringWithFormat:@"%@ Depress gas pedal.", [self changeGears:@"Drive"]];
}

- (NSString *)stopMoving
{
    return [NSString stringWithFormat:@"Depress brake pedal. %@", [self changeGears:@"Park"]];
}

// specific to trucks - sound alarm if truck is planning on reversing

- (NSString *)goBackward
{
    NSMutableString *backwardString = [NSMutableString string];
    if (self.cargoCapacityCubicFeet > 100) {
        //Sound a backup alarm first
        [backwardString appendFormat:@"Wait for \"%@\", then %@", [self soundBackupAlarm], [self changeGears:@"Reverse"]];
    } else {
        [backwardString appendFormat:@"%@ Depress gas pedal.", [self changeGears:@"Reverse"]];
    }
    
    return backwardString;
}

// smaller trucks may have a horn similar to the level of a horn whereas larger trucks will have larger noises, therefore you can handle this using if/else statements

- (NSString *)makeNoise
{
    if (self.numberOfWheels <= 4) {
        return @"Beep beep!";
    } else if (self.numberOfWheels > 4 && self.numberOfWheels <= 8) {
        return @"Honk!";
    } else {
        return @"HOOOOOOOOONK!";
    }
}

-(NSString *)vehicleDetailsString
{
    //Get basic details from superclass
    NSString *basicDetails = [super vehicleDetailsString];
    
    //Initialize mutable string
    NSMutableString *truckDetailsBuilder = [NSMutableString string];
    [truckDetailsBuilder appendString:@"\n\nTruck-Specific Details:\n\n"];
    
    //Add info about truck-specific features.
    [truckDetailsBuilder appendFormat:@"Cargo Capacity: %d cubic feet", self.cargoCapacityCubicFeet];
    
    //Create the final string by combining basic and truck-specific details.
    NSString *truckDetails = [basicDetails stringByAppendingString:truckDetailsBuilder];
    
    return truckDetails;
}



#pragma mark - Private methods

// a big truck needs to sound a backup alarm so you can create a private method which won't be available to other classes

-(NSString *)soundBackupAlarm
{
    return @"Beep! Beep! Beep! Beep!";
}



@end

