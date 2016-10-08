//
//  LoginVC.m
//  bql_ipphone
//
//  Created by hao 好享购 on 16/7/15.
//  Copyright © 2016年 hao 好享购. All rights reserved.
//

#import "LoginVC.h"
#import "ContacterListVC.h"
#import "BQLIPPManager.h"

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *addressTextfiled;
@property (weak, nonatomic) IBOutlet UITextField *portTextfiled;
@property (weak, nonatomic) IBOutlet UITextField *accountTextfiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfiled;

@end

@implementation LoginVC

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStatus:) name:kBQLLoginStatus object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录服务器";
    self.addressTextfiled.text = @"114.55.87.130";
    self.passwordTextfiled.text = @"6005";
    self.portTextfiled.text = @"5060";
    self.accountTextfiled.text = @"6005";
}

-(void)loginStatus:( NSNotification *)sender{
    
    NSInteger status  = [sender.userInfo[@"status"] integerValue];
    if(status == BQLRegistrationOk) {
        
        NSLog(@"登录成功~~~");
    }
    else if (status == BQLRegistrationFailed) {
        
        NSLog(@"登录失败!!!");
    }
}

- (IBAction)login:(id)sender {
    
    if(self.addressTextfiled.text && self.portTextfiled.text && self.accountTextfiled.text && self.passwordTextfiled.text) {
        
        if([[BQLIPPManager InstanceIPPManager] addProxyConfig:self.accountTextfiled.text  password:self.passwordTextfiled.text DisplayName:@"" domain:self.addressTextfiled.text Port:self.portTextfiled.text withTransport:@"UDP"]) {
            
            ContacterListVC *call = [[ContacterListVC alloc] init];
            call.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            UINavigationController *nav= [[UINavigationController alloc]initWithRootViewController:call];
            [self presentViewController:nav animated:YES completion:nil];
        }
    }
    else {
        
        UIAlertView* error = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"警告",nil)
                                                        message:NSLocalizedString(@"请将信息填写完整",nil)
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定",nil)
                                              otherButtonTitles:nil ,nil];
        [error show];
    }
}

- (IBAction)logOut:(id)sender {
    
    [[BQLIPPManager InstanceIPPManager] logout];
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
