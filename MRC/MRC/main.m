//
//  main.m
//  MRC
//
//  Created by Sun on 2020/2/4.
//  Copyright © 2020 sun. All rights reserved.
//

// Manual Reference Counting ： MRC

#import <Foundation/Foundation.h>
#import "SPerson.h"
#import "SDog.h"
#import "SCar.h"

/**
 内存泄漏：对象里可能还有该释放的对象没有释放
 */
void test() {
    SPerson *person1 = [[[SPerson alloc] init] autorelease];
    SPerson *person2 = [[[SPerson alloc] init] autorelease];
}

void test2() {
    SDog *dog = [[SDog alloc] init]; // dog: 1
    
    SPerson *p1 = [[SPerson alloc] init];
    [p1 setDog:dog]; // dog: 2
    
    SPerson *p2 = [[SPerson alloc] init];
    [p2 setDog:dog]; // dog: 3
    
    // 释放狗
    [dog release]; // dog: 2
    // 释放p1
    [p1 release]; // dog: 1
    // 狗跑了
    [[p2 dog] run];
    // 释放p2
    [p2 release]; // dog: 0
}

void test3() {
    SDog *dog1 = [[SDog alloc] init]; // dog1: 1
    SDog *dog2 = [[SDog alloc] init]; // dog2: 1
    
    SPerson *p1 = [[SPerson alloc] init];
    [p1 setDog:dog1]; // dog1: 2
    [p1 setDog:dog2]; // dog1: 1  // dog2: 2
    
    [dog1 release]; // dog1: 0  // dog2: 2
    [dog2 release]; // dog1: 0  // dog2: 1
    [p1 release]; // dog1: 0  // dog2: 0
}

void test4() {
    SDog *dog = [[SDog alloc] init]; // dog： 1
    
    SPerson *p = [[SPerson alloc] init];
    [p setDog:dog]; // dog： 2
    
    [dog release]; // dog： 1
    
    [p setDog:dog];
    [p setDog:dog];
    [p setDog:dog];
    [p setDog:dog];
    [p setDog:dog];
    
    [p release]; // dog： 0
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test2();
    }
    return 0;
}
