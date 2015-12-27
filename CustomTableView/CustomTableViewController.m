//
//  CustomTableViewController.m
//  CustomTableView
//
//  Created by MC976 on 11/29/15.
//  Copyright © 2015 MC976. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"
#import "ViewController.h"
@interface CustomTableViewController ()
@property (strong, nonatomic) NSIndexPath * mExpandedIndexPath;
@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated {
    for (CustomTableViewCell * cell in [self.tableView visibleCells]) {
        [cell ignoreFrameChanges];
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"customCell";
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.customLabel.text = @"Custom";
    cell.clickMe.tag = indexPath.row;
    [cell.clickMe addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell.swapMe  addTarget:self action:@selector(didSwapButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.swapMe.hidden = ([indexPath compare:self.mExpandedIndexPath] != NSOrderedSame);
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath * tPreviousIndexPath = self.mExpandedIndexPath;
//    [tableView beginUpdates];
    if ([indexPath compare:self.mExpandedIndexPath] == NSOrderedSame) {
        self.mExpandedIndexPath = nil;
    } else {
        self.mExpandedIndexPath = indexPath;
    }
    
    NSArray * tIndexPaths ;
    if (self.mExpandedIndexPath == nil) {
        tIndexPaths = [NSArray arrayWithObjects:tPreviousIndexPath, nil];
    } else {
        tIndexPaths = [NSArray arrayWithObjects:self.mExpandedIndexPath, nil];
    }
    if ([tIndexPaths count]) {
        [tableView reloadRowsAtIndexPaths:tIndexPaths withRowAnimation:UITableViewRowAnimationNone];
    }
//    [tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [((CustomTableViewCell *)cell) watchFrameChanges];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((CustomTableViewCell *)cell) ignoreFrameChanges];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath compare:self.mExpandedIndexPath] == NSOrderedSame) {
        return 100;
    }
    return 50;
}

#pragma mark - Custom Table view cell events
- (void) didClickButton:(id)sender {
    NSIndexPath * tIndexPath = [self.tableView getButtonIndexPath:sender];
    NSLog(@"did click  Row :%ld",tIndexPath.row);
    ViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) didSwapButton:(id)sender {
    NSIndexPath * tIndexPath = [self.tableView getButtonIndexPath:sender];
    NSLog(@"did Swap Row :%ld",tIndexPath.row);
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
}

@end
