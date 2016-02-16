//
//  RowControlsViewController.m
//  Nav
//
//  Created by qiujian on 16/1/21.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "RowControlsViewController.h"

#define kSwitchTag 100

@interface RowControlsViewController ()
@property (nonatomic, retain)NSArray* list;
@end

@implementation RowControlsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* array = [[NSArray alloc]initWithObjects:@"R2-D2", @"C3PO", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblab", @"Bender", @"Marvin", @"Lt. Commander Data", @"Evil Brother Lore", @"Optimus Prime", @"Tobor", @"HAL", @"Orgasmatron", nil];
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
    static NSString* ControlRowIdentifier = @"ControlRowIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ControlRowIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ControlRowIdentifier];
        
        // 开关控件
        UISwitch* switchView = [[UISwitch alloc]init];
        switchView.tag = kSwitchTag;
        cell.accessoryView = switchView;
    }
    
    NSUInteger row = [indexPath row];
    NSString* rowText = [self.list objectAtIndex:row];
    cell.textLabel.text = rowText;
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UISwitch* switchView = (UISwitch*)[cell viewWithTag:kSwitchTag];
    
    NSString* baseString = @"%@ %@.";
    NSString* onString = (switchView.on) ? @"IS on" : @"IS NOT on";
    
    NSString* robot = [self.list objectAtIndex:row];
    NSString* messageString = [[NSString alloc]initWithFormat:baseString, robot, onString];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Row Selected." message:messageString preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Thanks!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){}];
    
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
