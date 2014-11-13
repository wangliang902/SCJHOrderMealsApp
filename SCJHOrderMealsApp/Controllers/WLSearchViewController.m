//
//  WLSearchViewController.m
//  SCJHOrderMealsApp
//
//  Created by scjh on 14/11/11.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "WLSearchViewController.h"
//models
#import "WLSearchModel.h"

#define SEARCH_HEAD_HIGH (30)
#define SEARCH_CELL_HIGH (50)
#define SEARCH_ORIGIN_X (20)

@interface WLSearchViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *tableViewArray;
}
@property (nonatomic,strong) UITableView *searchTableView;
@property (nonatomic,strong) UITextField *searchTextField;

@end

@implementation WLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ROOT_TITLE_WIDE, IOS_IPHONE_TABBAR_IMAGE_HIGH)];
    _searchTextField.backgroundColor = [UIColor redColor];
    _searchTextField.placeholder = @"请输入...";
    _searchTextField.returnKeyType = UIReturnKeySearch;
    self.navigationItem.titleView = _searchTextField;
    _searchTextField.delegate = self;
    
    self.searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, IOS_IPHONE_WINDOW_WIDE, IOS_IPHONE_WINDOW_HIGH) style:UITableViewStylePlain];
    [self.view addSubview:self.searchTableView];
    _searchTableView.delegate = self;
    _searchTableView.dataSource = self;
    if (![[WLSearchModel shareSearchModel].vualeString isEqualToString:@""]) {
        tableViewArray = [[WLSearchModel shareSearchModel].vualeString componentsSeparatedByString:@","];
        [self.searchTableView reloadData];
    }
    
    self.searchTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - 搜索textField的代理

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@" "])
    {
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSMutableString *textFieldString = [textField.text mutableCopy];
    
    if ([textFieldString containsString:@","])
    {
        [textFieldString replaceOccurrencesOfString:@"," withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, textFieldString.length)];
    }
    NSMutableString *valueString = [WLSearchModel shareSearchModel].vualeString;
    
    if (![textFieldString isEqualToString:@""])
    {
        if (![valueString hasPrefix:textFieldString])
        {
            if (![valueString isEqualToString:@""])
            {
                NSMutableArray *searchModelArray = [[valueString componentsSeparatedByString:@","] mutableCopy];
                if ([searchModelArray containsObject:textFieldString])
                {
                    for (NSString *string in searchModelArray)
                    {
                        if ([string isEqualToString:textFieldString])
                        {
                            [searchModelArray exchangeObjectAtIndex:0 withObjectAtIndex:[searchModelArray indexOfObject:string]];
                            break;
                        }
                    }
                    
                    [WLSearchModel shareSearchModel].vualeString = [[searchModelArray componentsJoinedByString:@","] mutableCopy];
                    tableViewArray = searchModelArray;
                }else
                {
                    [[WLSearchModel shareSearchModel].vualeString insertString:[NSString stringWithFormat:@"%@,",textFieldString] atIndex:0];
                    tableViewArray = [[WLSearchModel shareSearchModel].vualeString componentsSeparatedByString:@","];
                }
                
            }else
            {
                [[WLSearchModel shareSearchModel].vualeString appendString:textFieldString];
                tableViewArray = @[textFieldString];
            }
            
            NSLog(@"%@",tableViewArray);
            [self.searchTableView reloadData];
        }
    }
    return YES;
}

#pragma mark - 搜索表格的代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableViewArray.count > 0)
    {
        return 1;
    }else
    {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableViewArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SEARCH_CELL_HIGH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.frame = CGRectMake(SEARCH_ORIGIN_X, 0, cell.frame.size.width - SEARCH_ORIGIN_X, cell.frame.size.height);
    }
    cell.textLabel.text = tableViewArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SEARCH_HEAD_HIGH;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    headView.backgroundColor = [UIColor grayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SEARCH_ORIGIN_X, 0, headView.frame.size.width - SEARCH_ORIGIN_X, headView.frame.size.height)];
    label.text = @"搜索历史";
    [headView addSubview:label];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return SEARCH_HEAD_HIGH;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, tableView.frame.size.width, tableView.frame.size.height)];
    [deleteButton setTitle:@"清空搜索记录" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    deleteButton.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
    [deleteButton addTarget:self action:@selector(deleteAllSearch) forControlEvents:UIControlEventTouchUpInside];
    return deleteButton;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _searchTextField.text = tableViewArray[indexPath.row];
}

#pragma mark - 清空搜索记录方法

- (void)deleteAllSearch
{
    [WLSearchModel shareSearchModel].vualeString = [@"" mutableCopy];
    [[WLSearchModel shareSearchModel] saveSearchModelInfo];
    tableViewArray = nil;
    [_searchTableView reloadData];
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
