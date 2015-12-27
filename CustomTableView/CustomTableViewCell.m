//
//  CustomTableViewCell.m
//  CustomTableView
//
//  Created by MC976 on 11/29/15.
//  Copyright © 2015 MC976. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()
@property (nonatomic) BOOL isObserving;
@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) checkHeight {
    self.swapMe.hidden = self.frame.size.height < 100;
}

- (void) watchFrameChanges {
    if (!self.isObserving) {
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
        self.isObserving = YES;
    }
}

- (void) ignoreFrameChanges {
    if (self.isObserving) {
        [self removeObserver:self forKeyPath:@"frame"];
        self.isObserving = NO;
    }
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"frame"]) {
        [self checkHeight];
    }
}

@end
