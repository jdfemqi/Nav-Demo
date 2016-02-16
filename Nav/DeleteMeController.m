//
//  DeleteMeController.m
//  Nav
//
//  Created by qiujian on 16/1/21.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "DeleteMeController.h"


@interface DeleteMeController ()
@property (nonatomic, retain)NSMutableArray* list;
-(IBAction)toggleEdit:(id)sender;
@end

@implementation DeleteMeController

-(IBAction)toggleEdit:(id)sender
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"computers" ofType:@"plist"];
    
    NSMutableArray* array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    self.list = array;
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
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
    static NSString* DeleteMeCellIdentifier = @"DeleteMeCellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:DeleteMeCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DeleteMeCellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSString* rowText = [self.list objectAtIndex:row];
    cell.textLabel.text = rowText;
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    [self.list removeObjectAtIndex:row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
