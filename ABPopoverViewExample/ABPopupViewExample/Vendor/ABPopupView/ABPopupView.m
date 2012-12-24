//
//  ABPopupView.m
//
//  Version 0.1
//
//  Created by Aron Bury on 24/12/2012.
//  Copyright 2012 Aron Bury. All rights reserved.
//
//  Get the latest version of ABPopupView from this location:
//  https://github.com/abury/ABPopupView
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
#import <QuartzCore/QuartzCore.h>

#define kAnimationTime 0.18

@interface ABPopupView ()

/**
 The label that displays the name of the popup
 */
@property (nonatomic, strong) UILabel *popupLabel;

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

/**
 Helper method. Implements CGAffineTransformMakeScale and sets transparence to both the title lavel and the background
 @param size The size to scale the views to
 @param alpha The transparency value
 */
- (void)transformViewsToSize:(CGAffineTransform)transform withAlpha:(CGFloat)alpha;

@end

@implementation ABPopupView

#pragma mark -
#pragma mark - Public Static Methods

+ (void)displayPopupWithTitle:(NSString *)title atPoint:(CGPoint)origin
{
    ABPopupView *popover = [[ABPopupView alloc] initWithTitle:title point:origin];
    
    [popover setUpPopup];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:popover];
    
    [UIView animateWithDuration:kAnimationTime
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [popover transformViewsToSize:CGAffineTransformMakeScale(1.3, 1.3) withAlpha:1.0f];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:kAnimationTime
                                          animations:^{
                                              [popover transformViewsToSize:CGAffineTransformIdentity withAlpha:1.0f];
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
        
        _popupLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _popupLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        _popupLabel.backgroundColor = [UIColor clearColor];
        _popupLabel.textColor = [UIColor whiteColor];
        _popupLabel.text = title;
        
        _titleBackground = [[UIView alloc] initWithFrame:CGRectZero];
        _titleBackground.alpha = 0.8;
        _titleBackground.backgroundColor = [UIColor blackColor];
        _titleBackground.layer.cornerRadius = 13;
        
        [self addSubview:self.titleBackground];
        [self addSubview:self.popupLabel];
        
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
                         [self transformViewsToSize:CGAffineTransformMakeScale(0.5, 0.5) withAlpha:0.0f];
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

#pragma mark -
#pragma mark - Private Methods
- (void)setUpPopup
{
    CGSize titleBackSize = [self.popupLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:18.0f]];
    titleBackSize.width = titleBackSize.width + 10;
    titleBackSize.height = titleBackSize.height + 10;
    
    self.titleBackground.frame = CGRectMake(self.originPoint.x, self.originPoint.y, titleBackSize.width, titleBackSize.height);
    
    self.popupLabel.frame = CGRectMake(self.titleBackground.frame.origin.x + 5,
                                       self.titleBackground.frame.origin.y,
                                       self.titleBackground.frame.size.width,
                                       self.titleBackground.frame.size.height);
    
    self.titleBackground.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.titleBackground.alpha = 0.0f;
    self.popupLabel.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.popupLabel.alpha = 0.0f;
}

- (void)transformViewsToSize:(CGAffineTransform)tranform withAlpha:(CGFloat)alpha
{
    self.titleBackground.alpha = alpha;
    self.titleBackground.transform = tranform;
    self.popupLabel.alpha = alpha;
    self.popupLabel.transform = tranform;
}
@end
