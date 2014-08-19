//
//  Hero.m
//  SpriteAnimate
//
//  Created by darklinden on 14-8-19.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "Hero.h"
#import "HeroAnimate.h"

@implementation Hero

+ (Hero *)hero
{
    Hero *_hero = [Hero node];
    _hero.size = CGSizeMake(60, 60);
    
//    [self animateStayWithAngle:0];
    return _hero;
}

- (void)animate:(NSArray *)imgs
         duration:(NSTimeInterval)duration
       completion:(void (^)())block
{
    [self removeAllActions];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < imgs.count; i++) {
        SKTexture *tx = [SKTexture textureWithImageNamed:imgs[i]];
        [array addObject:tx];
    }
    
    if (duration) {
        SKAction *animate = [SKAction animateWithTextures:array timePerFrame:duration / imgs.count];
        [self runAction:animate completion:block];
    }
    else {
        SKAction *animate = [SKAction animateWithTextures:array timePerFrame:0.6 / imgs.count];
        SKAction *repeat = [SKAction repeatActionForever:animate];
        [self runAction:repeat completion:block];
    }
}

- (EightDirection)directionTypeFromAngle:(CGFloat)angle
{
    CGFloat degree = (angle > 0 ? angle : (2.f * M_PI + angle)) * 360.f / (2.f * M_PI);
    
    CGFloat piece = 360.f / 8.f;
    
    //6
    if (degree >= 0 && degree < piece / 2.f) {
        return EightDirectionDown;
    }
    
    //4
    if (degree >= piece / 2.f && degree < 90.f - (piece / 2.f)) {
        return EightDirectionDownRight;
    }
    
    //3
    if (degree >= 90.f - (piece / 2.f) && degree < 90.f + (piece / 2.f)) {
        return EightDirectionRight;
    }
    
    //1
    if (degree >= 90.f + (piece / 2.f) && degree < 180.f - (piece / 2.f)) {
        return EightDirectionUpRight;
    }
    
    //12
    if (degree >= 180.f - (piece / 2.f) && degree < 180.f + (piece / 2.f)) {
        return EightDirectionUp;
    }
    
    //10
    if (degree >= 180.f + (piece / 2.f) && degree < 270.f - (piece / 2.f)) {
        return EightDirectionUpLeft;
    }
    
    //9
    if (degree >= 270.f - (piece / 2.f) && degree < 270.f + (piece / 2.f)) {
        return EightDirectionLeft;
    }
    
    //7
    if (degree >= 270.f + (piece / 2.f) && degree < 360.f - (piece / 2.f)) {
        return EightDirectionDownLeft;
    }
    
    //6
    if (degree >= 360.f - (piece / 2.f) && degree <= 360.f) {
        return EightDirectionDown;
    }
    
    return EightDirectionDown;
}

- (CGFloat)angleToPoint:(CGPoint)point
{
    CGPoint spoint = [self position];
    
    CGFloat x = 0.f, y = 0.f;
    x = point.x - spoint.x;
    y = point.y - spoint.y;
    
    CGFloat faceRotation = atan2f(x, -y);
    return faceRotation;
}

- (void)hero:(HeroType)heroType animate:(AnimateType)animateType angle:(CGFloat)angle
{
    _heroType = heroType;
    _animateType = animateType;
    _angle = angle;
    
    switch (heroType) {
        case HeroTypeEightDirection:
        {
            EightDirection dr = [self directionTypeFromAngle:angle];
            NSArray *animate = nil;
            
            switch (animateType) {
                case AnimateTypeAtk:
                    animate = atk[@(dr)];
                    break;
                case AnimateTypeRun:
                    animate = run[@(dr)];
                    break;
                case AnimateTypeStay:
                    animate = run[@(dr)];
                    break;
                default:
                    break;
            }
            
            if (animate) {
                [self animate:animate duration:0 completion:nil];
            }
        }
            break;
        case HeroTypeFaceDirection:
        {
            NSArray *animate = nil;
            
            switch (animateType) {
                case AnimateTypeAtk:
                    animate = atk_direction;
                    break;
                case AnimateTypeRun:
                    animate = run_direction;
                    break;
                case AnimateTypeStay:
//                    animate = run[@(dr)];
                    animate = run_direction;
                    break;
                default:
                    break;
            }
            
            if (animate) {
                [self animate:animate duration:0 completion:nil];
                self.zRotation = angle;
            }
        }
            break;
        default:
            break;
    }
}

- (void)setHeroType:(HeroType)heroType
{
    _heroType = heroType;
    [self hero:_heroType animate:_animateType angle:_angle];
}

- (void)setAnimateType:(AnimateType)animateType
{
    _animateType = animateType;
    [self hero:_heroType animate:_animateType angle:_angle];
}

- (void)setAngle:(CGFloat)angle
{
    _angle = angle;
    [self hero:_heroType animate:_animateType angle:_angle];
}

@end
