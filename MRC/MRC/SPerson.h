//
//  SPerson.h
//  MRC
//
//  Created by Sun on 2020/2/4.
//  Copyright © 2020 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDog.h"
#import "SCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPerson : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, retain) SDog *dog;
@property (nonatomic, retain) SCar *car;

+ (instancetype)person;

@end

NS_ASSUME_NONNULL_END
