//
//  IMPProgressView.h
//  IMPProgressView
//
//  Created by Sureshkumar Linganathan on 13/07/16.
//

#import <UIKit/UIKit.h>

@interface IMPProgressView : UIView

@property (nonatomic, strong)NSString *labelString;
@property (nonatomic, strong)NSString *detailString;
-(IMPProgressView*)initView:(UIView*)view;
-(void)showView:(UIView*)view;
-(void)hide;


@end
