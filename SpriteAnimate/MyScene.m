//
//  MyScene.m
//  SpriteAnimate
//
//  Created by darklinden on 14-8-14.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "MyScene.h"
#import "HeroAnimate.h"

@interface MyScene ()
@property (nonatomic, strong) SKSpriteNode  *character;
@property (nonatomic, assign) CGFloat       rotation;

@end

@implementation MyScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        _character = [SKSpriteNode node];
        _character.size = CGSizeMake(60, 60);
        _character.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:_character];
        
        [self animateStayWithAngle:0];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)character:(SKSpriteNode *)character
          animate:(NSArray *)imgs
         duration:(NSTimeInterval)duration
       completion:(void (^)())block
{
    [_character removeAllActions];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < imgs.count; i++) {
        SKTexture *tx = [SKTexture textureWithImageNamed:imgs[i]];
        [array addObject:tx];
    }
    
    if (duration) {
        SKAction *animate = [SKAction animateWithTextures:array timePerFrame:duration / imgs.count];
        [character runAction:animate completion:block];
    }
    else {
        SKAction *animate = [SKAction animateWithTextures:array timePerFrame:0.4 / imgs.count];
        SKAction *repeat = [SKAction repeatActionForever:animate];
        [character runAction:repeat completion:block];
    }
}

- (void)animateAttackWithAngle:(CGFloat)angle
{
    CGFloat degree = (angle > 0 ? angle : (2.f * M_PI + angle)) * 360.f / (2.f * M_PI);
    
    CGFloat piece = 360.f / 8.f;
    
    NSArray *animate = nil;
    
    //6
    if (degree >= 0 && degree < piece / 2.f) {
        animate = atk_6;
    }
    
    //4
    if (degree >= piece / 2.f && degree < 90.f - (piece / 2.f)) {
        animate = atk_4;
    }
    
    //3
    if (degree >= 90.f - (piece / 2.f) && degree < 90.f + (piece / 2.f)) {
        animate = atk_3;
    }
    
    //1
    if (degree >= 90.f + (piece / 2.f) && degree < 180.f - (piece / 2.f)) {
        animate = atk_1;
    }
    
    //12
    if (degree >= 180.f - (piece / 2.f) && degree < 180.f + (piece / 2.f)) {
        animate = atk_12;
    }
    
    //10
    if (degree >= 180.f + (piece / 2.f) && degree < 270.f - (piece / 2.f)) {
        animate = atk_10;
    }
    
    //9
    if (degree >= 270.f - (piece / 2.f) && degree < 270.f + (piece / 2.f)) {
        animate = atk_9;
    }
    
    //7
    if (degree >= 270.f + (piece / 2.f) && degree < 360.f - (piece / 2.f)) {
        animate = atk_7;
    }
    
    //6
    if (degree >= 360.f - (piece / 2.f) && degree <= 360.f) {
        animate = atk_6;
    }
    
    [self character:_character animate:animate duration:0 completion:nil];
}

- (void)animateRunWithAngle:(CGFloat)angle
{
    CGFloat degree = (angle > 0 ? angle : (2.f * M_PI + angle)) * 360.f / (2.f * M_PI);
    
    CGFloat piece = 360.f / 8.f;
    
    NSArray *animate = nil;
    
    //6
    if (degree >= 0 && degree < piece / 2.f) {
        animate = run_6;
    }
    
    //4
    if (degree >= piece / 2.f && degree < 90.f - (piece / 2.f)) {
        animate = run_4;
    }
    
    //3
    if (degree >= 90.f - (piece / 2.f) && degree < 90.f + (piece / 2.f)) {
        animate = run_3;
    }
    
    //1
    if (degree >= 90.f + (piece / 2.f) && degree < 180.f - (piece / 2.f)) {
        animate = run_1;
    }
    
    //12
    if (degree >= 180.f - (piece / 2.f) && degree < 180.f + (piece / 2.f)) {
        animate = run_12;
    }
    
    //10
    if (degree >= 180.f + (piece / 2.f) && degree < 270.f - (piece / 2.f)) {
        animate = run_10;
    }
    
    //9
    if (degree >= 270.f - (piece / 2.f) && degree < 270.f + (piece / 2.f)) {
        animate = run_9;
    }
    
    //7
    if (degree >= 270.f + (piece / 2.f) && degree < 360.f - (piece / 2.f)) {
        animate = run_7;
    }
    
    //6
    if (degree >= 360.f - (piece / 2.f) && degree <= 360.f) {
        animate = run_6;
    }
    
    [self character:_character animate:animate duration:0 completion:nil];
}

- (void)animateStayWithAngle:(CGFloat)angle
{
    CGFloat degree = (angle > 0 ? angle : (2.f * M_PI + angle)) * 360.f / (2.f * M_PI);
    
    CGFloat piece = 360.f / 8.f;
    
    NSArray *animate = nil;
    
    //6
    if (degree >= 0 && degree < piece / 2.f) {
        animate = stay_6;
    }
    
    //4
    if (degree >= piece / 2.f && degree < 90.f - (piece / 2.f)) {
        animate = stay_4;
    }
    
    //3
    if (degree >= 90.f - (piece / 2.f) && degree < 90.f + (piece / 2.f)) {
        animate = stay_3;
    }
    
    //1
    if (degree >= 90.f + (piece / 2.f) && degree < 180.f - (piece / 2.f)) {
        animate = stay_1;
    }
    
    //12
    if (degree >= 180.f - (piece / 2.f) && degree < 180.f + (piece / 2.f)) {
        animate = stay_12;
    }
    
    //10
    if (degree >= 180.f + (piece / 2.f) && degree < 270.f - (piece / 2.f)) {
        animate = stay_10;
    }
    
    //9
    if (degree >= 270.f - (piece / 2.f) && degree < 270.f + (piece / 2.f)) {
        animate = stay_9;
    }
    
    //7
    if (degree >= 270.f + (piece / 2.f) && degree < 360.f - (piece / 2.f)) {
        animate = stay_7;
    }
    
    //6
    if (degree >= 360.f - (piece / 2.f) && degree <= 360.f) {
        animate = stay_6;
    }
    
    [self character:_character animate:animate duration:0 completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInNode:self];
    
    CGPoint cp = [_character position];
    
    CGFloat x = 0.f, y = 0.f;
    x = p.x - cp.x;
    y = p.y - cp.y;
    
    CGFloat faceRotation = atan2f(x, -y);
    _rotation = faceRotation;
    
    switch (_type) {
        case AnimateTypeStay:
            [self animateStayWithAngle:faceRotation];
            break;
        case AnimateTypeRun:
            [self animateRunWithAngle:faceRotation];
            break;
        case AnimateTypeAtk:
            [self animateAttackWithAngle:faceRotation];
            break;
        default:
            break;
    }
}

- (void)setType:(AnimateType)type
{
    _type = type;
    
    switch (_type) {
        case AnimateTypeStay:
            [self animateStayWithAngle:_rotation];
            break;
        case AnimateTypeRun:
            [self animateRunWithAngle:_rotation];
            break;
        case AnimateTypeAtk:
            [self animateAttackWithAngle:_rotation];
            break;
        default:
            break;
    }
}

@end
