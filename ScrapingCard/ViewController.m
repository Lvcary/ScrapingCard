//
//  ViewController.m
//  ScrapingCard
//
//  Created by 刘康蕤 on 16/6/3.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#import "ViewController.h"
#import "ScrapView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
    
    ScrapView * scrap = [[ScrapView alloc] initWithFrame:CGRectMake(10, 100, CGRectGetMaxX(self.view.frame) - 20, 200)];
    scrap.tag = 1000;
    [self.view addSubview:scrap];
    
    UIButton * scrapAgainBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    scrapAgainBtn.frame = CGRectMake(20, 320, CGRectGetMaxX(self.view.frame) - 40, 40);
    [scrapAgainBtn setTitle:@"再刮一次" forState:0];
    [scrapAgainBtn addTarget:self action:@selector(scrapAgainAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scrapAgainBtn];
}

- (void)scrapAgainAction:(UIButton *)sender {
    ScrapView * scr = (ScrapView *)[self.view viewWithTag:1000];
    if (!scr.guaguaBackView.isAllowSt) {
        [scr allocAllSubView];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
