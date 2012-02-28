Objective C 的容器排序
======================

描述符
-----------------

下例代码是我从一段单元测试中摘出来的，背景可以参见 LevenshteinDistance  的代码。生产环境的 LevenshteinDistance 算法跟黑科技仓库的一致，只是多了一个很简陋的 buffer，减少内存碎片。所以黑科技的代码是静态方法，这里用的实例方法，但是这个差异不影响这里的功能演示。

测试框架用的是 GHUnitTest，这个框架的使用可以在它的 github 仓库中查阅文档，以为黑科技也许也会放出相关的例子。

这里重点演示的是使用 NSDescriptor 对 NSMutableArray 对象排序，这个排序代码看起来很像 SQL 的 order by 语法。

<div><code>
{
-(void)testHostsAndSort {
    XcfLevenshteinDitstance *ruler = [[XcfLevenshteinDitstance alloc] initWithBufferSize:4096];
    NSArray *hosts = [data objectForKey:@"host"];
    NSMutableArray *table = [[NSMutableArray alloc] initWithCapacity:[hosts count]^2];
    
    for (NSString *source in hosts) {
        for (NSString *target in hosts) {
            NSDictionary *record = [[NSDictionary alloc] initWithObjectsAndKeys:source, @"source", 
                                    target, @"target",
                                    [[NSNumber alloc] initWithInt:[ruler fromSource:source toTarget:target]], @"distance", nil];
            [table addObject:record];
        }
        NSArray *descriptors = [[NSArray alloc] initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"source" ascending:YES],
                                [NSSortDescriptor sortDescriptorWithKey:@"distance" ascending:YES], nil];
        [table sortUsingDescriptors:descriptors];
    }

    for (NSDictionary *record in table) {
        NSString *source = [record objectForKey:@"source"];
        NSString *target = [record objectForKey:@"target"];
        NSNumber *value = [record objectForKey:@"distance"];
        GHTestLog(@"from %@ to %@ is %@", source, target, value);
        if ([source isEqualToString:target]) {
            GHAssertTrue([value intValue]==0, @"from %@ to itself expect zero but got %@", source, value);
        }
    }
    
    for (NSDictionary *record in table) {
        NSNumber *distance = [record objectForKey:@"distance"];
        [record release];
        [distance release];
    }
    [table release];
}

-(void)testHostsGuess {
    XcfLevenshteinDitstance *ruler = [[XcfLevenshteinDitstance alloc] initWithBufferSize:4096];
    NSArray *hosts = [data objectForKey:@"host"];
    NSArray *invalid = [data objectForKey:@"invalid"];
    NSMutableArray *table = [[NSMutableArray alloc] initWithCapacity:[hosts count]*[invalid count]];
    
    for (NSString *source in invalid) {
        for (NSString *target in hosts) {
            NSDictionary *record = [[NSDictionary alloc] initWithObjectsAndKeys:source, @"source", 
                                    target, @"target",
                                    [[NSNumber alloc] initWithInt:[ruler fromSource:source toTarget:target]], @"distance", nil];
            [table addObject:record];
        }
        NSArray *descriptors = [[NSArray alloc] initWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"source" ascending:YES],
                                [NSSortDescriptor sortDescriptorWithKey:@"distance" ascending:YES], nil];
        [table sortUsingDescriptors:descriptors];
    }
    
    for (NSDictionary *record in table) {
        NSString *source = [record objectForKey:@"source"];
        NSString *target = [record objectForKey:@"target"];
        NSNumber *value = [record objectForKey:@"distance"];
        GHTestLog(@"from %@ to %@ is %@", source, target, value);
        GHAssertTrue([value intValue]>0, @"from %@ to %@ should more than zero", source, target);
    }
    
    for (NSDictionary *record in table) {
        NSNumber *distance = [record objectForKey:@"distance"];
        [record release];
        [distance release];
    }
    [table release];
}

</code></div>