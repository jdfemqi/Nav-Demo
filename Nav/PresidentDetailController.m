//
//  PresidentDetailController.m
//  Nav
//
//  Created by qiujian on 16/1/23.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "PresidentDetailController.h"
#import "President.h"

@interface PresidentDetailController ()
@property (nonatomic, retain)NSArray* fieldLabels;
@property (nonatomic, retain)NSMutableDictionary* tempValues;
@property (nonatomic, retain)UITextField* textFieldBeingEdited;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)textFieldDone:(id)sender;
@end

@implementation PresidentDetailController
//@synthesize president;

#pragma mark - 
-(IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)save:(id)sender
{
    if (self.textFieldBeingEdited != nil) {
        NSNumber* tagAsNum = [[NSNumber alloc]initWithInt:self.textFieldBeingEdited.tag];
        
        [self.tempValues setObject:self.textFieldBeingEdited.text forKey:tagAsNum];
    }
    
    for (NSNumber* key in [self.tempValues allKeys]) {
        switch ([key intValue]) {
            case kNameRowIndex:
                self.president.name = [self.tempValues objectForKey:key];
                break;
                
            case kFromyearRowIndex:
                self.president.fromYear = [self.tempValues objectForKey:key];
                break;
                
            case kToYearRowIndex:
                self.president.toYear = [self.tempValues objectForKey:key];
                break;
                
            case kPartyRowIndex:
                self.president.party = [self.tempValues objectForKey:key];
                break;
                
            default:
                break;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSArray* allControllers = self.navigationController.viewControllers;
    UITableViewController* parent = [allControllers lastObject];
    [parent.tableView reloadData];
}

// return后导航到下一个输入框
-(IBAction)textFieldDone:(id)sender
{
    UITableViewCell* cell = (UITableViewCell*)[[sender superview]superview];
    
    UITableView* table = (UITableView*)cell.superview.superview;
    NSIndexPath* textFieldIndexPath = [table indexPathForCell:cell];
    NSUInteger row = [textFieldIndexPath row];
    row++;
    if (row >= kNumberOfEditableRows) {
        row = 0;
    }
    NSUInteger newIndex[] = {0, row};
    NSIndexPath* newPath = [[NSIndexPath alloc]initWithIndexes:newIndex length:2];
    
    UITableViewCell* nextCell = [self.tableView cellForRowAtIndexPath:newPath];
    
    UITextField* nextField = nil;
    for (UIView * oneView in nextCell.contentView.subviews) {
        if ([oneView isMemberOfClass:[UITextField class]]) {
            nextField = (UITextField*)oneView;
        }
    }
    [nextField becomeFirstResponder];
}

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSArray* array = [[NSArray alloc]initWithObjects:@"Name", @"From:", @"To", @"Party", nil];
    
    self.fieldLabels = array;
    
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    self.tempValues = dict;
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
    return kNumberOfEditableRows;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* PresidentCellIdentifier = @"PresidentCellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PresidentCellIdentifier];
        
        // 静态描述文本
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 75, 25)];
        // 右对齐 ？
        
        label.tag = kLabelTag;
        label.font = [UIFont boldSystemFontOfSize:14];
        
        [cell.contentView addSubview:label];
        
        // 输入框
        UITextField* textField = [[UITextField alloc]initWithFrame:CGRectMake(90, 12, 200, 25)];
        textField.clearsOnBeginEditing = NO;
        [textField setDelegate:self];
        //textField.returnKeyType = UIReturnKeyDone;
        [textField addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        [cell.contentView addSubview:textField];
    }
    
    NSUInteger row = [indexPath row];
    
    // 对应控件
    UILabel* label = (UILabel*)[cell viewWithTag:kLabelTag];
    UITextField* textField = nil;
    
    for (UIView* oneView in cell.contentView.subviews) {
        if ([oneView isMemberOfClass:[UITextField class]]) {
            textField = (UITextField*)oneView;
        }
    }
    
    label.text = [self.fieldLabels objectAtIndex:row];
    NSNumber* rowAsNum = [[NSNumber alloc]initWithInt:row];
    
    switch (row) {
        case kNameRowIndex:
            if ([[self.tempValues allKeys]containsObject:rowAsNum]) {
                textField.text = [self.tempValues objectForKey:rowAsNum];
            }
            else
            {
                textField.text = self.president.name;
            }
            break;
        
        case kFromyearRowIndex:
            if ([[self.tempValues allKeys]containsObject:rowAsNum]) {
                textField.text = [self.tempValues objectForKey:rowAsNum];
            }
            else
            {
                textField.text = self.president.fromYear;
            }
            break;
        
        case kToYearRowIndex:
            if ([[self.tempValues allKeys]containsObject:rowAsNum]) {
                textField.text = [self.tempValues objectForKey:rowAsNum];
            }
            else
            {
                textField.text = self.president.toYear;
            }
            break;
        
        case kPartyRowIndex:
            if ([[self.tempValues allKeys]containsObject:rowAsNum]) {
                textField.text = [self.tempValues objectForKey:rowAsNum];
            }
            else
            {
                textField.text = self.president.party;
            }
            break;
        
        default:
            break;
    }
    
    if (self.textFieldBeingEdited == textField) {
        self.textFieldBeingEdited = nil;
    }
    
    textField.tag = row;
    
    return cell;
}

#pragma mark - 
#pragma mark Table Delegate Methods
-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  nil;
}

#pragma mark -
#pragma mark Text Field Delegate Methods

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textFieldBeingEdited = textField;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSNumber* tagAsNum = [[NSNumber alloc]initWithInt:textField.tag];
    [self.tempValues setObject:textField.text forKey:tagAsNum];
}

@end
