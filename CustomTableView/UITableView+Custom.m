//
//  UITableView+Custom.m
//  CustomTableView
//
//  Created by MC976 on 11/29/15.
//  Copyright © 2015 MC976. All rights reserved.
//

#import "UITableView+Custom.h"

@implementation UITableView (Custom)

- (NSIndexPath *) getButtonIndexPath:(UIButton *) button {
    CGRect buttonFrame = [button convertRect:button.bounds toView:self];
    return [self indexPathForRowAtPoint:buttonFrame.origin];
}

@end
