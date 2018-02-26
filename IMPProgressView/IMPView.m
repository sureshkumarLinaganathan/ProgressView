//
//  IMPView.m
//  IMPProgressView
//
//  Created by Sureshkumar Linganathan on 14/07/16.
//

#import "IMPView.h"

@interface IMPView ()

@property (strong, nonatomic) IMPView *progressView;
@property (strong, nonatomic) UILabel *labelText;
@property (strong, nonatomic) UILabel *detailText;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@end

@implementation IMPView

-(UIView*)initView
{
   self= [[IMPView alloc]init];
   self.layer.cornerRadius = 10;
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [self addActivityIndicator];
    [self addLabelsForView];
    [self setHidden:YES];
    return self;
}

-(void)addActivityIndicator
{
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(65.0, 30.0, 20, 20)];
    [self addSubview:self.activityIndicator];
}

-(void)addLabelsForView
{
    self.labelText = [[UILabel alloc]initWithFrame:CGRectMake(5, 60,140 , 20)];
    self.labelText.textColor = [UIColor whiteColor];
    self.labelText.textAlignment = NSTextAlignmentCenter;
    self.labelText.numberOfLines = 1;
    self.labelText.backgroundColor = [UIColor clearColor];
    self.labelText.font = [UIFont fontWithName:@"Avenir-Book" size:15.0];
    [self addSubview:self.labelText];
    self.detailText = [[UILabel alloc]initWithFrame:CGRectMake(5, 85, 140, 20)];
    self.detailText.textColor = [UIColor whiteColor];
    self.detailText.textAlignment = NSTextAlignmentCenter;
    self.detailText.numberOfLines = 1;
    self.detailText.backgroundColor = [UIColor clearColor];
    [self addSubview:self.detailText];
    self.detailText.font = [UIFont fontWithName:@"Avenir-Book" size:14.0];
}

-(void)show:(BOOL)enable
{
    if(enable)
    {
        [self setHidden:NO];
        [self.activityIndicator startAnimating];
        [self.superview setUserInteractionEnabled:NO];
    }
    else
    {
        [self setHidden:YES];
        [self.activityIndicator stopAnimating];
        [self.superview setUserInteractionEnabled:YES];
    }
}

-(void)setLabelString:(NSString *)labelString
{
    _labelText.text = labelString;
}

-(void)setDetailString:(NSString *)detailString
{
    _detailText.text = detailString;
}

-(void)setConstrainForView:(UIView*)view
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centeXConstraint = [NSLayoutConstraint constraintWithItem:self attribute: NSLayoutAttributeCenterX relatedBy: NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute: NSLayoutAttributeCenterY relatedBy: NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute: NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:120];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:  NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];
    [view addConstraint:centeXConstraint];
    [view addConstraint:centerYConstraint];
    [view addConstraint:heightConstraint];
    [view addConstraint:widthConstraint];
    [view layoutIfNeeded];
    
}

@end
