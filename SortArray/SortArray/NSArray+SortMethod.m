//
//  NSArray+SortMethod.m
//  SortArray
//
//  Created by Leben.NNA on 16/9/11.
//  Copyright © 2016年 Leben.NNA. All rights reserved.
//

#import "NSArray+SortMethod.h"

@implementation NSArray (SortMethod)

// 选择排序
+ (NSArray *)selectSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des {
    int index = 1;
    for (int i = 0; i < array.count; i++) {
        for (int j = i + 1; j < array.count; j++) {
            if (array[i].integerValue > array[j].integerValue) {
                NSNumber *tempNumber = array[i];
                array[i] = array[j];
                array[j] = tempNumber;
            }
            NSLog(@"第%d次：%@", index, array);
            index++;
        }
        NSLog(@"第%d次：%@", index, array);
        index++;
    }
    NSArray *tempArr = [NSArray arrayWithArray:array];
    tempArr = des ? [NSArray reverseArray:tempArr] : tempArr;
    NSLog(@"选择排序结果：%@", tempArr);
    return tempArr;
    
}

// 冒泡排序
+ (NSArray *)popSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des {
    int index = 1;
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; j < array.count - i - 1; j++) {
            if (array[j].integerValue > array[j+1].integerValue) {
                NSNumber *tempNumber = array[j];
                array[j] = array[j+1];
                array[j+1] = tempNumber;
            }
            NSLog(@"第%d次：%@", index, array);
            index++;
        }
        NSLog(@"第%d次：%@", index, array);
        index++;
    }
    NSArray *tempArr = [NSArray arrayWithArray:array];
    tempArr = des ? [NSArray reverseArray:tempArr] : tempArr;
    NSLog(@"冒泡排序结果：%@", tempArr);
    return tempArr;
}

// 快速排序
+ (NSArray *)quickSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des {
    [array quickSort:array leftIndex:0 rightIndex:array.count - 1];
    NSArray *tempArr = [NSArray arrayWithArray:array];
    tempArr = des ? [NSArray reverseArray:tempArr] : tempArr;
    NSLog(@"快速排序结果：%@", tempArr);
    return tempArr;
}

- (void)quickSort:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right {
    if (left < right) {
        NSInteger keyNum = [self getMiddleIndex:array leftIndex:left rightIndex:right];
        [self quickSort:array leftIndex:left rightIndex:keyNum - 1];
        [self quickSort:array leftIndex:keyNum + 1 rightIndex:right];
    }
}

- (NSInteger)getMiddleIndex:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right {
    NSInteger keyValue = [array[left] integerValue]; // 第一次以第一个元素为关键点（以后当left等于right为关键点）
    while (left < right) {
        while (left < right && keyValue <= [array[right] integerValue]) {
            right --;
        }
        if (left < right) {
            array[left] = array[right];
        }
        
        while (left < right && [array[left] integerValue] <= keyValue) {
            left ++;
        }
        if (left < right) {
            array[right] = array[left];
        }
    }
    array[left] = [NSNumber numberWithInteger:keyValue];
    return left;
}

// 插入排序（直接插入法）
+ (NSArray *)insertSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des {
    int index = 1;
    for (int i = 1; i < array.count; i ++) {
        NSNumber *tempNumber = array[i];
        for (int j = i - 1; j >= 0 && tempNumber < array[j]; j --) {
            array[j + 1] = array[j];
            array[j] = tempNumber;
            NSLog(@"第%d次：%@", index, array);
        }
        NSLog(@"第%d次：%@", index, array);
    }
    NSArray *tempArr = [NSArray arrayWithArray:array];
    tempArr = des ? [NSArray reverseArray:tempArr] : tempArr;
    NSLog(@"插入排序结果：%@", tempArr);
    return tempArr;
    
}

// 反转数组
+ (NSArray *)reverseArray:(NSArray *)array {
    return [[array reverseObjectEnumerator] allObjects];
}


@end
