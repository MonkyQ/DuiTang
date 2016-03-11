//
//  TSAllGroupController.m
//  TSGroupDemo
//
//  Created by Dylan on 3/8/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "TSAllGroupController.h"
#import "TSAllGroupListCell.h"

@implementation TSAllGroupController
-(void)viewDidLoad
{
    [super viewDidLoad];
    EMCursorResult * result=[[EMClient sharedClient].groupManager getPublicGroupsFromServerWithCursor:nil pageSize:-1 error:nil];
    NSArray * list= result.list;
    self.dataArray=list;
}
-(void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray=dataArray;
    [self.tableView reloadData];
}




#pragma delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //groupId  description  occupantsCount
    TSAllGroupListCell * cell = [TSAllGroupListCell cellWithTableView:tableView];
    EMGroup * group=self.dataArray[indexPath.row];
    [cell configWithEmgroup:group];
    [cell setTSAllGroupListCellSelectBlock:^(TSAllGroupListCell * cell)
    {
        EMError * error;
        [[EMClient sharedClient].groupManager joinPublicGroup:group.groupId error:&error];
        if(error)
        {
            //失败
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您已经加过该群了" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            //成功
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }

    }];
    
    return cell;
}
/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMGroup * group=self.dataArray[indexPath.row];
    EMError * error;
    [[EMClient sharedClient].groupManager joinPublicGroup:group.groupId error:&error];
    if(error)
    {
        //失败
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"加群失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        //成功
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    //加群操作
}
 */
//-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellAccessoryCheckmark;
//}
@end
