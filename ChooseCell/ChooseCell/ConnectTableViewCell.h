//
//  ConnectTableViewCell.h
//  ChooseCell
//
//  Created by xrh on 2017/10/27.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ConnectModel;

@protocol CellDelegate <NSObject>

- (void)addButtonTager:(UIButton *)sender;

@end

@interface ConnectTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *topicLabel;
@property (weak, nonatomic) IBOutlet UILabel *ALabel;
@property (weak, nonatomic) IBOutlet UILabel *BLabel;
@property (weak, nonatomic) IBOutlet UILabel *CLabel;
@property (weak, nonatomic) IBOutlet UILabel *DLabel;

@property (weak, nonatomic) IBOutlet UIButton *AButton;
@property (weak, nonatomic) IBOutlet UIButton *BButton;
@property (weak, nonatomic) IBOutlet UIButton *CButton;
@property (weak, nonatomic) IBOutlet UIButton *DButton;

@property(strong, nonatomic) ConnectModel *model;

@property (weak, nonatomic) id<CellDelegate> delegate;

- (IBAction)touchButtonAction:(UIButton *)sender;

- (void)setMark:(NSString *)mark;

@end
