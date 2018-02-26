//
//  IMPView.h
//  IMPProgressView
//
//  Created by Sureshkumar Linganathan on 14/07/16.
//

#import <UIKit/UIKit.h>

@interface IMPView : UIView

@property (strong, nonatomic) NSString *labelString;
@property (strong, nonatomic) NSString *detailString;

-(UIView*)initView;
-(void)show:(BOOL)enable;
-(void)setConstrainForView:(UIView*)view;

@end
