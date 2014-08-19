//
//  MyScene.h
//  SpriteAnimate
//

//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Hero.h"


@interface MyScene : SKScene

@property (nonatomic, assign) HeroType      heroType;
@property (nonatomic, assign) AnimateType   animateType;

@end
