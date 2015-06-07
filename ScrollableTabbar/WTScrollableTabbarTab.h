//
//  WTScrollableTabbarTab.h
//  twme
//
//  Created by Bhupendra Singh on 6/7/15.
//  Copyright (c) 2015 Bhupendra Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTScrollableTabbarTabItem : NSObject

/**
 * Helper custom index that client can specify and use it to check which tab index tapped
 */
@property (nonatomic) NSInteger index;

/**
 * Image to display in tab
 */
@property (strong, nonatomic) UIImage *image;

/**
 * text to display in tab
 */
@property (strong, nonatomic) NSString *text;

/**
 * Text color
 */
@property (strong, nonatomic) UIColor *textColor;

/**
 * background Color of tab
 */
@property (strong, nonatomic) UIColor *backgroundColor;

/**
 * background highlighted Color of tab
 */
@property (strong, nonatomic) UIColor *highlightedColor;

/**
 * Tabitem for displaying in tabs.
 * @param text, NSString *text of tab to display, Optional
 * @param image, UIImage to display in tab, Optional
 *
 * @warning, atleast text or image should be specified to display tab properly.
 * @return returns instance of WTScrollableTabbarTabItem,
 */
+ (WTScrollableTabbarTabItem *)tabItemWithText:(NSString *)text
                                          image:(UIImage *)image;

@end

@interface WTScrollableTabbarTab : UICollectionViewCell

/**
 * Setting this WTScrollableTabbarTabItem will configure tab as per tabItem
 */
@property (strong, nonatomic) WTScrollableTabbarTabItem *tabItem;

@end
