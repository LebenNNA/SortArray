//
//  NSArray+SortMethod.h
//  SortArray
//
//  Created by Leben.NNA on 16/9/11.
//  Copyright © 2016年 Leben.NNA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SortMethod)

// 冒泡排序
+ (NSArray *)popSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des;

// 选择排序
+ (NSArray *)selectSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des;

// 快速排序
+ (NSArray *)quickSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des;

// 插入排序（直接插入法）
+ (NSArray *)insertSortArray:(NSMutableArray<NSNumber *> *)array isDes:(BOOL)des;

@end
