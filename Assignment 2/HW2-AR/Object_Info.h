//
//  Object_Info.h
//  HW2-AR
//
//  Created by Ashish Ramachandran on 10/22/17.
//  Copyright © 2017 Ashish Ramachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject {
    NSString *_name, *_description, *_imagePath;
    double _price;
    int _numOnHand;
}

- (id) init: (NSString *) name description: (NSString *) description price: (double) price numOnHand: (int) numOnHand imagePath: (NSString *) imagePath;

//Getters

- (NSString *) getName;
- (NSString *) getDescription;
- (NSString *) getImagePath;
- (double) getPrice;
- (int) getNumOnHand;

//Setters

- (void) setName: (NSString *) newName;
- (void) setDescription: (NSString *) newDescription;
- (void) setImagePath: (NSString *) newImagePath;
- (void) setPrice: (double) newPrice;
- (void) setNumOnHand: (int) numOnHand;

- (NSString *) Print_Object;



@end

