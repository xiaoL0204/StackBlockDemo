//
//  StackBlockController.m
//  StackBlockDemo
//
//  Created by xiaoL on 17/2/8.
//  Copyright © 2017年 xiaolin. All rights reserved.
//

#import "StackBlockController.h"

@interface StackBlockController ()

@end

typedef void (^blk_t) (void);

@implementation StackBlockController

-(id)getBlockArray
{
    int val = 10;
    //Block作为参数传递，Block作为Objective-C对象加入数组，编译器不会自动生成将Block复制到堆上的代码。现在Block在栈上。
    return [[NSArray alloc] initWithObjects:^{NSLog(@"blk0:%@",@(val));},^{NSLog(@"blk1:%@",@(val));}, nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //getBlockArray方法执行结束时，栈上的Block被废弃。
    //下面这段代码执行结果：控制台打印出blk0:10，随后程序强制结束。
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
