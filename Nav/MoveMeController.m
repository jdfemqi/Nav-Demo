//
//  MoveMeController.m
//  Nav
//
//  Created by qiujian on 16/1/21.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "MoveMeController.h"


@interface MoveMeController ()
@property (nonatomic, retain)NSMutableArray* list;
-(IBAction)toggleMove;
@end

@implementation MoveMeController

-(IBAction)toggleMove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray* array = [[NSMutableArray alloc]initWithObjects:@"Eeny", @"Meeny", @"Miney", @"Moe", @"Catch", @"A", @"Tiger", @"By", @"The", @"Toe", nil];
    self.list = array;
    
    UIBarButtonItem* moveButton = [[UIBarButtonItem alloc]initWithTitle:@"Move" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleMove)];
    self.navigationItem.rightBarButtonItem = moveButton;
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* MoveMeCellIdentifier = @"MoveMeCellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:MoveMeCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MoveMeCellIdentifier];
        cell.showsReorderControl = YES;
    }
    
    NSUInteger row = [indexPath row];
    NSString* rowText = [self.list objectAtIndex:row];
    cell.textLabel.text = rowText;
    
    return cell;
}

// 定义移动属性
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSUInteger fromRow = [sourceIndexPath row];
    NSUInteger toRow = [destinationIndexPath row];
    
    id object = [self.list objectAtIndex:fromRow];
    [self.list removeObjectAtIndex:fromRow];
    [self.list insertObject:object atIndex:toRow];
}

@end
