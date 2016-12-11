//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UITextView *messageTextView;
@property (nonatomic, strong) IBOutlet UIImageView  *userIcon;
@end

@implementation ChatCell

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
}

- (void)loadWithData:(ChatData *)chatData
{
    self.usernameLabel.text = chatData.username;
    self.messageTextView.text = chatData.message;
    
    //makes image a circle
    self.userIcon.layer.cornerRadius = self.userIcon.frame.size.width / 2;
    self.userIcon.clipsToBounds = YES;
    
    //calls for image from json file
    NSString *imgURL = chatData.avatar_url;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
    
    //set your image on main thread.
    dispatch_async(dispatch_get_main_queue(), ^{
        [_userIcon setImage:[UIImage imageWithData:data]];
    });
};

    

@end
