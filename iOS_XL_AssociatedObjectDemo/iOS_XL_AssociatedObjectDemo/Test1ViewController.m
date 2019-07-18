//
//  Test1ViewController.m
//  iOS_XL_AssociatedObjectDemo
//
//  Created by Mac-Qke on 2019/7/18.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "Test1ViewController.h"
#import "NSObject+AssociatedObject.h"
@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"Test1ViewController";
    
    NSObject *objc = [[NSObject alloc] init];
    objc.associatedObject = @"Extend Category";
    NSLog(@"associatedObject is = %@",objc.associatedObject);
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
