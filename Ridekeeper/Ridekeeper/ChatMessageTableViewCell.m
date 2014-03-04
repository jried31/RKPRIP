//
//  ChatMessageTableViewCell.m
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "ChatMessageTableViewCell.h"
#import "LocalStorageService.h"

#define padding 20

@implementation ChatMessageTableViewCell

static NSDateFormatter *messageDateFormatter;
static UIImage *orangeBubble;
static UIImage *aquaBubble;

+ (void)initialize{
    [super initialize];
    
    // init message datetime formatter
    messageDateFormatter = [[NSDateFormatter alloc] init];
    [messageDateFormatter setDateFormat: @"yyyy-mm-dd HH:mm:ss"];
    [messageDateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    // init bubbles
    orangeBubble = [[UIImage imageNamed:@"orangeBubble"] stretchableImageWithLeftCapWidth:24  topCapHeight:15];
    aquaBubble = [[UIImage imageNamed:@"aquaBubble"] stretchableImageWithLeftCapWidth:24  topCapHeight:15];
}

+ (CGFloat)heightForCellWithMessage:(QBChatMessage *)message is1To1Chat:(BOOL)is1To1Chat
{
    //    // Replace the next line with these lines if you would like to connect to Web XMPP Chat widget
    //    //
    //    NSString *text;
    //    if(!is1To1Chat){
    //        NSString *unescapedMessage = [CharactersEscapeService unescape:message.text];
    //        NSData *messageAsData = [unescapedMessage dataUsingEncoding:NSUTF8StringEncoding];
    //        NSError *error;
    //        NSMutableDictionary *messageAsDictionary = [NSJSONSerialization JSONObjectWithData:messageAsData options:NSJSONReadingAllowFragments error:&error];
    //        text = messageAsDictionary[@"message"];
    //    }else{
    //        text = message.text;
    //    }
    
    NSString *text = message.text;
    
    
	CGSize  textSize = {260.0, 10000.0};
	CGSize size = [text sizeWithFont:[UIFont boldSystemFontOfSize:13]
                   constrainedToSize:textSize
                       lineBreakMode:NSLineBreakByWordWrapping];
    
	
	size.height += 45.0;
	return size.height;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dateLabel = [[UILabel alloc] init];
        [self.dateLabel setFrame:CGRectMake(10, 5, 300, 20)];
        [self.dateLabel setFont:[UIFont systemFontOfSize:11.0]];
        [self.dateLabel setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:self.dateLabel];
        
        self.backgroundImageView = [[UIImageView alloc] init];
        [self.backgroundImageView setFrame:CGRectZero];
		[self.contentView addSubview:self.backgroundImageView];
        
		self.messageTextView = [[UITextView alloc] init];
        [self.messageTextView setBackgroundColor:[UIColor clearColor]];
        [self.messageTextView setEditable:NO];
        [self.messageTextView setScrollEnabled:NO];
		[self.messageTextView sizeToFit];
		[self.contentView addSubview:self.messageTextView];
    }
    return self;
}

- (void)configureCellWithMessage:(QBChatMessage *)message is1To1Chat:(BOOL)is1To1Chat
{
    // set message
    
    //    // Replace the next line with these lines if you would like to connect to Web XMPP Chat widget
    //    //
    //    if(!is1To1Chat){
    //        NSString *unescapedMessage = [CharactersEscapeService unescape:message.text];
    //        NSData *messageAsData = [unescapedMessage dataUsingEncoding:NSUTF8StringEncoding];
    //        NSError *error;
    //        NSMutableDictionary *messageAsDictionary = [NSJSONSerialization JSONObjectWithData:messageAsData options:NSJSONReadingAllowFragments error:&error];
    //        self.messageTextView.text = messageAsDictionary[@"message"];
    //    }else{
    //        self.messageTextView.text = message.text;
    //    }
    
    self.messageTextView.text = message.text;
    
    
    CGSize textSize = { 260.0, 10000.0 };
    
	CGSize size = [self.messageTextView.text sizeWithFont:[UIFont boldSystemFontOfSize:13]
                                        constrainedToSize:textSize
                                            lineBreakMode:NSLineBreakByWordWrapping];
    
	size.width += 10;
    
    NSString *time = [messageDateFormatter stringFromDate:message.datetime];
    
    // Left/Right bubble
    if ([LocalStorageService shared].currentUser.ID == message.senderID) {
        [self.messageTextView setFrame:CGRectMake(padding, padding+5, size.width, size.height+padding)];
        [self.messageTextView sizeToFit];
        
        [self.backgroundImageView setFrame:CGRectMake(padding/2, padding+5,
                                                      self.messageTextView.frame.size.width+padding/2, self.messageTextView.frame.size.height+5)];
        self.backgroundImageView.image = orangeBubble;
        
        self.dateLabel.textAlignment = NSTextAlignmentLeft;
        self.dateLabel.text = [NSString stringWithFormat:@"%@ %@", [[LocalStorageService shared].currentUser login], time];
        
    } else {
        [self.messageTextView setFrame:CGRectMake(320-size.width-padding/2, padding+5, size.width, size.height+padding)];
        [self.messageTextView sizeToFit];
        
        [self.backgroundImageView setFrame:CGRectMake(320-size.width-padding/2, padding+5,
                                                      self.messageTextView.frame.size.width+padding/2, self.messageTextView.frame.size.height+5)];
        self.backgroundImageView.image = aquaBubble;
        
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.text = [NSString stringWithFormat:@"%d %@", message.senderID, time];
    }
}

@end
