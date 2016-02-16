//
//  PresidentViewController.m
//  Nav
//
//  Created by qiujian on 16/1/21.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "PresidentViewController.h"
#import "PresidentDetailController.h"
#import "President.h"


@interface PresidentViewController ()
@property (nonatomic, retain)NSMutableArray* list;
@end

@implementation PresidentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"Presidents" ofType:@"plist"];
    
    NSData* data;
    NSKeyedUnarchiver* unarchiver;
    data = [[NSData alloc]initWithContentsOfFile:path];
    unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    NSMutableArray* array = [unarchiver decodeObjectForKey:@"Presidents"];
    self.list = array;
    
    [unarchiver finishDecoding];
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
    static NSString* PresidentListCellIdentifier = @"PresidentListCellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:PresidentListCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PresidentListCellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    President* thePres = [self.list objectAtIndex:row];
    cell.textLabel.text = thePres.name;
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    President* presz = [self.list objectAtIndex:row];
    
    PresidentDetailController* childController = [[PresidentDetailController alloc]initWithStyle:UITableViewStyleGrouped];
    
    childController.title = presz.name;
    childController.president = presz;
    
    [self.navigationController pushViewController:childController animated:YES];
}

@end
