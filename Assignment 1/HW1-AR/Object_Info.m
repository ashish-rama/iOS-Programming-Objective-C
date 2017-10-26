//
//  Object_Info.m
//  HW1-AR
//
//  Created by Ashish Ramachandran on 10/1/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "Object_Info.h"

@implementation Object_Info

- (id) init: (NSString *) description retailCost: (double) retailCost wholeSaleCost: (double) wholeSaleCost {
    if(self = [super init]) {
        _description = description;
        _retailCost = retailCost;
        _wholesaleCost = wholeSaleCost;
        _numOnHand = 0;
        _numSold = 0;
    }
    return self;
}

//Getters

- (NSString *) getDescription {
    return _description;
}
- (double) getRetailCost {
    return _retailCost;
}
- (double) getWholesaleCost {
    return _wholesaleCost;
}
- (int) getNumOnHand {
    return _numOnHand;
}
- (int) getNumSold {
    return _numSold;
}


//Setters

- (void) setDescription: (NSString *) newDescription {
    _description = newDescription;
}
- (void) setRetailCost: (double) newRetailCost {
    _retailCost = newRetailCost;
}
- (void) setWholesaleCost: (double) newWholesaleCost {
    _wholesaleCost = newWholesaleCost;
}
- (void) setNumOnHandZero {
    _numOnHand = 0;
}

- (void) setNumOnHand: (int) numOnHand {
    _numOnHand = numOnHand;
    
    //the instructions online say to "explicitly set the Num_on_Hand to 0" but doesn't this make more sense?
    
}
- (void) setNumSold: (int) newNumSold {
    _numSold = newNumSold;
}

- (NSString *) Print_Object {
    
    NSString *output = [NSString stringWithFormat:@"Description: %@, Retail Cost: %f, Wholesale Cost: %f, Num on Hand: %d, Num Sold: %d", _description, _retailCost, _wholesaleCost, _numOnHand, _numSold];
    
    //NSLog(@"%@", output);
    
    return output;
    
}


@end
