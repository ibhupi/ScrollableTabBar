//
//  WTScrollableTabbar.m
//  twme
//
//  Created by Bhupendra Singh on 6/7/15.
//  Copyright (c) 2015 Bhupendra Singh. All rights reserved.
//

#import "WTScrollableTabbar.h"

static NSString *const WTScrollableTabCellNib = @"WTScrollableTabbarTab";
static NSString *const WTScrollableTabCellID = @"WTScrollableTabCellID";

@interface WTScrollableTabbar () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation WTScrollableTabbar

+ (WTScrollableTabbar *)scrollableTabbarWithTabItems:(NSArray *)tabItems
												frame:(CGRect)frame
									   tabBarDelegate:(id<WTScrollableTabbarDelegate>)tabBarDelegate
{
	UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
	[flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
	WTScrollableTabbar *tabBar = [[self alloc] initWithFrame:frame collectionViewLayout:flowLayout];
	if (tabBar)
	{
		[tabBar setCollectionViewLayout:flowLayout];
		tabBar.frame = frame;
		[tabBar _sharedInit];
		tabBar.backgroundColor = [UIColor clearColor];
		[tabBar setShowsHorizontalScrollIndicator:NO];
		[tabBar setShowsVerticalScrollIndicator:NO];
		tabBar.tabItems = tabItems;
		tabBar.scrollableTabViewDelegate = tabBarDelegate;
	}
	return tabBar;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
		[self _sharedInit];
    }
    return self;
}

- (void)_sharedInit
{
	self.delegate = self;
	self.dataSource = self;

	UINib *cellNib = [UINib nibWithNibName:WTScrollableTabCellNib bundle:nil];
	[self registerNib:cellNib forCellWithReuseIdentifier:WTScrollableTabCellID];
}

- (void)setTabItems:(NSArray *)tabItems
{
    _tabItems = tabItems;
    [self reloadData];
}

- (void)setTabSize:(CGSize)tabSize
{
	tabSize.height = MIN(tabSize.height, CGRectGetHeight(self.frame));
	tabSize.width  = MIN(tabSize.width, CGRectGetWidth(self.frame));
	_tabSize = tabSize;
	[self reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tabItems.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WTScrollableTabbarTab *cell = [collectionView dequeueReusableCellWithReuseIdentifier:WTScrollableTabCellID forIndexPath:indexPath];
    cell.tabItem = self.tabItems[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.scrollableTabViewDelegate respondsToSelector:@selector(scrollableTabbar:didTapOnTabItem:)])
    {
        [self.scrollableTabViewDelegate scrollableTabbar:self didTapOnTabItem:self.tabItems[indexPath.row]];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	if (self.tabSize.height && self.tabSize.width)
	{
		return self.tabSize;
	}
    CGFloat width;
    if (self.tabItems.count < 6)
    {
        width = CGRectGetWidth(self.frame) / self.tabItems.count;
    }
    else
    {
        width = (CGRectGetWidth(self.frame) / 5 ) - 2;
    }
    
    return CGSizeMake(width, CGRectGetHeight(self.frame));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
