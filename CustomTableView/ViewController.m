//
//  ViewController.m
//  CustomTableView
//
//  Created by MC976 on 11/29/15.
//  Copyright © 2015 MC976. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor) name:@"changeColor" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)changeColor {
    NSLog(@"cc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
