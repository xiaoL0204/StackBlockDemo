//
//  HeapBlockController.m
//  StackBlockDemo
//
//  Created by xiaoL on 17/2/8.
//  Copyright © 2017年 xiaolin. All rights reserved.
//

#import "HeapBlockController.h"

@interface HeapBlockController ()

@end


typedef void (^blk_t) (void);

@implementation HeapBlockController

-(id)getBlockArray
{
    int val = 10;
    //Block变量类型可以直接调用copy方法。所以说Block其实也是Objective-C对象。
    //不管Block配置在堆、栈或者数据区域，用copy方法复制都不会引起任何问题。
    return [[NSArray alloc] initWithObjects:[^{NSLog(@"blk0:%@",@(val));} copy],[^{NSLog(@"blk1:%@",@(val));} copy], nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //正常执行。
    id obj = [self getBlockArray];
    blk_t blk = (blk_t)[obj objectAtIndex:0];
    blk();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
