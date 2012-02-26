//
//  main.m
//  KVCTest
//
//  Created by March Liu on 12-2-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTData.h"
#import "KTObserver.h"

NSArray * arraryOfData();
NSSet * setOfData();

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"参考文档为官方文档和 http://www.slideshare.net/sergio.acosta/intro-to-cocoa-kvckvo-and-bindings-presentation ");
        NSLog(@"创建KVC实验对象");
        KTData *data = [[KTData alloc] init];
        NSLog(@"绑定 KVO");
        KTObserver *ob = [[KTObserver alloc] init];
        [data addObserver:ob forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        NSLog(@"绑定数据属性");
        [data setValue:@"test data" forKey:@"field"];
        NSLog(@"数据绑定成功, data.name 的值为 %@", [data valueForKey:@"field"]);
        [data setValue:@"data's item value" forKeyPath:@"item.value"];
        NSLog(@"通过 keyvaluepath 的 set/valueForPath 操作可以将 data.item.value 赋值为 %@", [data valueForKeyPath:@"item.value"]);
        NSLog(@"解除 KVO 绑定");
        [data removeObserver:ob forKeyPath:@"name"];
        NSLog(@"构造data对象数组");
        
        NSArray *array = arraryOfData();
        NSLog(@"通过 @avg 计算 nsarray 的数据平均值，结果为 %@", [array valueForKeyPath:@"@avg.number"]);
        NSLog(@"通过 @sum 计算 nsarray 的数据总和，结果为 %@", [array valueForKeyPath:@"@sum.number"]);
        NSLog(@"通过 @min 计算 nsarray 的最小值，结果为 %@", [array valueForKeyPath:@"@min.number"]);
        NSLog(@"通过 @max 计算 nsarray 的最大值，结果为 %@", [array valueForKeyPath:@"@max.number"]);
        NSLog(@"通过 @count 计算 nsarray 的数据計數，结果为 %@", [array valueForKeyPath:@"@count.number"]);
        NSLog(@"通过 @distinctUnionOfObjects 计算 nsarray 的去重，结果为 %@", [array valueForKeyPath:@"@distinctUnionOfObjects.number"]);
        NSLog(@"下面的代码里有什么奇怪的东西混了进来……");
        NSLog(@"通过 numberPool.@avg.self 计算 data 中数值池成员的元素平均值，结果为 %@", [data valueForKeyPath:@"numberPool.@avg.self"]);
        
        NSArray *nestPool = [[NSArray alloc] initWithObjects:arraryOfData(), 
                             arraryOfData(),
                             arraryOfData(),
                             arraryOfData(),
                             arraryOfData(),
                             nil];
        
        NSLog(@"通过 @distinctUnionOfArrays 计算多个数组的联合去重，结果为 %@", [nestPool valueForKeyPath:@"@distinctUnionOfArrays.number"]);

        NSLog(@"通过 @unionOfArrays 计算多个数组的联合，结果为 %@", [nestPool valueForKeyPath:@"@unionOfArrays.number"]);

        NSSet *nestSet = [[NSSet alloc] initWithObjects:setOfData(), 
                                setOfData(),
                                setOfData(),
                                setOfData(),
                                setOfData(),
                             nil];
        NSLog(@"通过 @unionOfSets 计算多个集合的联合，结果为 %@", [nestSet valueForKeyPath:@"@distinctUnionOfSets.number"]);
        
        NSLog(@"valueForUndefinedKey 相当于 Ruby 的 method_missing");
        NSLog(@"这个值 %@ 来自不存在的成员 undefined", [data valueForKey:@"undefined"]);
        NSLog(@"Objective c 不能动态添加对象的成员，不过通过 valueForUndefinedKey ，我们可以将请求消息转向，从而实现这个功能。");
        
        NSMutableDictionary *ddata = [[NSMutableDictionary alloc] init];
        NSLog(@"对字典对象使用 setValue forKey");
        [ddata setValue:@"a value set by setValue:forKey: method" forKey:@"keyInDict"];
        NSLog(@"从字典 %@ 中读取 %@ 的 value 而非 object ", ddata, [data valueForKey:@"keyInDict"]);
    }
    return 0;
}

NSArray* arraryOfData() {
    return [[NSArray alloc] initWithObjects:[[KTData alloc] init], 
     [[KTData alloc] init],
     [[KTData alloc] init],
     [[KTData alloc] init],
            nil];
}

NSSet *setOfData() {
    return [[NSSet alloc] initWithObjects:[[KTData alloc] init], 
            [[KTData alloc] init],
            [[KTData alloc] init],
            [[KTData alloc] init],
            nil];
}

