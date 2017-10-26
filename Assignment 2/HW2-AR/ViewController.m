//
//  ViewController.m
//  HW2-AR
//
//  Created by Ashish Ramachandran on 10/16/17.
//  Copyright © 2017 Ashish Ramachandran. All rights reserved.
//

#import "ViewController.h"
#import "Object_Info.h"
#import "StatsViewController.h"
#import "AddItemViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *productLabel;
@property (weak, nonatomic) IBOutlet UITextField *descLabel;
@property (weak, nonatomic) IBOutlet UITextField *costLabel;
@property (weak, nonatomic) IBOutlet UITextField *numOnHandLabel;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;
@property (weak, nonatomic) IBOutlet UIButton *decrementButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UISlider *recordSlider;


@end

//NSMutableArray *stock;
int currentIndex = 0;
int incrementCount = 0;

@implementation ViewController

- (IBAction)incrementNum:(id)sender {
    Object_Info *object = [stock objectAtIndex:currentIndex];
    [object setNumOnHand:[object getNumOnHand] + 1];
    [self showDisplayAtIndex:currentIndex];
    incrementCount++;
}
- (IBAction)decrementNum:(id)sender {
    Object_Info *object = [stock objectAtIndex:currentIndex];
    if([object getNumOnHand] != 0) {
        [object setNumOnHand:[object getNumOnHand] - 1];
        [self showDisplayAtIndex:currentIndex];
    }
}
- (IBAction)previousItem:(id)sender {
    if (currentIndex == 1) {
        [_previousButton setEnabled:false];
    }
    
    if (currentIndex == [stock count] - 1) {
        [_nextButton setEnabled:true];
    }
    currentIndex = (currentIndex - 1) % [stock count];
    [self showDisplayAtIndex:currentIndex];
    [_recordSlider setValue:currentIndex animated:YES];
    
}
- (IBAction)nextItem:(id)sender {
    if (currentIndex == [stock count] - 2) {
        [_nextButton setEnabled:false];
    }
    
    if (currentIndex == 0) {
        [_previousButton setEnabled:true];
    }
    currentIndex = (currentIndex + 1) % [stock count];
    [self showDisplayAtIndex:currentIndex];
    [_recordSlider setValue:currentIndex animated:YES];
    
}
- (IBAction)addRecord:(id)sender {
}
- (IBAction)showStats:(id)sender {
    //[self showStatsController:segue.identifier];
}
- (void) showStatsController: (UIStoryboardSegue *) segue {
    StatsViewController *controller = segue.destinationViewController;
    controller.numItemsLabelText = [NSString stringWithFormat:@"%d", (int) [stock count]];
    controller.numIncrementsLabelText = [NSString stringWithFormat:@"%d", incrementCount];
}

- (void) showAddRecordController: (UIStoryboardSegue *) segue {
    AddItemViewController *controller = segue.destinationViewController;
    controller->controller = self;
    
}
- (IBAction)sliderMoved:(id)sender {
    UISlider *mySlider = (UISlider *) sender;
    int recordToDisplay = (int) mySlider.value;
    [self showDisplayAtIndex:recordToDisplay];
    if(recordToDisplay == 0) {
        [_previousButton setEnabled:false];
    } else {
        [_previousButton setEnabled:true];
    }
    
    if(recordToDisplay == [stock count] - 1) {
        [_nextButton setEnabled:false];
    } else {
        [_nextButton setEnabled:true];
    }
    currentIndex = recordToDisplay;
}

- (void) showDisplayAtIndex:(int) index {
    if (stock.count > index && index >= 0) {
        
        if(index == 0) {
            [_previousButton setEnabled:false];
            [_nextButton setEnabled:true];
            [_recordSlider setValue:0 animated:YES];
            [_recordSlider setMaximumValue:[stock count] - 1];
            currentIndex = 0;
        }
        
        
        Object_Info *object = [stock objectAtIndex:index];
        _productLabel.text = [object getName];
        _descLabel.text = [object getDescription];
        _costLabel.text = [NSString stringWithFormat:@"%f", [object getPrice]];
        _numOnHandLabel.text = [NSString stringWithFormat:@"%d", [object getNumOnHand]];
        
        UIImageView *imageview = [[UIImageView alloc] init];
        UIImage *myimg = [UIImage imageNamed:[object getImagePath]];
        imageview.image = myimg;
        imageview.frame = CGRectMake(90, 75, 200, 150); // pass your frame here
        [self.view addSubview:imageview];
        
    } else {
        NSLog(@"Invalid index chosen!");
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showStatsScene"]) {
        [self showStatsController:segue];
    } else if([segue.identifier isEqualToString:@"showAddRecordScene"]) {
        [self showAddRecordController:segue];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_productLabel setEnabled:false];
    [_descLabel setEnabled:false];
    [_costLabel setEnabled:false];
    [_numOnHandLabel setEnabled:false];
    
    //initialize the store
    stock = [[NSMutableArray alloc] init];
    stock[0] = [[Object_Info alloc] init:@"iPhone 7" description:@"Apple's iPhone 6 minus plug" price: 769 numOnHand: 2 imagePath:@"iphone7.jpeg"];
    stock[1] = [[Object_Info alloc] init:@"Galaxy Note 7" description:@"Samsung's Exploding Phone" price: 850 numOnHand: 90 imagePath:@"note7.jpeg"];
    stock[2] = [[Object_Info alloc] init:@"40-inch TV" description:@"Sony's LED TV" price: 298 numOnHand: 89 imagePath:@"tv.jpeg"];
    stock[3] = [[Object_Info alloc] init:@"Kindle Reader" description:@"Amazon's E-Reader" price: 79.99 numOnHand: 200 imagePath:@"kindle.jpeg"];
    stock[4] = [[Object_Info alloc] init:@"Apple Watch" description:@"Series 2 - Aluminum Case" price: 299 numOnHand: 0 imagePath:@"applewatch.jpeg"];
    [_previousButton setEnabled:false];
    [_recordSlider setMaximumValue:[stock count] - 1];
    [_recordSlider setValue:0 animated:YES];
    
    [self showDisplayAtIndex:0];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
