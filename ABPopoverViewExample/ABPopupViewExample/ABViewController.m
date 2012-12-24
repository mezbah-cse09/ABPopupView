//
//  ABViewController.m
//  ABPopupViewExample
//
//  Created by Aron Bury on 24/12/12.
//  Copyright (c) 2012 Aron Bury. All rights reserved.
//

#import "ABViewController.h"
#import "ABPopupView.h"

@interface ABViewController ()

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayToolTip:(id)sender
{
    if (![sender isKindOfClass:[UIButton class]] || !sender)
        return;
    
    UIButton *senderButton = (UIButton *)sender;
    
    //Get the top left hand corner of the button
    CGPoint displayPoint = CGPointMake(senderButton.frame.origin.x + senderButton.frame.size.width,
                                       senderButton.frame.origin.y);
    
    if (sender == self.buttonOne)
        [ABPopupView displayPopupWithTitle:@"Hey there!" atPoint:displayPoint];
    else if (senderButton == self.buttonTwo)
        [ABPopupView displayPopupWithTitle:@"Look at me!" atPoint:displayPoint];
    else if (senderButton == self.buttonThree)
        [ABPopupView displayPopupWithTitle:@"Isnt this fun? :D" atPoint:displayPoint];
    
}

@end
