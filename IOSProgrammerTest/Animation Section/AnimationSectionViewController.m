//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>



@interface AnimationSectionViewController ()
    {
        AVAudioPlayer *_audioPlayer;
    }

@property (nonatomic, strong) IBOutlet UIImageView* icon;
@property (weak, nonatomic) IBOutlet UIImageView *imgTest;




@end

@implementation AnimationSectionViewController



CGPoint firstTouchPoint;
float xd;
float yd;
int total = 0;



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* bTouch = [touches anyObject];
    if ([bTouch.view isEqual:[self imgTest]]) {
        firstTouchPoint = [bTouch locationInView:[self view]];
        xd = firstTouchPoint.x - [[bTouch view]center].x;
        yd = firstTouchPoint.y - [[bTouch view]center].y;
    }
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* mTouch = [touches anyObject];
    if (mTouch.view == [self imgTest]) {
        CGPoint cp = [mTouch locationInView:[self view]];
        [[mTouch view]setCenter:CGPointMake(cp.x-xd, cp.y-yd)];
    }
}


- (void)viewDidLoad
{
    [[self imgTest]setUserInteractionEnabled:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)spin:(id)sender {
    
    printf("%i\n",total);
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = 1; // Repeat forever. Can be a finite number.
    [_icon.layer addAnimation:rotation forKey:@"Spin"];
    
    total += rotation.repeatCount;
    
    
    //UIImageView *animationImageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 170, 86, 193)];
    
    NSArray *imageNames = @[@"Screen Shot 2016-12-10 at 5.32.26 PM.png",
                            @"Screen Shot 2016-12-10 at 5.32.37 PM.png",
                            @"Screen Shot 2016-12-10 at 5.32.42 PM.png",
                            @"Screen Shot 2016-12-10 at 5.32.46 PM.png",
                            @"Screen Shot 2016-12-10 at 5.32.51 PM.png",
                            @"Screen Shot 2016-12-10 at 5.33.26 PM.png",
                            @"Screen Shot 2016-12-10 at 5.33.32 PM.png",
                            @"Screen Shot 2016-12-10 at 5.33.36 PM.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    

    // Normal Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 170, 86, 193)];
    
    
    
    
    if (total == 2){
        
        
        NSString *path = [NSString stringWithFormat:@"%@/Explosion+3.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        
        [_audioPlayer play];
        
        _icon.image = nil;
        
        
     UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    animatedImageView.animationImages = [NSArray arrayWithObjects:
                                            [UIImage imageNamed:@"Exp.png"],
                                            [UIImage imageNamed:@"Explosion.png"],
                                            [UIImage imageNamed:@"Explosion-2.png"],
                                            [UIImage imageNamed:@"Explosion-3.png"],
                                            [UIImage imageNamed:@"Explosion-4.png"],
                                            [UIImage imageNamed:@"Explosion-5.png"],
                                            [UIImage imageNamed:@"Explosion-6.png"],
                                            [UIImage imageNamed:@"Explosion-7.png"],
                                            [UIImage imageNamed:@"Explosion-8.png"],
                                            [UIImage imageNamed:@"Explosion-9.png"],nil];
        
        animatedImageView.animationDuration = 1.5f;
        animatedImageView.animationRepeatCount = 1;
        [animatedImageView startAnimating];
        [self.view addSubview: animatedImageView];
    }
    
    if (total == 3){
        
        
        NSString *path = [NSString stringWithFormat:@"%@/psy_gangnamstyle_[mp3.take.az].mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        
        [_audioPlayer play];
        
        animationImageView.animationImages = images;
        animationImageView.animationDuration = 0.5;
    
        [self.view addSubview:animationImageView];
        [animationImageView startAnimating];
    }
    
    
    if (total == 4){
        
        animationImageView.animationImages = nil;
        
        NSString *path = [NSString stringWithFormat:@"%@/teenagedream.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        
        [_audioPlayer play];

        
        UIImageView* animatedImageView_2 = [[UIImageView alloc] initWithFrame:self.view.bounds];
        animatedImageView_2.animationImages = [NSArray arrayWithObjects:
                                               [UIImage imageNamed:@"rcmk26f-1 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-2 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-3 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-4 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-5 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-6 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-7 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-8 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-9 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-10 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-11(dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-12 (dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-13(dragged).tiff"],
                                               [UIImage imageNamed:@"rcmk26f-14 (dragged).tiff"],nil];
        
        UIImageView* animatedImageView_3 = [[UIImageView alloc] initWithFrame:self.view.bounds];
        animatedImageView_3.animationImages = [NSArray arrayWithObjects:
                                               [UIImage imageNamed:@"giphy-1 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-2 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-3 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-4 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-5 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-6 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-7 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-8 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-9 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-10 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-11 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-12 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-13 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-14 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-15 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-16 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-17 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-18 (dragged).tiff"],
                                               [UIImage imageNamed:@"giphy-19 (dragged).tiff"], nil];
        
                                               
        
        
        
        animatedImageView_2.animationDuration = 1.0f;
        animatedImageView_2.animationRepeatCount = 0;
        [animatedImageView_2 startAnimating];
        [self.view addSubview: animatedImageView_2];
        
        animatedImageView_3.animationDuration = 2.0f;
        animatedImageView_3.animationRepeatCount = 10;
        [animatedImageView_3 startAnimating];
        [self.view addSubview: animatedImageView_3];
    }
    
    
    
}




@end
