//
//  LocalStorageService.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalStorageService : NSObject

@property (nonatomic, strong) QBUUser *currentUser;

+ (instancetype)shared;
- (void)saveMessageToHistory:(QBChatMessage *)message withUserID:(NSUInteger)userID;
- (NSMutableArray *)messageHistoryWithUserID:(NSUInteger)userID;

@end
