//
//  ChatMessageTableViewCell.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatMessageTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextView  *messageTextView;
@property (nonatomic, strong) UILabel     *dateLabel;
@property (nonatomic, strong) UIImageView *backgroundImageView;

+ (CGFloat)heightForCellWithMessage:(QBChatMessage *)message is1To1Chat:(BOOL)is1To1Chat;
- (void)configureCellWithMessage:(QBChatMessage *)message is1To1Chat:(BOOL)is1To1Chat;

@end

