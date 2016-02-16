//
//  RootViewController.m
//  Nav
//
//  Created by qiujian on 16/1/18.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "RootViewController.h"
#import "SecondLevelViewController.h"
#import "DisclosureButtonViewController.h"
#import "CheckListViewController.h"
#import "RowControlsViewController.h"
#import "MoveMeController.h"
#import "DeleteMeController.h"
#import "PresidentViewController.h"

@interface RootViewController ()
@property (nonatomic, retain)NSArray* controllers;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Root Level";
    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    
    //  Disclosure Button
    DisclosureButtonViewController* disclosureButtonController = [[DisclosureButtonViewController alloc ]initWithStyle:UITableViewStylePlain];
    
    disclosureButtonController.title = @"Disclosure Buttons";
    disclosureButtonController.rowImage = [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
    
    [array addObject:disclosureButtonController];
    
    // Check List
    CheckListViewController* checkListController = [[CheckListViewController alloc]initWithStyle:UITableViewStylePlain];
    checkListController.title = @"Check One";
    checkListController.rowImage = [UIImage imageNamed:@"checkmarkControllerIcon.png"];
    [array addObject:checkListController];
    
    // Table Row Controls
    RowControlsViewController* rowControlsController = [[RowControlsViewController alloc]initWithStyle:UITableViewStylePlain];
    rowControlsController.title = @"Row Controls";
    rowControlsController.rowImage = [UIImage imageNamed:@"rowControlsIcon.png"];
    [array addObject:rowControlsController];
    
    // Move Me
    MoveMeController* moveMeController = [[MoveMeController alloc]initWithStyle:UITableViewStylePlain];
    moveMeController.title = @"Row Controls";
    moveMeController.rowImage = [UIImage imageNamed:@"moveMeIcon.png"];
    [array addObject:moveMeController];
    
    // Delete Me
    DeleteMeController* deleteMeController = [[DeleteMeController alloc]initWithStyle:UITableViewStylePlain];
    deleteMeController.title = @"Delete Me";
    deleteMeController.rowImage = [UIImage imageNamed:@"deleteMeIcon.png"];
    [array addObject:deleteMeController];
    
    // President View/Edit
    PresidentViewController* presidentsViewController = [[PresidentViewController alloc]initWithStyle:UITableViewStylePlain];
    presidentsViewController.title = @"Detail Edit";
    presidentsViewController.rowImage = [UIImage imageNamed:@"detailEditIcon.png"];
    [array addObject:presidentsViewController];

    
    self.controllers = array;
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

#pragma mark - 
#pragma mark Table Data Source Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.controllers count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* RootViewControllerCell = @"RootViewControllerCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:RootViewControllerCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RootViewControllerCell];
    }
    
    // Configure the cell
    NSUInteger row = [indexPath row];
    SecondLevelViewController* controller = [self.controllers objectAtIndex:row];
    
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - 
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    SecondLevelViewController* nextController = [self.controllers objectAtIndex:row];
    
    [self.navigationController pushViewController:nextController animated:YES];
}
@end
