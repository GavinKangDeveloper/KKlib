//
//  KKViewController.m
//  KKLib
//
//  Created by GavinKangDeveloper on 09/08/2020.
//  Copyright (c) 2020 GavinKangDeveloper. All rights reserved.
//

#import "KKViewController.h"
#import "UIView+Tools.h"

@interface KKViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *topBtn;

@end

@implementation KKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.topBtn km_cornerByRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
//                               cornerRadius:20.0];
//    [self.topView km_cornerWithOvalInRect:self.topView.bounds];
    
    [self.topBtn kk_addGradientLayerWithStartColor:[UIColor redColor]
                                          endColor:[UIColor greenColor]];
    
    [self.topView kk_addGradientLayerWithStartColor:[UIColor redColor]
                                           endColor:[UIColor greenColor]];
}

@end
