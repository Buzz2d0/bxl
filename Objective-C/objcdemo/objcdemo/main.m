//
//  main.m
//  objcdemo
//
//  Created by whoami on 2022/3/14.
//

// Objective-C完全兼容C语言。

// import 预处理和C语言include 非常相似，唯一不同的是import会自动防止重复包含。
#import <Foundation/Foundation.h> // Foundation.h 包含的是macOS系统提供的基础框架的接口声明。

#import "MyObject.h"
#import "MyObject+PrintExt.h"

// main.m -> main 入口函数
int main(int argc, const char * argv[]) {
    @autoreleasepool { // 内存管理机制，在 @autoreleasepool 所包含代码块中申请内存位于本线程的一个自动释放内存池上，会在内存池销毁掉的时候自动回收。
        
        printf("Hello, World!\n");
        NSLog(@"Hello, World!");
        
        // NSString 是一个类，功能比C的 Char* 更强。
        NSString *nsstr1 = @"nsstring";
        NSLog(@"%@", nsstr1);
        
        // 类：强制要求将类分为声明（interface）与实现（implementation）两部分。
        // 声明 .h 文件
        // 实现 .m 文件
        
        // myobject 实例化
        MyObject* myobj = [[MyObject alloc] initWithProp:1 andProp:@"test1"];
        myobj.intProp = 2;
        // 编译错误 strProp 是 readonly 属性
        // myobj.strProp = @"123";
        NSLog(@"%d, %@",myobj.intProp, myobj.strProp);
        NSLog(@"myobj tostring is: %@",[myobj toString]);
        [myobj oneArgTest:123];
        [myobj twoArgTest:123 with:234];
        
        [myobj fooWithArg:123456];
        
        [myobj print];
        
        
        // Objective-C block 语法，类似匿名函数、Lambda 表达式
        int foo = 10; // 外部变量 foo 在 block tenx 中是无法修改的，可修改的变量有以下3种类型：
                        // 1. 全局变量；
                        // 2. 静态变量；
                        // 3. __block 修饰符：__block int foo；
        NSString*(^tenx)(double) = ^(double bar){return [NSString stringWithFormat:@"tenx is %f", foo*bar];};
        NSLog(@"tenx(100): %@",tenx(100));
        
    }
    return 0;
    
    
}
