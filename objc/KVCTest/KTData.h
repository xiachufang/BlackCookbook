//
//  KTData.h
//  KVCTest
//
//  Created by March Liu on 12-2-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTValue.h"

@interface KTData : NSObject {
    NSString *field;
    KTValue *item;
    NSNumber *number;
    NSArray *numberPool;
}

@end
