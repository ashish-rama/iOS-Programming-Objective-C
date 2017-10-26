//
//  Object_Info.h
//  HW1-AR
//
//  Created by Ashish Ramachandran on 10/1/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject {
    NSString *_description;
    double _retailCost, _wholesaleCost;
    int _numOnHand, _numSold;
}

- (id) init: (NSString *) description retailCost: (double) retailCost wholeSaleCost: (double) wholeSaleCost;

//Getters

- (NSString *) getDescription;
- (double) getRetailCost;
- (double) getWholesaleCost;
- (int) getNumOnHand;
- (int) getNumSold;

//Setters

- (void) setDescription: (NSString *) newDescription;
- (void) setRetailCost: (double) retailCost;
- (void) setWholesaleCost: (double) wholesaleCost;
- (void) setNumOnHand: (int) numOnHand;
- (void) setNumOnHandZero;
- (void) setNumSold: (int) numSold;

- (NSString *) Print_Object;



@end
