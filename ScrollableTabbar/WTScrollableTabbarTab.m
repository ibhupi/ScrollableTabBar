//
//  WTScrollableTabbarTab.m
//  twme
//
//  Created by Bhupendra Singh on 6/7/15.
//  Copyright (c) 2015 Bhupendra Singh. All rights reserved.
//

#import "WTScrollableTabbarTab.h"

@implementation WTScrollableTabbarTabItem

+ (WTScrollableTabbarTabItem *)tabItemWithText:(NSString *)text image:(UIImage *)image
{
    WTScrollableTabbarTabItem *tabBarItem = [self new];
    if (tabBarItem)
    {
        tabBarItem.text = text;
        tabBarItem.image = image;
    }
    return tabBarItem;
}

@end

@interface WTScrollableTabbarTab ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation WTScrollableTabbarTab

- (void)prepareForReuse
{
    self.imageView.image = nil;
    self.label.text = nil;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setTabItem:(WTScrollableTabbarTabItem *)tabItem
{
    self.imageView.image = tabItem.image;
    self.label.text = tabItem.text;
    if (tabItem.backgroundColor)
    {
        self.backgroundColor = tabItem.backgroundColor;
    }
    if (tabItem.textColor)
    {
        self.label.textColor = tabItem.textColor;
    }
}

@end
