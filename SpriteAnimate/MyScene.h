//
//  MyScene.h
//  SpriteAnimate
//

//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, AnimateType) {
    AnimateTypeStay = 0,
    AnimateTypeRun = 1,
    AnimateTypeAtk = 2
};

@interface MyScene : SKScene

@property (nonatomic, assign) AnimateType type;

@end
