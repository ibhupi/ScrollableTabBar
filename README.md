# ScrollableTabBar
Scrollable Tab Bar can be use to display scrollable tab bar. It's very easy to use.

<br />
Usage
<b>
Podfile
</b>
```
platform :ios, '7.0'
pod "ScrollableTabbar", "~> 1.0.0"
```

<b>
To display scrollable tab bar call this method
[WTScrollableTabbar scrollableTabbarWithTabItems:frame:tabBarDelegate:]
```
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
```
</b>

<b>
Screen with Scrollable Tabs, Scrolling around Scrollable Tabs
![alt tag](https://raw.githubusercontent.com/ibhupi/ScrollableTabBar/master/screenshots/screen1.png=250x)
![alt tag](https://raw.githubusercontent.com/ibhupi/ScrollableTabBar/master/screenshots/screen2.png=250x)<br />
Selecting Github, RSS in Scrollable Tabs
![alt tag](https://raw.githubusercontent.com/ibhupi/ScrollableTabBar/master/screenshots/screen3.png=250x)
![alt tag](https://raw.githubusercontent.com/ibhupi/ScrollableTabBar/master/screenshots/screen4.png=250x)<br />
</b>

Sample code to be used from main project to display scrollable tab bar
```
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat height = 50;
    CGFloat yPos = CGRectGetMaxY(self.view.window.bounds) - height;
    CGRect rect = CGRectMake(0, yPos, CGRectGetWidth(self.view.window.bounds), height);
    
    WTScrollableTabbar *scrollableTabbar = [WTScrollableTabbar scrollableTabbarWithTabItems:[self tabItems] frame:rect tabBarDelegate:self];
    [self.view addSubview:scrollableTabbar];
    
    // Optional
    scrollableTabbar.tabSize = CGSizeMake(50, 50);
}

- (NSArray *)tabItems
{
    static NSMutableArray *tabItems;
    if (tabItems)
    {
        return tabItems;
    }
    NSString *imagesString = @"4sq.png,Instagram.png,facebook.png,skype.png,wordpress.png,Behance.png,Rss.png,g+.png,tumblr.png,youtube.png,Forrst.png,dribbble.png,linkedin.png,twitter.png,Github.png,evernote.png,pinterest.png,vimeo.png";
    NSArray *imageStringArray = [imagesString componentsSeparatedByString:@","];
    tabItems = [NSMutableArray new];
    for (NSString *imageName in imageStringArray)
    {
        UIImage *image = [UIImage imageNamed:imageName];
        NSString *name = [imageName stringByDeletingPathExtension];
        WTScrollableTabbarTabItem *tabItem = [WTScrollableTabbarTabItem tabItemWithText:name image:image];
        if (!tabItem)
        {
            continue;
        }
        tabItem.textColor = [self _randomColor];
        [tabItems addObject:tabItem];
    }
    return tabItems;
}

#pragma mark - WTScrollableTabbarDelegate

- (void)scrollableTabbar:(WTScrollableTabbar *)tabbar
         didTapOnTabItem:(WTScrollableTabbarTabItem *)tabItem
{
    NSLog(@"%s", __FUNCTION__);
    self.imageView.image = tabItem.image;
    self.label.text = tabItem.text;
}


#pragma mark - Other helper

/**
 * Helper function for random color
 * https://gist.github.com/kylefox/1689973
 */
- (UIColor *)_randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.7;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.4;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
```