//
//  ConnectTableViewCell.m
//  ChooseCell
//
//  Created by xrh on 2017/10/27.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "ConnectTableViewCell.h"
#import "ConnectModel.h"

@interface ConnectTableViewCell ()

@property(strong, nonatomic) NSArray *buttons;

@end

@implementation ConnectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _buttons = @[_AButton,_BButton,_CButton,_DButton];
    
}

- (void)setModel:(ConnectModel *)model {
    _model = model;
    
    self.topicLabel.text = model.title;
    self.ALabel.text = model.one;
    self.BLabel.text = model.two;
    self.CLabel.text = model.three;
    self.DLabel.text = model.four;
}

//计算文字的范围
- (CGSize)getTextSizeWithText:(NSString *)text {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.frame.size.width-52, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    
    return rect.size;
}

- (IBAction)touchButtonAction:(UIButton *)sender {
    
    for (UIButton *button in _buttons) {
        if (button == sender) {
            [button setImage:[UIImage imageNamed:@"radio_btn_on.png"] forState:UIControlStateNormal];
        } else {
            [button setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        }
    }
    if ([self.delegate respondsToSelector:@selector(addButtonTager:)]) {
        [self.delegate addButtonTager:sender];
    }
}

- (void)setMark:(NSString *)mark {
    if ([mark isEqualToString:@"0"]) {
        
        [self.AButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.BButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.CButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.DButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        
    }else if ([mark isEqualToString:@"1"])
    {
        [self.AButton setImage:[UIImage imageNamed:@"radio_btn_on.png"] forState:UIControlStateNormal];
        [self.BButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.CButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.DButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
    }else if ([mark isEqualToString:@"2"])
    {
         [self.BButton setImage:[UIImage imageNamed:@"radio_btn_on.png"] forState:UIControlStateNormal];
        [self.AButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.CButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.DButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
    }else if ([mark isEqualToString:@"3"])
    {
        [self.CButton setImage:[UIImage imageNamed:@"radio_btn_on.png"] forState:UIControlStateNormal];
        [self.AButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.BButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.DButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
    }else
    {
        [self.DButton setImage:[UIImage imageNamed:@"radio_btn_on.png"] forState:UIControlStateNormal];
        [self.AButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.BButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
        [self.CButton setImage:[UIImage imageNamed:@"radio_btn_off.png"] forState:UIControlStateNormal];
    }

}

@end
