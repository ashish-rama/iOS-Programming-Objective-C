//
//  Object_Info.m
//  HW2-AR
//
//  Created by Ashish Ramachandran on 10/22/17.
//  Copyright © 2017 Ashish Ramachandran. All rights reserved.
//

#import "Object_Info.h"

@implementation Object_Info
- (id) init: (NSString *) name description: (NSString *) description price: (double) price numOnHand: (int) numOnHand imagePath: (NSString *) imagePath {
    if(self = [super init]) {
        _name = name;
        _description = description;
        _imagePath = imagePath;
        _price = price;
        _numOnHand = numOnHand;
    }
    return self;
}

//Getters

- (NSString *) getName {
    return _name;
}
- (NSString *) getDescription {
    return _description;
}
- (NSString *) getImagePath {
    return _imagePath;
}
- (double) getPrice {
    return _price;
}
- (int) getNumOnHand {
    return _numOnHand;
}


//Setters

- (void) setName: (NSString *) newName {
    _name = newName;
}
- (void) setDescription: (NSString *) newDescription {
    _description = newDescription;
}
- (void) setImagePath:(NSString *)newImagePath {
    _imagePath = newImagePath;
}
- (void) setPrice:(double)newPrice {
    _price = newPrice;
}
- (void) setNumOnHand: (int) numOnHand {
    _numOnHand = numOnHand;
}

- (NSString *) Print_Object {
    
    NSString *output = [NSString stringWithFormat:@"Name: %@, Description: %@, Price: %f, Num on Hand: %d, image path: %@", _name, _description, _price, _numOnHand, _imagePath];
    
    //NSLog(@"%@", output);
    
    return output;
    
}

@end
