//
//  Truck.h
//  Vehicles
//
//  Created by Jenny Chang on 12/01/2019.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

NS_ASSUME_NONNULL_BEGIN

@interface Truck : Vehicle

// property specific to trucks to hold the truck's capacity data
@property (nonatomic, assign) NSInteger cargoCapacityCubicFeet;

-(NSString *)soundBackupAlarm;

@end

NS_ASSUME_NONNULL_END
