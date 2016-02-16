//
//  PresidentDetailController.h
//  Nav
//
//  Created by qiujian on 16/1/23.
//  Copyright © 2016年 qiujian. All rights reserved.
//
#define kNumberOfEditableRows       4
#define kNameRowIndex               0
#define kFromyearRowIndex           1
#define kToYearRowIndex             2
#define kPartyRowIndex              3

#define kLabelTag                   4096

#import <UIKit/UIKit.h>
@class President;


@interface PresidentDetailController : UITableViewController
<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate >

@property (nonatomic, retain)President* president;

@end
