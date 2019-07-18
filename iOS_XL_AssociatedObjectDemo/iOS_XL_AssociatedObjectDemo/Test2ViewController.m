//
//  Test2ViewController.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "Test2ViewController.h"
#import "UIAlertView+Handle.h"
#import <objc/runtime.h>

static void *XLAlertViewKey = "XLAlertViewKey";
@interface Test2ViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong) UIAlertView *alert;
@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"Test2ViewController";
    [self popAlertViews3];
}

#pragma mark - way1  传统方案

- (void)popAlertViews1{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    [alert show];
}


//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex  == 0) {
//        [self doCancel];
//    }else{
//        [self doContinue];
//    }
//}

#pragma mark - way2  关联Block体

- (void)popAlertViews2{
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    void (^clickBlock)(NSInteger) = ^(NSInteger buttonIndex){
        if (buttonIndex == 0) {
            [self doCancel];
        } else {
            [self doContinue];
        }
    };
    
    objc_setAssociatedObject(alert, XLAlertViewKey, clickBlock, OBJC_ASSOCIATION_COPY);
    
     [alert show];
}


// UIAlertViewDelegate protocol method

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//
//    void (^clickBlock)(NSInteger) = objc_getAssociatedObject(alertView, XLAlertViewKey);
//    clickBlock(buttonIndex);
//
//}

#pragma mark - way3  继续改进：封装关联的Block体，作为属性
- (void)popAlertViews3{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    [alert setCallBlock:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
             [self doCancel];
        } else {
             [self doContinue];
        }
        
    }];
    
    [alert show];
    

}

//// UIAlertViewDelegate protocol method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^block)(NSInteger) = alertView.callBlock;
    block(buttonIndex);
}







#pragma mark - handle action
- (void)doCancel{
    NSLog(@"doCancel");
}

- (void)doContinue{
    NSLog(@"doContinue");
}
@end
