//
//  mydylib.m
//  mydylib
//
//  Created by whoami on 2022/3/23.
//

#import "mydylib.h"

@implementation mydylib
-(void)hello{
    NSLog(@"hello world!");
}
@end

// xcodebuild
// 编译过程：
// 检查依赖（Check dependencies）
// 生成辅助文件(Write auxiliary files)
// 编译(CompileC)
// 链接(Ld)
// 生成调试符号(GenerateDSYMFile)
// 代码签名(CodeSign)
