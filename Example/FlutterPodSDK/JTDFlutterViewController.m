//
//  JTDFlutterViewController.m
//  FlutterPodSDK_Example
//
//  Created by Stephan_Wang on 2021/8/2.
//  Copyright © 2021 911897896@qq.com. All rights reserved.
//

#import "JTDFlutterViewController.h"
#import <GeneratedPluginRegistrant.h>
#import "JTDNativeViewController.h"
@interface JTDFlutterViewController () {
    FlutterMethodChannel* methodChannel;
}

@end

@implementation JTDFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    methodChannel = [FlutterMethodChannel methodChannelWithName:@"choose_picture_page" binaryMessenger:self.binaryMessenger];

    __weak typeof(self) weakSelf = self;
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if ([call.method isEqualToString:@"picture"]) {
            [strongSelf goBack];
        }

    }];
    
}

- (void)goBack {
//    [self.navigationController popViewControllerAnimated:YES];
//    UIViewController *VC = [NSClassFromString(@"INTEGRALFSecondViewController") new];
//    [self.navigationController pushViewController:VC animated:YES];
    
    JTDNativeViewController *VC = [[JTDNativeViewController alloc] initWithNibName:@"JTDNativeViewController" bundle:nil];
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (void)goIntegralDetail {
    UIViewController *VC = [NSClassFromString(@"INTEGRALFSecondViewController") new];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)pushVC {
    
//    ScheduleViewController *VCOne = [[ScheduleViewController alloc] initWithNibName:@"ScheduleViewController" bundle:nil];
//    VCOne.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:VCOne animated:YES];
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
