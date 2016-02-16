//
//  DisclosureButtonViewController.h
//  Nav
//
//  Created by qiujian on 16/1/18.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"   
@class DisclosureDetailViewController;

@interface DisclosureButtonViewController : SecondLevelViewController
<UITableViewDelegate, UITableViewDataSource>
{
    DisclosureDetailViewController* childController;
}

@end
