//
//  main.m
//  TestOC
//
//  Created by whoami on 2022/3/20.
//

#import <Foundation/Foundation.h>
@import frameworkdemo;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TestClass* test = [[TestClass alloc] init];
        [test foo];
        NSLog(@"%ld", (long)test.bar);
    }
    return 0;
}
