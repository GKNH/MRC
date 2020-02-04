//
//  SPerson.m
//  MRC
//
//  Created by Sun on 2020/2/4.
//  Copyright © 2020 sun. All rights reserved.
//

#import "SPerson.h"

@implementation SPerson

/**
 @synthesize 用来生成属性和成员变量的 setter、getter 方法的实现
 @synthesize 会根据属性的类型（retain，assign）自动添加内存管理代码
 但是现在不用写了，只要写了：
 @property (nonatomic, assign) int age;
 就包含了，生成属性，生成成员变量，生成 setter、getter 方法的声明和实现
 */
//@synthesize age = _age;
//@synthesize dog = _dog;
//@synthesize car = _car;


/**
 还原 @property 自动生成的属性的 setter、getter 方法的实现
- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
    return _age;
}

- (void)setDog:(SDog *)dog {
    if (_dog != dog) {
        // 释放原来的狗
        [_dog release];
        // retain 现在的狗
        _dog = [dog retain];
    }
}

- (SDog *)dog {
    return _dog;
}

- (void)setCar:(SCar *)car {
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
}

- (SCar *)car {
    return _car;
}
*/

/**
 工厂方法里面创建的对象一般都调用了autorelease方法，所以通过工厂方法创建出来的对象不用再次调用 release 方法了
 */
+ (instancetype)person {
    return [[[self alloc] init] autorelease];
}

- (void)dealloc {
    // 调用了 setDog 方法
    self.dog = nil;
    // 调用了 setCar 方法
    self.car = nil;
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end

