//
//  ViewController.m
//  shoplist
//
//  Created by liyuanshou on 16/10/21.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopview;
@property (nonatomic,strong) NSArray * imageNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addButtonWithImage:@"add" frame:CGRectMake(30, 30, 50, 50) action:@selector(add)];
    [self addButtonWithImage:@"remove" frame:CGRectMake(270, 30, 50, 50) action:@selector(remove)];
    
}

#pragma mark 添加按钮
-(void) addButtonWithImage:(NSString *)image frame:(CGRect)frame action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.frame = frame;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];//按钮点击事件
    [self.view addSubview:btn]; //显示按钮
}

#pragma mark 添加
int i = 0 ; 
-(void)add
{
    
    CGFloat shopW = 50;
    CGFloat shopH = 70;
    int cols = 4 ;
    CGFloat colMargin = (self.shopview.frame.size.width - cols * shopW) /(cols - 1);
    CGFloat rowMargin = 10;
    UIView *shopsview = [[UIView alloc] init];
    NSUInteger index = self.shopview.subviews.count;
    NSUInteger col = index % cols;
    CGFloat shopX = col *(shopW + colMargin);
    NSUInteger row = index / cols;
    CGFloat shopY = row * (shopH + rowMargin);
    shopsview.frame = CGRectMake(shopX, shopY, shopW,shopH);
    [self.shopview addSubview:shopsview];//显示父类存放的图片
    
    //添加图片
    NSArray *array = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"], nil];
    //srandom(time(NULL));
    //int a = random() % 2 ;
    UIImage *image = array[i++]; //随机读图片
    if (i > 3)
    {
        i = 0;
    }
    //创建一个uiimageview 显示图片
    UIImageView *iconView = [[UIImageView alloc]initWithImage:image];
    iconView.frame = CGRectMake(0, 0, shopW, shopW);
    [shopsview addSubview:iconView];
    //文字
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"180元";
    NSLog(@"add 1");
    lable.frame = CGRectMake(0,shopW, shopW, shopH-shopW);
    lable.font = [UIFont systemFontOfSize:11];
        
    lable.textAlignment = NSTextAlignmentCenter;
    [shopsview addSubview:lable];
    
    
}

#pragma 添加删除
-(void)remove
{
    
}

@end
