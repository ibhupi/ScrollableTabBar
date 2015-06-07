//
//  WTScrollableTabbar.h
//  twme
//
//  Created by Bhupendra Singh on 6/7/15.
//  Copyright (c) 2015 Bhupendra Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTScrollableTabbarTab.h"

@class WTScrollableTabbar;

@protocol WTScrollableTabbarDelegate <NSObject>

@optional

/**
 * If tabBarDelegate is set, delegate will be informed when tab is tapped
 */
- (void)scrollableTabbar:(WTScrollableTabbar *)tabbar didTapOnTabItem:(WTScrollableTabbarTabItem *)tabItem;

@end

@interface WTScrollableTabbar : UICollectionView

/**
 * Initialize scrollable tab bar with this handy to use method
 * @param tabItems, array of WTScrollableTabbarTabItem
 * @param frame, frame size of tabbar to be used
 * @param tabBarDelegate, to listen when and which tab tapped
 *
 * @return tabItems, array of WTScrollableTabbarTabItem
 * @warning tabItem must contain image or text to display in tab
 */
+ (WTScrollableTabbar *)scrollableTabbarWithTabItems:(NSArray *)tabItems
												frame:(CGRect)frame
									   tabBarDelegate:(id<WTScrollableTabbarDelegate>)tabBarDelegate;

/**
 * Array of WTScrollableTabbarTabItem 
 * Tabs display will take effect immediately.
 */
@property (strong, nonatomic) NSArray *tabItems;

/*
 * Optional delegate that will be informed when tab clicked
 */
@property (nonatomic, assign) id<WTScrollableTabbarDelegate> scrollableTabViewDelegate;

/**
 * Custom non zero tab size, If not specified then default will be used.
 * Default, Max five tabs visible at a time, and height = 50
 */
@property (nonatomic) CGSize tabSize;

@end
