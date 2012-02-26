//
//  KTData.m
//  KVCTest
//
//  Created by March Liu on 12-2-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KTData.h"

@implementation KTData

- (id)init {
    self = [super init];
    if (self) {
        field = @"key value coding test object";
        item = [[KTValue alloc] init];
        number = [[NSNumber alloc] initWithInt:rand()];
        numberPool = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithInt:rand()], 
                      [[NSNumber alloc] initWithInt:rand()], 
                      [[NSNumber alloc] initWithInt:rand()],
                      [[NSNumber alloc] initWithInt:rand()],
                      [[NSNumber alloc] initWithInt:rand()],nil];
    }
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key {
    return [[NSString alloc] initWithFormat:@"I'm a ghost value for %@", key];
}

// 激活注释中的代码可以观察到 KVC 方法被重载后的效果
//- (id)valueForKey:(NSString *)key {
//    NSLog(@"override for valueForKey ");
//    return [super valueForKey:key];
//}
//
//- (id)valueForKeyPath:(NSString *)keyPath {
//    NSLog(@"override for valueForKeyPath");
//    return [super valueForKeyPath:keyPath];
//}

@end
