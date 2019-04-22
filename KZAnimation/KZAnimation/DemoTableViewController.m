//
//  DemoTableViewController.m
//  动画测试
//
//  Created by huangkaizhan on 2017/3/11.
//  Copyright © 2017年 huangkaizhan. All rights reserved.
//

#import "DemoTableViewController.h"
#import "AnimationHeader_lib.h"

#import "ControllerModel.h"

@interface DemoTableViewController ()

// 数据源
@property (nonatomic, strong) NSMutableArray <ControllerModel *>*dataArray;

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"平移" className:@"DemoTranslationController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"缩放" className:@"DemoScaleController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"旋转" className:@"DemoRotationController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"bounds" className:@"DemoBoundsController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"Transform3D" className:@"DemoTransform3DController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"透明度" className:@"DemoOpacityController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"背景色" className:@"DemoBackColorController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"圆角" className:@"DemoCornerRadiusController"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"组合 ：平移+缩放" className:@"DemoAniGroup1Controller"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"组合 ：缩放完成再平移" className:@"DemoAniGroup2Controller"]];
    [self.dataArray addObject:[[ControllerModel alloc] initWithName:@"直接添加keytime和keyvalue" className:@"DemoKeyValuesController"]];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    ControllerModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ControllerModel *model = self.dataArray[indexPath.row];
    Class vcCls = NSClassFromString(model.className);
    id vc = [[vcCls alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSMutableArray<ControllerModel *> *)dataArray
{
    Ani_Array_M(_dataArray)
}
@end
