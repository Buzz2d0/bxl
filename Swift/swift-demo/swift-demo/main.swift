//
//  main.swift
//  swift-demo
//
//  Created by whoami on 2022/3/19.
//

// Swift可以使用和Objective-C 相同的运行时，还可以使用现有的Cocoa和Cocoa Touch

/*
 *注释
 */
// 注释

import Foundation

print("Hello, World!")

// 类型和变量
let foo: Int = 1 // let 定义常量
var boo = 123 // var 定义变量，还具有类型推导可以不写类型
var str = "a + b = (a+b)"
print(foo, boo, str)

// 可选类型
var opt: Int? = nil // nil 表示不存在可用的值/正常Int的值
opt = 456
if (opt != nil){
    print(opt!) // 确定值不为nil时，可以使用感叹号(!)获取具体的值
}

// 集合类型
// 数组
var arr = [Int]()
arr.append(1)
print(arr, arr[0])
arr.removeAll() // 清空数组

// 数组字面量
arr = [2,3,4]
print(arr)
arr = [] // 清空数组

// 字典
var dic = [Int:String]()
dic[0] = "Zero"// 添加
dic[1] = "One"// 添加
print(dic[0]!, dic[1]!, dic[2]) // 字典下表返回的是一个可选类型，键值对可能不存在
dic.removeAll() // 清空字典

// 字典字面量
dic = [0:"Zero", 1:"One", 2:"Two"]
print(dic)
dic = [:]

// 运算符号
// （其他的都和C语言差不多）区间运算符
var ran = 1...10 // 1到10的区间，包含结束10
var ran9 = 1..<10 // 1到9的区间，不包含结束10

// 控制语句
// if
var bar = 2

if bar == 2{
    print("bar == 2")
}else{
    print("bar != 2")
}

if foo == 1{
    print("foo == 1")
}

if foo == bar{
    print("foo == bar")
}else if foo > bar{
    print("foo > bar")
}else{
    print("foo < bar")
}

// switch
var foo2 = 3

switch foo2{
case 1: print("foo2 == 1")
case 2: print("foo2 == 2")
case 3,4: print("foo2 == 3 or 4")
default:break
}
// switch 支持所有可比较类型
let str2 = "Hello"
switch str{
case str2:print("str == str2")
case "Hello World":print("str == \"Hello World\"")
default:break
}
// switch 模式匹配
switch foo2{
case 0...3: print("0 <= foo2 <= 3")
case 4..<6: print("4 <= foo2 < 6")
default:print("foo2 is other value")
}
// switch 元组+模式匹配
let tup = (1,2)
switch tup{
    // 满足多个case条件时，只会执行第一个case代码。
case (_,0...4):print("0 <= tup.1 <= 4")
case (1,_):print("tup.0 == 1")
default: break
}
// switch 元组解包
let tup2 = (4,5,6)
switch tup2{
case let(x,_,0...4): print("0 <= tup.2 <= 4")
case let(x,y,z)
    where x == 4 && y == 5:
    print("x = \(x), y = \(y), z = \(z)")
default: break
}

// for

// C-style for statement has been removed in Swift 3
//for var i = 0; i < 10; i += 1 {
//    print("for i \(i)")
//}

// for-in
let myArray = [1, 1, 2, 3, 5]
for value in myArray {
    print("for-in value \(value)")
}
// 区间for
for value in 0...4 {
    print("for-in value \(value)")
}
// 字典 for
dic = [0:"Zero", 1:"One", 2:"Two"]
for (key, value) in dic {
  print("\(key): \(value)")
}


// while
var i = 1
while i < 1000 {
  i *= 2
}

// repeat-while
var n = 5
repeat {
    n -= 1
    print("repeat-while: \(n)")
} while n >= 0;


// 函数
// 函数是一等类型，这意味着可以在函数中构建函数
// 并且可以被传递

func add(a: Int, b: Int) -> Int {
  return a + b
}
print(add(a:1, b:2))

// 默认参数
func add2(a: Int, b: Int=2) -> Int {
  return a + b
}
print(add2(a:4))

// 可变参数
func sum(a: Int...) -> Int {
    var sum:Int = 0
    for i in a{
        sum += i
    }
  return sum
}
print(sum(a:1,2,3,4,5,6))

// 支持重载
func test(){
    print("no arg")
}
func test(i:Int){
    print("arg i is \(i)")
}
test()
test(i:2)

// lambda 表达式
var numbers = [1,2,3]
// `->` 分隔参数和返回类型
// `in` 分隔闭包头和闭包体
numbers = numbers.map({(number: Int) -> Int in return 3 * number})
print(numbers) // [3, 6, 9]


// 枚举
enum MyEnum{
    case foo
    case bar
    case foobar
}
let bbb = MyEnum.bar
let fbb: MyEnum = .foobar
print(MyEnum.foo, bbb, fbb)

// 类
    // 计算属性与属性观察器
    // 继承

// 协议

// 结构体

// 泛型

// 模块与源文件
    // 模块
    // 访问控制
