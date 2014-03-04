//
//  CharactersEscapeService.h
//  Ridekeeper
//
//  Created by Muhtasim Ayaz on 3/4/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CharactersEscapeService : NSObject

+ (NSString *)escape:(NSString *)unescapedString;
+ (NSString *)unescape:(NSString *)escapedString;

@end