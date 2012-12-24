//
//  ABPopupView.m
//
//  Version 2.0
//
//  Created by Aron Bury on 24/12/2012.
//  Copyright 2011 Aron Bury. All rights reserved.
//
//  Get the latest version of ABPopupView from this location:
//  https://github.com/abury/ABPadLockScreen
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "ABPopupView.h"

#define kAnimationTime 0.18

@interface ABPopupView ()

/**
 The label that displays the name of the manipulator
 */
@property (nonatomic, strong) UILabel *manipulatorTitleLabel;

/**
 A semi transparent view that acts as the background for the manipulator title
 */
@property (nonatomic, strong) UIView *titleBackground;

/**
 The point that the popup should display begin from
 */
@property (nonatomic, assign) CGPoint originPoint;

/**
 Sets up the popup to be display 
 */
- (void)setUpPopup;

@end

@implementation U_ManipulatorTitlePopupView

#pragma mark -
#pragma mark - Public Static Methods

+ (void)displayPopupWithTitle:(NSString *)title atPoint:(CGPoint)origin
{
    U_ManipulatorTitlePopupView *popover = [[U_ManipulatorTitlePopupView alloc] initWithTitle:title point:origin];
    
    [popover setUpPopup];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:popover];
    
    [UIView animateWithDuration:kAnimationTime
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{

                         popover.titleBackground.alpha = 1.0f;
                         popover.titleBackground.transform = CGAffineTransformMakeScale(1.2, 1.2);
                         popover.manipulatorTitleLabel.alpha = 1.0f;
                         popover.manipulatorTitleLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
                         
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:kAnimationTime
                                          animations:^{
                                                popover.titleBackground.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                                popover.manipulatorTitleLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                          }];
                     }];
    
}

#pragma mark -
#pragma mark - Init Methods

- (id)initWithTitle:(NSString *)title point:(CGPoint)point;
{
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _originPoint = point;
        
        _manipulatorTitleLabel = [U_GUIFactory generateLabelForViewWithFont:[UIFont boldSystemFontOfSize:18.0f]];
        _manipulatorTitleLabel.text = title;
        
        _titleBackground = [U_GUIFactory generateSemiTransparentView];
        _titleBackground.alpha = 0.8;
        _titleBackground.layer.cornerRadius = 13;
        
        [self addSubview:self.titleBackground];
        [self addSubview:self.manipulatorTitleLabel];
        
    }
    return self;
}

#pragma mark -
#pragma mark - Touch Event Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:kAnimationTime
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.titleBackground.alpha = 0.0f;
                         self.titleBackground.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         self.manipulatorTitleLabel.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         self.manipulatorTitleLabel.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

#pragma mark -
#pragma mark - Private Methods
- (void)setUpPopup
{
    CGSize titleBackSize = [self.manipulatorTitleLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:18.0f]];
    titleBackSize.width = titleBackSize.width + 10;
    titleBackSize.height = titleBackSize.height + 10;
    
    self.titleBackground.frame = CGRectMake(self.originPoint.x, self.originPoint.y, titleBackSize.width, titleBackSize.height);
    
    self.manipulatorTitleLabel.frame = self.titleBackground.frame;
    self.manipulatorTitleLabel.left = self.manipulatorTitleLabel.left + 5;
    
    self.titleBackground.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.titleBackground.alpha = 0.0f;
    self.manipulatorTitleLabel.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.manipulatorTitleLabel.alpha = 0.0f;
}
@end
