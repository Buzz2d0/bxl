//
//  MyObject.h
//  objcdemo
//
//  Created by whoami on 2022/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Objective-C 协议
@protocol Foo
@optional - (void)fooBar;
- (void)fooWithArg:(int)arg;
@end

// Objective-C 声明类
@interface MyObject : NSObject<Foo> // Objective-C 绝大多数类都直接或间接继承 NSObject
                                    // <Foo> 实现 Foo 协议

// 添加属性
@property int intProp; // @property 是一个语法糖，根据括号内的属性生成相应的成员变量（属性名前加上 _）和getter、setter 等，对属性赋值和取值时会自动调用 getter、setter。
@property (readonly) NSString* strProp;

// 声明消息方法
-(id)initWithProp:(int)intProp andProp:(NSString*)strProp; // Objective-C 的 id 类型类似于 C 中 void，用来存放 对象实例的指针。

-(NSString*)toString;
-(void)oneArgTest:(int)arg;
-(void)twoArgTest:(int)arg1 with:(int)arg2;

@end


NS_ASSUME_NONNULL_END
