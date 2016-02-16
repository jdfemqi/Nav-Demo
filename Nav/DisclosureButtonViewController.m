////
//  DisclosureButtonViewController.m
//  Nav
//
//  Created by qiujian on 16/1/18.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "DisclosureButtonViewController.h"
#import "DisclosureDetailViewController.h"

@interface DisclosureButtonViewController ()
@property  (nonatomic, retain)NSArray* list;
@end

@implementation DisclosureButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* array = [[NSArray alloc]initWithObjects:@"Toy Story", @"A Bug's List", @"Toy Story 2", @"Monsters, Inc.", @"Finding Nemo", @"The Incredibles", @"Cars", @"Ratatouille", @"WALL-E", @"Up", nil];
    
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
    static NSString* DisclosureButtonCellIdentifier = @"DisclosureButtonCellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:DisclosureButtonCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DisclosureButtonCellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSString* rowString = [self.list objectAtIndex:row];
    cell.textLabel.text = rowString;
    // 扩展图标
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hey, do you see the disclosure btton?" message:@"If you're trying to drill down, touch that instead" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Won't happen again" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){}];
    
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(nonnull NSIndexPath *)indexPath

{
    NSString* strIdentifier = @"DisclosureDetail";
    if (childController == nil) {
        
        UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        childController = [mainStoryboard instantiateViewControllerWithIdentifier:strIdentifier];
    }
    
    if (childController == nil) {
        return;
    }
    childController.title = @"Disclosure Button Pressed";
    NSUInteger row = [indexPath row];
    
    NSString* selectedMovie = [self.list objectAtIndex:row];
    NSString* detailMessage = [[NSString alloc]initWithFormat:@"You pressed the disclosure button for %@.", selectedMovie];
    
    childController.title = selectedMovie;
    childController.message = detailMessage;
    
    [self.navigationController pushViewController:childController animated:YES];
}
@end
