//
//  DisclosureDetailViewController.m
//  Nav
//
//  Created by qiujian on 16/1/18.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "DisclosureDetailViewController.h"

@interface DisclosureDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DisclosureDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.label.text = self.message;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
