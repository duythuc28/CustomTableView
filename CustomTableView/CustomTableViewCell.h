//
//  CustomTableViewCell.h
//  CustomTableView
//
//  Created by MC976 on 11/29/15.
//  Copyright © 2015 MC976. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton * clickMe;
@property (weak, nonatomic) IBOutlet UILabel  * customLabel;
@property (weak, nonatomic) IBOutlet UIButton * swapMe;
- (void) watchFrameChanges;
- (void) ignoreFrameChanges;
@end
