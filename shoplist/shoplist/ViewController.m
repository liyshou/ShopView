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
@property (weak, nonatomic) IBOutlet UILabel *buh;
@property (nonatomic,strong) NSArray * imageNames;
@property(weak,nonatomic)UIButton *addBtn;
@property(weak,nonatomic)UIButton *removeBtn;
//存放全部的图片到数组中
@property(strong,nonatomic) NSArray *shops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.addBtn = [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) action:@selector(add)];
   // [self addButtonWithImage:@"remove" frame:CGRectMake(270, 30, 50, 50) action:@selector(remove)];
    self.addBtn = [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) action:@selector(add)];
    self.removeBtn = [self addButtonWithImage:@"remove" highImage:@"remove_hightlighted" disableImage:@"remove_disabled" frame:CGRectMake(270, 20, 50,50) action:@selector(remove)];
    //一开始删除按钮灰色
    self.removeBtn.enabled = NO;
    //数据存放//通过字典数组传值
    self.shops = @[
                   @{
                       @"icon":@"1",@"name":@"单肩包"
                       },
                   @{
                       @"icon": @"2",@"name":@"小红包"
                       },
                   @{
                       @"icon":@"4",@"name":@"虎纹包"
                       },
                   @{
                       @"icon":@"5",@"name":@"貂皮包"
                       }
                   ];
    
}

#pragma mark 添加按钮
//-(void) addButtonWithImage:(NSString *)image hightImage:(NSString*)hightImage disableImage:(NSString*)disableImage frame:(CGRect)frame action:(SEL)action
- (UIButton *)addButtonWithImage:(NSString *)image highImage:(NSString *)highImage disableImage:(NSString *)disableImage frame:(CGRect)frame action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateNormal];
    btn.frame = frame;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];//按钮点击事件
    [self.view addSubview:btn]; //显示按钮
    return  btn;
}

#pragma mark 添加
int i = 0 ; 
-(void)add
{
    
    CGFloat shopW = 80;
    CGFloat shopH = 90;
    int cols = 3;
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
    //NSArray *array = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"], nil];
    //srandom(time(NULL));
    //int a = random() % 2 ;
   // UIImage *image = array[i++]; //随机读图片
    //定义的是字典值数组
    NSDictionary *shop = self.shops[index];
    UIImage *image = [UIImage imageNamed:shop[@"icon"]];
    //if (i > 3)
   // {
   //     i = 0;
   // }
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
    
    
    //控制图片的数量，防止抛异常
    [self checkState];
    
}

#pragma 添加删除
-(void)remove
{
    [[self.shopview.subviews lastObject] removeFromSuperview];
    [self checkState] ;
}

#pragma mark 检查按钮状态
-(void) checkState
{
    NSString *text = nil;
    self.removeBtn.enabled = (self.shopview.subviews.count) > 0;
    self.addBtn.enabled = (self.shopview.subviews.count < self.shops.count);
    if (self.removeBtn.enabled == NO)
    {
        text = @"已经全部删除";
    }
    else if(self.addBtn.enabled == NO)
    {
        text =@"已经添加满了";
    }
    if(text == nil)
    {
        return ;
    }
    self.buh.text = text;
    self.buh.alpha = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.buh.alpha = 0.0;
    });
}


@end
