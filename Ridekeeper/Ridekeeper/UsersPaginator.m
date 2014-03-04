//
//  UsersPaginator.m
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/3/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "UsersPaginator.h"

@interface UsersPaginator () <QBActionStatusDelegate>

@end

@implementation UsersPaginator

- (void)fetchResultsWithPage:(NSInteger)page pageSize:(NSInteger)pageSize
{
    // Retrieve QuickBlox users
    // 10 users per page
    //
    PagedRequest *request = [[PagedRequest alloc] init];
	request.perPage = pageSize;
	request.page = page;
	[QBUsers usersWithPagedRequest:request delegate:self];
}


#pragma mark
#pragma mark QBActionStatusDelegate

- (void)completedWithResult:(Result *)result
{
    // Got users
    //
    if(result.success){
        QBUUserPagedResult *res = (QBUUserPagedResult*)result;
        [self receivedResults:res.users total:res.totalEntries];
    }
}

@end
