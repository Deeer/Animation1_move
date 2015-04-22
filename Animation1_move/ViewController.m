//
//  ViewController.m
//  Animation1_move
//
//  Created by Dee on 15/4/22.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "ViewController.h"
#define  m_Winwidth self.view.bounds.size.width
#define  m_Winheight self.view.bounds.size.height
@interface ViewController ()
@property (nonatomic,strong)CALayer *myLayer;
@property (nonatomic,strong)CALayer *imageLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.layer.backgroundColor = [UIColor orangeColor].CGColor;
    self.view.layer.cornerRadius = 30; //每个view都会有个Layer
    
    

    CALayer *subLayer = [CALayer layer];
    subLayer.backgroundColor = [UIColor purpleColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(0, 3);
    subLayer.shadowRadius = 5.0;
    subLayer.shadowColor = [UIColor blackColor].CGColor;
    subLayer.shadowOpacity =.8;
    subLayer.frame = CGRectMake(30, 30, 128, 192);
    [self.view.layer addSublayer:subLayer];
    
    
    CALayer *subLayer1 = [CALayer layer];
    subLayer1.backgroundColor = [UIColor purpleColor].CGColor;
    subLayer1.shadowOffset = CGSizeMake(0, 3);
    subLayer1.shadowRadius = 5.0;
    subLayer1.shadowColor = [UIColor blackColor].CGColor;
    subLayer1.shadowOpacity =.8;
    subLayer1.frame = CGRectMake(40, 40, 128, 192);
    [self.view.layer addSublayer:subLayer1];

    /*
     
     CALayer *myLayer =[CALayer layer];
     
     myLayer.bounds = CGRectMake(0,0, m_Winwidth, m_Winheight);
     
     myLayer.backgroundColor= [UIColor orangeColor].CGColor;
     
     myLayer.position =CGPointMake(30, 30);
     
     myLayer.cornerRadius = 20;
     
     [self.view.layer addSublayer:myLayer];
     
    
//    CALayer*imglayer = [CALayer layer];
//    imglayer.frame = subLayer.bounds;
//    imglayer.cornerRadius = 10.0;
//    imglayer.contents = (id)[UIImage imageNamed:@"asd.jpeg"].CGImage;
//    imglayer.masksToBounds = YES;
//    [subLayer addSublayer:imglayer];
    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"position.x";
//    animation.fromValue = @77;
//    animation.toValue = @455;
//    animation.duration = 1;
//    [imglayer addAnimation:animation forKey:@"basic"];
//    imglayer.position = CGPointMake(455, 61);
*/
    
#pragma mark--CABasicAnimation CAKeyframeAnimation是对图层中的不同属性进行动画的 ，如果要多个图层进行动画就是用CATransitionAnimation
    
 
    
#pragma mark --单步动画
    
#pragma mark --颜色
    //颜色动画
    CABasicAnimation *animate2 =[CABasicAnimation  animation];
    animate2.toValue =(id)[UIColor blueColor].CGColor;
    animate2.duration =1.0;
    animate2.autoreverses = NO;//是否返回原来状态
    [subLayer addAnimation:animate2 forKey:@"backgroundColor"];//将animation添加到图层中，就可以播放动画了。forKey指定要应用此动画的属性
   
    
    
    
    
    //<颜色保持在最终状态>
    
    
#pragma mark --移动
    CABasicAnimation * animation  = [CABasicAnimation animation];
    
    //animation.keyPath = @"position.x";
    //从55移动到77---移动属性
    //animation.toValue = @55;
    //animation.fromValue = @77;
    //byValue --移动了44
    
    animation.byValue = @44;
    animation.duration = 1;
    animation.removedOnCompletion =NO;
    
    //留在最终状态的方案
    //方案一
    // animation.fillMode =kCAFillModeForwards;
    
    //方案二
    //subLayer.position  =CGPointMake(55, 61);
    
    
    //为图层添加动画
//    [subLayer addAnimation:animation forKey:@"position.x"];
    
    //一旦动画完成，persentLayer会回到model Layer设置的值,所以在以下这步进行model Layer的值，使其保持现有状态
    
//    animation.beginTime = CACurrentMediaTime() +0.5;
//    
//    [subLayer1 addAnimation:animation forKey:@"position.x"];

#pragma mark --- 总结：移动动画 1>创建动画对象 2>设置移动路径：（1）from --to、（2）byValue 3>设置动画时间 4>为图层添加动画
    
    

    
#pragma mark --多步动画
    
    
    CAKeyframeAnimation * animation2 = [CAKeyframeAnimation animation];
    animation2.keyPath = @"position.x";
    animation2.values = @[@0,@100,@-100,@100,@0];//这个数组定义了具体的位置
    animation2.keyTimes = @[@0,@(1/6.0),@(3/6.0),@(5/6.0),@1];//指定了关键帧发生的时间，取值[0-1],
    animation2.duration =1;//发生的总时间
    animation2.additive = YES;//设置这个值为true使core animation 在更新前presentation layer 之前将动画的值添加到modellayer中，
//    [subLayer addAnimation:animation2 forKey:@"shake"];
    
    
#pragma mark --沿路径的动画
    
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);//创建一个矩形框
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];//创建帧动画
    orbit.keyPath =@"position";//
    orbit.path =CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));//CGPathCreateWithEllipseInRect:用传入的矩形来绘制圆形，圆内切于整个矩形中，
    orbit.duration = 60;//动画执行时间
    orbit.additive = YES;//动画被设置成相对的
    orbit.repeatCount =HUGE_VALF;//重复次数,默认是0，一直转
    orbit.calculationMode = kCAAnimationCubicPaced;
    orbit.rotationMode  =  kCAAnimationRotateAuto;
    [subLayer addAnimation:orbit forKey:@"orbit"];
    
    
    
    
    

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
}

@end
