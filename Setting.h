//
//  Setting.h
//  Werewolf
//
//  Created by mac on 13-11-11.
//  Copyright (c) 2013年 xmucocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Setting : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameBox;
- (IBAction)hideKeyBoard:(id)sender;

@end
