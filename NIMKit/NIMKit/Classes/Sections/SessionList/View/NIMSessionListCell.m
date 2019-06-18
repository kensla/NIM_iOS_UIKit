//
//  NTESSessionListCell.m
//  NIMDemo
//
//  Created by chris on 15/2/10.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NIMSessionListCell.h"
#import "NIMAvatarImageView.h"
#import "UIView+NIM.h"
#import "NIMKitUtil.h"
//#import "NIMBadgeView.h"
#import "WZLBadgeImport.h"

@implementation NIMSessionListCell
#define AvatarWidth 40
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _avatarImageView = [[NIMAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, AvatarWidth, AvatarWidth)];
        _avatarImageView.cornerRadius = 5;
        [self addSubview:_avatarImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor whiteColor];
        _nameLabel.font            = [UIFont boldSystemFontOfSize:15];
        [self addSubview:_nameLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.backgroundColor = [UIColor whiteColor];
        _messageLabel.font            = [UIFont systemFontOfSize:11.f];
        _messageLabel.textColor       =  [UIColor colorWithRed:100/255.0 green:100/255.0 blue:107/255.0 alpha:1.0];
        [self addSubview:_messageLabel];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.font            = [UIFont systemFontOfSize:10.f];
        _timeLabel.textColor       = [UIColor colorWithRed:176/255.0 green:176/255.0 blue:176/255.0 alpha:1.0];
        [self addSubview:_timeLabel];
        
        //        _badgeView = [NIMBadgeView viewWithBadgeTip:@""];
        //        [self addSubview:_badgeView];
        
        //        if (allUnreadCount > 0 ) {
        //            leftItem.badgeBgColor = [UIColor colorWithHexString:@"#FF811C"];
        //            [leftItem showBadgeWithStyle:WBadgeStyleRedDot value:0 animationType:WBadgeAnimTypeNone];
        //        } else {
        //            [leftItem clearBadge];
        //        }
        
    }
    return self;
}


#define NameLabelMaxWidth    160.f
#define MessageLabelMaxWidth 200.f
- (void)refresh:(NIMRecentSession*)recent{
    self.nameLabel.nim_width = self.nameLabel.nim_width > NameLabelMaxWidth ? NameLabelMaxWidth : self.nameLabel.nim_width;
    self.messageLabel.nim_width = self.messageLabel.nim_width > MessageLabelMaxWidth ? MessageLabelMaxWidth : self.messageLabel.nim_width;
    //    if (recent.unreadCount) {
    //        self.badgeView.hidden = NO;
    //        self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
    //    }else{
    //        self.badgeView.hidden = YES;
    //    }
    
    if (recent.unreadCount ) {
        _avatarImageView.badgeBgColor = [UIColor colorWithRed:255/255.0 green:129/255.0 blue:28/255.0 alpha:1.0];
        [_avatarImageView showBadgeWithStyle:WBadgeStyleRedDot value:0 animationType:WBadgeAnimTypeNone];
    } else {
        [_avatarImageView clearBadge];
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    //Session List
    NSInteger sessionListAvatarLeft             = 15;
    NSInteger sessionListNameTop                = 14;
    NSInteger sessionListNameLeftToAvatar       = 16;
    NSInteger sessionListMessageLeftToAvatar    = 16;
    NSInteger sessionListMessageBottom          = 14;
    NSInteger sessionListTimeRight              = 15;
    NSInteger sessionListTimeTop                = 16;
    //    NSInteger sessionBadgeTimeTop            = 15;
    //    NSInteger sessionBadgeTimeRight             = 0;
    
    _avatarImageView.nim_left    = sessionListAvatarLeft;
    _avatarImageView.nim_centerY = self.nim_height * .5f;
    _nameLabel.nim_top           = sessionListNameTop;
    _nameLabel.nim_left          = _avatarImageView.nim_right + sessionListNameLeftToAvatar;
    _messageLabel.nim_left       = _avatarImageView.nim_right + sessionListMessageLeftToAvatar;
    _messageLabel.nim_bottom     = self.nim_height - sessionListMessageBottom;
    _timeLabel.nim_right         = self.nim_width - sessionListTimeRight;
    _timeLabel.nim_top           = sessionListTimeTop;
    _avatarImageView.badgeCenterOffset = CGPointMake(-1, 1);
    //    _badgeView.nim_right         = self.nim_width - sessionBadgeTimeRight;
    //    _badgeView.nim_bottom        = self.nim_height - sessionBadgeTimeBottom;
    
    //    _badgeView.nim_left         = sessionListAvatarLeft + AvatarWidth;
    //    _badgeView.nim_top        = 15;
}



@end
