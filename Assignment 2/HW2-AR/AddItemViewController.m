//
//  AddItemViewController.m
//  HW2-AR
//
//  Created by Ashish Ramachandran on 10/22/17.
//  Copyright © 2017 Ashish Ramachandran. All rights reserved.
//

#import "AddItemViewController.h"
#import "Object_Info.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *productField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *costField;
@property (weak, nonatomic) IBOutlet UITextField *numOnHandField;

@end

@implementation AddItemViewController

- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)addRecordButton:(id)sender {
    if(![_productField.text  isEqual: @""] &&
       ![_descriptionField.text  isEqual: @""] &&
       ![_costField.text  isEqual: @""] &&
       ![_numOnHandField.text  isEqual: @""]) {
        
        //add object to array
        
        NSMutableArray *addStock = controller->stock;
        
        [addStock addObject:[[Object_Info alloc] init:_productField.text description:_descriptionField.text price: _costField.text.intValue numOnHand: _numOnHandField.text.intValue imagePath:@"notfound.jpeg"]];
        
        [self dismissViewControllerAnimated:true completion:nil];
        [controller showDisplayAtIndex:0];
    } else {
        NSLog(@"Not all fields are filled out");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
