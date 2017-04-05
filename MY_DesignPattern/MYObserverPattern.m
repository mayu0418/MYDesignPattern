//
//  MYObserverPattern.m
//  MY_DesignPattern
//
//  Created by mayu on 2017/4/5.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "MYObserverPattern.h"

@interface MYNotificationCenter : NSObject

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)notificationName;
- (void)postNotificationName:(NSString *)notificationName;

@end

@interface MYNotificationCenter ()

@property (nonatomic, strong) NSMutableDictionary *notifyNameWithObserverList;
@property (nonatomic, strong) NSMutableDictionary *observerWithSelName;

@end

@implementation MYNotificationCenter

static MYNotificationCenter* _instance = nil;

+ (instancetype)defaultCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        _instance.notifyNameWithObserverList = [NSMutableDictionary dictionary];
        _instance.observerWithSelName = [NSMutableDictionary dictionary];
    });
    return _instance;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)notificationName {
    if ([_notifyNameWithObserverList.allKeys containsObject:notificationName]) {
        [_notifyNameWithObserverList[notificationName] addObject:observer];
    } else {
        NSMutableArray *mAry = @[observer].mutableCopy;
        _notifyNameWithObserverList[notificationName] = mAry;
    }
    NSString *selName = NSStringFromSelector(aSelector);
      [_observerWithSelName setObject:selName forKey:observer];
}

- (void)postNotificationName:(NSString *)notificationName {
    if (![_notifyNameWithObserverList.allKeys containsObject:notificationName]) {
        return;
    }
    NSMutableArray *mAry = _notifyNameWithObserverList[notificationName];
    for (id observer in mAry) {
        NSString *selName = _observerWithSelName[observer];
        SEL sel  = NSSelectorFromString(selName);
        [observer performSelector: sel];
    }
}

@end

@implementation MYObserverPattern



@end

@interface MYTest : NSObject

@end

@implementation MYTest

- (void)post {
    [[MYNotificationCenter defaultCenter] postNotificationName:@"tongzhi"];
}

@end

@interface MYTest1: NSObject <NSCopying>

@end

@implementation MYTest1

- (instancetype)init {
    self = [super init];
    if (self) {
        [[MYNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"tongzhi"];
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return self;
}


- (void)test {
    NSLog(@"收到通知");
}

@end

int observerPattern() {
    MYTest *obj = [MYTest new];
    MYTest1 *obj1 = [MYTest1 new];
    [obj post];
    return 0;
}
