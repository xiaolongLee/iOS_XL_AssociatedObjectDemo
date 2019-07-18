//
//  Test3ViewController.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "Test3ViewController.h"
#import "UIButton+Handle.h"
@interface Test3ViewController ()
@property (nonatomic, strong) UIButton *testButton;
@end

@implementation Test3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Test3ViewController";
     [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(50, 150, 250, 100);
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"UIButton+Handle" forState:UIControlStateNormal];
    
    self.testButton = button1;
    [self.view addSubview:self.testButton];
    
    [self.testButton handleClickCallBack:^(UIButton * _Nonnull button) {
         NSLog(@"block --- click UIButton+Handle");
    }];
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
