//
//  ViewController.m
//  IMPProgressView
//
//  Created by Sureshkumar Linganathan on 13/07/16.
//

#import "ViewController.h"
#import "IMPProgressView.h"
#import "IMPView.h"

@interface ViewController ()

@property (strong, nonatomic)IMPProgressView *loadingView;
@property (strong, nonatomic)IMPView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setupProgressView];
    [self setupProgressViewWithXIB];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}


-(void)setupProgressView{
    
    self.progressView = [[IMPView alloc]initView];
    self.progressView.labelString = @"Authenticating ...";
    self.progressView.detailString = @"Please wait";
    [self.view addSubview:self.progressView];
    [self.progressView setConstrainForView:self.view];
    [self.progressView show:YES];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //[self.progressView show:NO];
    }) ;
}

-(void)setupProgressViewWithXIB{
    
    self.loadingView = [[IMPProgressView alloc]initView:self.view];
    self.loadingView.labelString = @"Authenticating ...";
    self.loadingView.detailString = @"Please wait";
    [self.view addSubview:self.loadingView];
    [self.loadingView showView:self.view];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //[self.loadingView hide];
    }) ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
