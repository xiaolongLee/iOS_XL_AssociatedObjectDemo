//
//  Test4ViewController.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "Test4ViewController.h"
#import "UITapGestureRecognizer+NSString.h"
@interface Test4ViewController ()

@end

@implementation Test4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"Test4ViewController";
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectZero];
    view1.frame = CGRectMake(50, 150, 250, 100);
    view1.backgroundColor = [UIColor blueColor];
    view1.tag = 1;
    [self.view addSubview:view1];
    
    UITapGestureRecognizer *signViewSingle0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    //partnercode
    signViewSingle0.dataStr = [NSString stringWithFormat:@"%ld",view1.tag];
    [view1 addGestureRecognizer:signViewSingle0];
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    
     NSLog(@"which view is clicked? ok,i know, it's tag is %@",tap.dataStr);
    
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
