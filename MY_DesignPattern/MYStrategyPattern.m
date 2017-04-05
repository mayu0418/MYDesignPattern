//
//  MYStrategyPattern.m
//  MY_DesignPattern
//
//  Created by mayu on 2017/4/5.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "MYStrategyPattern.h"

@implementation SpecificAction

- (void)action {
    NSLog(@"具体行为1");
}

@end

@implementation SpecificAction1

- (void)action {
    NSLog(@"具体行为2");
}

@end

@implementation MYStrategyPattern

- (instancetype)init {
    self = [super init];
    if (self) {
        _action = [SpecificAction new];
    }
    return self;
}

- (void)testAction {
    [_action action];
}

@end

int strategyPattern() {
    MYStrategyPattern *sp = [MYStrategyPattern new];
    [sp testAction];   //具体行为1
    
    SpecificAction1 *a1 = [SpecificAction1 new];
    sp.action = a1;
    [sp testAction];    //具体行为2
    
    SpecificAction *a2 = [SpecificAction new];
    sp.action = a2;
    [sp testAction];  //具体行为1
    return 0;
}
