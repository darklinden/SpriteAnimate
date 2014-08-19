//
//  Hero.h
//  SpriteAnimate
//
//  Created by darklinden on 14-8-19.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, AnimateType) {
    AnimateTypeStay = 0,
    AnimateTypeRun = 1,
    AnimateTypeAtk = 2
};

typedef NS_ENUM(NSUInteger, HeroType) {
    HeroTypeEightDirection = 0,
    HeroTypeFaceDirection = 1
};

typedef NS_ENUM(NSUInteger, EightDirection) {
    EightDirectionUp = 12,
    EightDirectionUpRight = 1,
    EightDirectionRight = 3,
    EightDirectionDownRight = 4,
    EightDirectionDown = 6,
    EightDirectionDownLeft = 7,
    EightDirectionLeft = 9,
    EightDirectionUpLeft = 10
};

@interface Hero : SKSpriteNode
@property (nonatomic, assign) HeroType      heroType;
@property (nonatomic, assign) AnimateType   animateType;
@property (nonatomic, assign) CGFloat       angle;

+ (Hero *)hero;
- (CGFloat)angleToPoint:(CGPoint)point;
- (void)hero:(HeroType)heroType animate:(AnimateType)animateType angle:(CGFloat)angle;

@end
