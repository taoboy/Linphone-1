//
//  CallVC.m
//  bql_ipphone
//
//  Created by hao 好享购 on 16/7/15.
//  Copyright © 2016年 hao 好享购. All rights reserved.
//

#import "ContacterListVC.h"
#import "CallingVC.h"
#import "BQLIPPManager.h"
#import "AnswerVC.h"

// 屏幕尺寸
#define KWindowWidth ([UIScreen mainScreen].bounds.size.width)
#define KWindowHeight ([UIScreen mainScreen].bounds.size.height)

@interface ContacterListVC () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *callTable;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ContacterListVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"拨号";
    
    [self setTable];
}

- (void)setTable {
    
    self.callTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWindowWidth, KWindowHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.callTable];
    self.callTable.tableFooterView = [UIView new];
    self.callTable.rowHeight = 50;
    self.callTable.dataSource = self;
    self.callTable.delegate = self;
    
    self.dataSource = @[@"6001",@"6002",@"6003",@"6004",@"6005",@"6006",@"6007",@"9800"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier= @"call_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.detailTextLabel.text = @"拨号";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CallingVC *call = [[CallingVC alloc] init];
    
    call.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    call.phoneNumber = self.dataSource[indexPath.row];
    
    [self presentViewController:call animated:YES completion:nil];
}

// 来电代理
//- (void)onIncomingCall:(BQLCall *)call withState:(BQLCallState)state withMessage:(NSDictionary *)message {
//    
//    NSLog(@"有来电:%@",message);
//    AnswerVC *answer = [[AnswerVC alloc] init];
//    answer.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    answer.incomeCall = call;
//    answer.phoneNumber = message[@"called_address"];
//    [self presentViewController:answer animated:YES completion:nil];
//}


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
