//
//  MYStrategyPattern.h
//  MY_DesignPattern
//
//  Created by mayu on 2017/4/5.
//  Copyright © 2017年 MY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Action <NSObject>

- (void)action;

@end

@interface MYStrategyPattern : NSObject

@property (nonatomic, strong) id<Action> action;
- (void)testAction;

@end

@interface SpecificAction : NSObject <Action>

@end

@interface SpecificAction1 : NSObject <Action>

@end

