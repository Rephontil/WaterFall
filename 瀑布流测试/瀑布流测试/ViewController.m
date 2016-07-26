//
//  ViewController.m
//  瀑布流测试
//
//  Created by ZhouYong on 16/7/25.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ViewController.h"
#import "ZYCollectionViewLayout.h"

@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

//重用标志
static  NSString * const reuseIdentifier = @"waterPourCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    ZYCollectionViewLayout *layout = [[ZYCollectionViewLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//    设置数据源的代理对象
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.4];
    [self.view addSubview:collectionView];

//    registerClass通过类名来注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];


}


#pragma mark**********UICollectionViewDataSource************
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 501;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0 blue:arc4random()%255/256.0 alpha:arc4random()%255/256.0];

//    idea：在每一个cell上添加一个label，但是label也要动态地创建。
    NSInteger tag = 10;
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:tag];
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.tag = tag;
        [cell.contentView addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"%ld",indexPath.item];

    [label sizeToFit];

    return cell;
}


@end
