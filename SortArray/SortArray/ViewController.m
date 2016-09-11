//
//  ViewController.m
//  SortArray
//
//  Created by Leben.NNA on 16/9/9.
//  Copyright © 2016年 Leben.NNA. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+SortMethod.h"
#import "Masonry.h"

@interface ViewController () {
    NSMutableArray *_picsArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array1 = [self buildArray:10];
//    [NSArray popSortArray:array1 isDes:true];
//    [NSArray selectSortArray:array1 isDes:false];
    [NSArray quickSortArray:array1 isDes:false];

//    _picsArr = [NSMutableArray arrayWithCapacity:0];
//    [self layouPage];

}

- (NSMutableArray *)buildArray:(NSUInteger)count {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while (count > 0) {
        NSNumber *number = [NSNumber numberWithInteger:(arc4random() % 101)];
        [array addObject:number];
        count --;
    }
    NSLog(@"产生的数组为：%@", array);
    return array;
}

- (void)layouPage {
    NSArray *images = @[@1, @2, @3, @4, @5, @6, @7, @8, @9];
    if (images.count > 0) {
        __block UIButton *lastBtn = [UIButton new];
        __weak typeof(self) wself = self;
        [images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *imageBtn = [UIButton new];
            [wself.view addSubview:imageBtn];
            [imageBtn setBackgroundColor:[UIColor blueColor]];
            
            if (_picsArr) {
                lastBtn = [_picsArr lastObject];
            }
            NSInteger lineNum = idx / 3; // 哪一行
            NSInteger indexNum = (idx + 1) % 3; // 所在行的第几个
            
            // 设置图片宽高和上约束
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(wself.view).offset((30 + 10) * lineNum + 20);
                if (indexNum == 1) {
                    make.left.equalTo(wself.view);
                } else {
                    make.left.equalTo(lastBtn.mas_right).offset(10);
                }
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
            
            [_picsArr addObject:imageBtn];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
