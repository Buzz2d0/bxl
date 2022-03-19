//
//  MyObject+PrintExt.m
//  objcdemo
//
//  Created by whoami on 2022/3/19.
//

#import "MyObject+PrintExt.h"

// 类别
@implementation MyObject (PrintExt)

-(void)print{
    NSLog(@"%@", [self toString]);
}
@end
