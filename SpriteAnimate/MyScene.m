//
//  MyScene.m
//  SpriteAnimate
//
//  Created by darklinden on 14-8-14.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "MyScene.h"
#import "Hero.h"

@interface MyScene ()
@property (nonatomic, strong) Hero      *hero;

@end

@implementation MyScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        _hero = [Hero hero];
        _hero.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:_hero];
        
        [_hero hero:0 animate:0 angle:0];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInNode:self];
    
    CGFloat faceRotation = [_hero angleToPoint:p];
    _hero.angle = faceRotation;
}

- (AnimateType)animateType
{
    return _hero.animateType;
}

- (void)setAnimateType:(AnimateType)animateType
{
    _hero.animateType = animateType;
}

- (HeroType)heroType
{
    return _hero.heroType;
}

- (void)setHeroType:(HeroType)heroType
{
    _hero.heroType = heroType;
}

@end
