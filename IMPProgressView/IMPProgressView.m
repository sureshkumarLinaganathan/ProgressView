//
//  IMPProgressView.m
//  IMPProgressView
//
//  Created by Sureshkumar Linganathan on 13/07/16.
//

#import "IMPProgressView.h"

@interface IMPProgressView ()

@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UILabel *detailText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) UIView *view;

@end

@implementation IMPProgressView

-(IMPProgressView*)initView:(UIView*)view
{
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"ProgressView" owner:nil options:nil];
    IMPProgressView *progressView = [views objectAtIndex:0];
    progressView.layer.cornerRadius = 10.0;
    [progressView.activityIndicator startAnimating];
    return progressView;
}

-(void)showView:(UIView*)view
{
    [view addSubview:self];
    [self setConstrainForView:view setView:self];
    [view setUserInteractionEnabled:NO];
    
}

-(void)setLabelString:(NSString *)labelString
{
    _labelText.text = labelString;
}

-(void)setDetailString:(NSString *)detailString
{
    _detailText.text = detailString;
}

-(void)hide
{
    [self.activityIndicator stopAnimating];
    [self.superview setUserInteractionEnabled:YES];
    [self removeFromSuperview];
}


-(void)setConstrainForView:(UIView*)view setView:(IMPProgressView*)progressView
{
    [progressView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centeXConstraint = [NSLayoutConstraint constraintWithItem:progressView attribute: NSLayoutAttributeCenterX relatedBy: NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:progressView attribute: NSLayoutAttributeCenterY relatedBy: NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:progressView attribute: NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:120];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:progressView attribute:  NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];
    [view addConstraint:centeXConstraint];
    [view addConstraint:centerYConstraint];
    [view addConstraint:heightConstraint];
    [view addConstraint:widthConstraint];
    [view layoutIfNeeded];
    
}


@end
