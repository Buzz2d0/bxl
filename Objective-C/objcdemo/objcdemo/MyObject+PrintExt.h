//
//  MyObject+PrintExt.h
//  objcdemo
//
//  Created by whoami on 2022/3/19.
//

#import "MyObject.h"

NS_ASSUME_NONNULL_BEGIN

// 类别 Category 扩展一个类。无法修改类的代码，为类增加一些功能。
@interface MyObject (PrintExt)

// 类别中的方法优先级更高
-(void)print;
@end

NS_ASSUME_NONNULL_END
