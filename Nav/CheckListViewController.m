//
//  CheckListViewController.m
//  Nav
//
//  Created by qiujian on 16/1/21.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "CheckListViewController.h"

@interface CheckListViewController ()
@property (nonatomic, retain)NSIndexPath* lastIndexPath;
@property (nonatomic, retain)NSArray* list;
@end

@implementation CheckListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* array = [[NSArray alloc]initWithObjects:@"Who Hash", @"Bubba Gump Shrimp Etouffee", @"Who pudding", @"Scooby Snacks", @"Everlasting Gobstopper", @"Green Eggs and Ham", @"Soylent Green", @"Hard Tack", @"Lembas Bread", @"Roast Beast", @"Blancmange", nil];
    self.list = array;
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
    static NSString* CheckMarkCellIdentifier = @"CheckMarkCellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CheckMarkCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CheckMarkCellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSUInteger oldrow = [self.lastIndexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    cell.accessoryType = (row == oldrow && self.lastIndexPath != nil)? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    int newRow = [indexPath row];
    int oldRow = [self.lastIndexPath row];
    
    if (newRow != oldRow) {
        UITableViewCell* newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell* oldCell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        self.lastIndexPath = indexPath;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
