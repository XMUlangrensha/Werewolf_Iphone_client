//
//  IDCardView.h
//  Werewolf
//
//  Created by mac on 13-10-25.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDCardView : UIView


- (id) initWithPrimaryView: (UIView *) view1 andSecondaryView: (UIView *) view2 inFrame: (CGRect) frame;

@property (nonatomic, retain) UIView *primaryView;
@property (nonatomic, retain) UIView *secondaryView;
@property float spinTime;

@end
