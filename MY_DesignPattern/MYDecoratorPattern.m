//
//  MYDecoratorPattern.m
//  MY_DesignPattern
//
//  Created by mayu on 2017/4/6.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "MYDecoratorPattern.h"

@protocol Action <NSObject>

- (void)doSomething;

@end

@interface Prototype : NSObject <Action>
@end
@implementation Prototype
- (void)doSomething {
    NSLog(@"原型做的事");
}
@end

@interface Decorator : NSObject <Action>
@property (nonatomic, strong) id obj;
@end
@implementation Decorator
- (void)doSomething {
    NSLog(@"装饰器做了该作的事");
    [(id<Action>)_obj doSomething];
}
@end

@interface Decorator1 : NSObject <Action>
@property (nonatomic, strong) id obj;
@end
@implementation Decorator1

- (void)doSomething {
    NSLog(@"装饰器1做了该作的事");
     [(id<Action>)_obj doSomething];
}
@end

@implementation MYDecoratorPattern

@end

int decoratorPattern() {
    Prototype *prototype = [Prototype new];
    Decorator *dec = [Decorator new];
    dec.obj = prototype;
    
    Decorator1 *dec1 = [Decorator1 new];
    dec1.obj = dec;
    [dec1 doSomething];
    return 0;
}
