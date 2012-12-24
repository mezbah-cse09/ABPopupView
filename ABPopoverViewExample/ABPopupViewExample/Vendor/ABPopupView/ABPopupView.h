//
//  ABPopupView.h
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

#import <UIKit/UIKit.h>

/**
 A simple popup view that displays some text
 @author
 */
@interface ABPopupView : UIView

/**
 The recomended way to display the popup. It will create and manage itself by adding itself onto
 the the main window of the application and recieve user input to dismiss itself
 @param title The title to display
 @param origin The origin the popup should appear at (bottom left of the popup)
 */
+ (void)displayPopupWithTitle:(NSString *)title atPoint:(CGPoint)origin;

/**
 Creates a new popup for manual use. The recomended way to use this popup is
 the static method displayPopupWithTitle:atPoint.
 @param title The tiltle to be displayed in the popup
 @param point The left, bottom origin of the popup
 @returns self
 */
- (id)initWithTitle:(NSString *)title point:(CGPoint)point;

@end
