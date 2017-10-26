//
//  StatsViewController.m
//  HW2-AR
//
//  Created by Ashish Ramachandran on 10/22/17.
//  Copyright © 2017 Ashish Ramachandran. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numItemsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numIncrementsLabel;

@end

@implementation StatsViewController

- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _numItemsLabel.text = self.numItemsLabelText;
    _numIncrementsLabel.text = self.numIncrementsLabelText;
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
