//
//  main.m
//  HW1-AR
//
//  Created by Ashish Ramachandran on 10/1/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object_Info.h"

//master table to keep track of stock
NSMutableDictionary *stock;

//adds item to stock
Boolean Add_Item(NSString* name, NSString* description, double retailCost, double wholesaleCost) {
    
    if(stock == nil) {
        stock = [[NSMutableDictionary alloc] init];
    }
    
    Object_Info *newObject = [[Object_Info alloc] init:description retailCost:retailCost wholeSaleCost:wholesaleCost];
    
    
    if([[stock allKeys] containsObject: name]) {
        NSLog(@"Key already exists. Failed to add new object: %@", name);
        return false;
    } else {
        stock[name] = newObject;
    }
    
    return true;
}

//adds units to a specified item
Boolean Add_Stock(NSString * name, int units) {
    
    if(stock == nil) {
        NSLog(@"Please add items to the dictionary first!");
        return false;
    }
    
    if (![[stock allKeys] containsObject:name]) {
        NSLog(@"Item not found: %@", name);
        return false;
    } else {
        [[stock objectForKey:name] setNumOnHand: [[stock objectForKey:name] getNumOnHand] + units];
    }
    return true;
}

//removes units for a specified item
Boolean Sell_Item(NSString * name, int units) {
    
    if(stock == nil) {
        NSLog(@"Please add items to the dictionary first!");
        return false;
    }
    
    if (![[stock allKeys] containsObject:name]) {
        NSLog(@"Item not found: %@", name);
        return false;
    }
    id value = [stock objectForKey:name];
    
    if([value getNumOnHand] < units) {
        NSLog(@"Not possible to sell this many units - not enough number on hand");
        return false;
    } else {
        [[stock objectForKey:name] setNumOnHand: [[stock objectForKey:name] getNumOnHand] - units];
        [[stock objectForKey:name] setNumSold: [[stock objectForKey:name] getNumSold] + units];
        NSLog(@"Selling %d units of %@. %@", units, name, [value Print_Object]);
    }
    return true;
}

//removes specified item from the table
Boolean Remove_Item(NSString * name) {
    
    if(stock == nil) {
        NSLog(@"Please add items to the dictionary first!");
        return false;
    }
    
    if (![[stock allKeys] containsObject:name]) {
        NSLog(@"Item not found: %@", name);
        return false;
    }
    
    [stock removeObjectForKey:name];
    NSLog(@"Removed item: %@", name);
    
    return true;
}

//Calculates the profit of the entire store
void Profit_of_Store() {
    
    if(stock == nil) {
        NSLog(@"Please add items to the dictionary first!");
        return;
    }
    
    int total = 0;
    for(id key in stock) {
        id value = [stock objectForKey:key];
        total += ([value getRetailCost] - [value getWholesaleCost]) * [value getNumSold];
    }
    
    NSLog(@"Total store profits are: %d", total);
    
}

void Print_Dictionary() {
    if(stock != nil) {
        for(id key in stock) {
            id value = [stock objectForKey:key];
            NSLog(@"Name: %@, %@", key, [value Print_Object]);
        }
    }
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        //Add our items
        Add_Item(@"iPhone 7", @"Apple's iPhone 7 minus plug", 769, 450);
        Add_Item(@"Galaxy Note 7", @"Samsung's Exploding Phone", 850, 550);
        Add_Item(@"40-inch TV", @"Sony's LED TV", 298, 250);
        Add_Item(@"Kindle Reader", @"Amazon's E-Reader", 79.99, 75);
        Add_Item(@"Apple Watch", @"Series 2 - Aluminum Case", 299, 200);
        
        //Just to test that it doesn't add a duplicate
        Add_Item(@"Kindle Reader", @"THIS SHOULD NOT SHOW UP", 1651, 213216);
        
        //Add the stocks
        Add_Stock(@"iPhone 7", 2002);
        Add_Stock(@"40-inch TV", 119);
        Add_Stock(@"Kindle Reader", 205);
        Add_Stock(@"Apple Watch", 200);
        
        //Sell some stock
        Sell_Item(@"iPhone 7", 2000);
        Sell_Item(@"40-inch TV", 30);
        Sell_Item(@"Kindle Reader", 5);
        Sell_Item(@"Apple Watch", 200);
        
        
        //Print the table
        NSLog(@"Printing table:");
        Print_Dictionary();
        
        //Delete items
        Remove_Item(@"iPhone 7");
        Remove_Item(@"Apple Watch");
        
        //Print the table after removing items
        NSLog(@"Printing table after removing items:");
        Print_Dictionary();
        
        //Selling more stock
        Sell_Item(@"40-inch TV", 50);
        Sell_Item(@"Kindle Reader", 134);
        
        
        //Print the table after removing items
        NSLog(@"Printing table after selling more items:");
        Print_Dictionary();
        
        //Calculate profit of store
        Profit_of_Store();
        
        
    }
    return 0;
    
}

