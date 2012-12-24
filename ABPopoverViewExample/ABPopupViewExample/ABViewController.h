//
//  ABViewController.h
//  ABPopupViewExample
//
//  Created by Aron Bury on 24/12/12.
//  Copyright (c) 2012 Aron Bury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABViewController : UIViewController

- (IBAction)displayToolTip:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;

@end
