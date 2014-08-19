//
//  ViewController.m
//  SpriteAnimate
//
//  Created by darklinden on 14-8-14.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)animateTypeSegmentChange:(id)sender
{
    SKView * skView = (SKView *)self.view;
    MyScene * scene = (MyScene *)skView.scene;
    scene.animateType = (AnimateType)[(UISegmentedControl *)sender selectedSegmentIndex];
}

- (IBAction)heroTypeSegmentChange:(id)sender
{
    SKView * skView = (SKView *)self.view;
    MyScene * scene = (MyScene *)skView.scene;
    scene.heroType = (HeroType)[(UISegmentedControl *)sender selectedSegmentIndex];
}

@end
