//
//  ViewController.m
//  TestNFC
//
//  Created by PaddyGu on 2017/10/19.
//  Copyright © 2017年 PaddyGu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NFCReaderSession *nfcReaderSession;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //读取实例60s，读取失败或者超时，必须重新创建实例
    if (@available(iOS 11.0, *)) {
        _nfcReaderSession = [[NFCNDEFReaderSession alloc]initWithDelegate:self queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) invalidateAfterFirstRead:YES];
        [_nfcReaderSession beginSession];
    } else {
        // Fallback on earlier versions
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 读取数据
- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages {
    NSLog(@"读取的数据%@",messages);
}

#pragma 读取失败后的信息
- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error {
    NSLog(@"读取失败%@",error);
}

@end
