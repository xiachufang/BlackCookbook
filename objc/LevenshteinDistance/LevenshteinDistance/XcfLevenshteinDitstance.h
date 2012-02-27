//
//  XcfLevenshteinDitstance.h
//  LevenshteinDistance
//
//  Created by March Liu on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XcfLevenshteinDitstance : NSObject

+ (int) levenshteinDitstanceWithS:(NSString *)x t:(NSString *)y;

@end
