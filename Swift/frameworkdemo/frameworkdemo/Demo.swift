//
//  Demo.swift
//  frameworkdemo
//
//  Created by whoami on 2022/3/20.
//

import Foundation

public func add(a:Int, b:Int) -> Int{
    return a + b
}

// 兼容Objective-C写法
 @objc public class TestClass: NSObject{
//public class TestClass {
     @objc public func foo(){
        print("TestClass - foo()")
    }
    
     @objc public var bar = 1
    // 默认生成的构造函数时 internal，需要显示地声明为 public
    // 兼容Objective-C写法
    public override init(){}
    // public init(){}
}

// 默认是 internal，只能在本模块中使用
func internal_func(){
    print("internal_func")
}

// private 只能在本文件中使用
private func private_func(){
    print("private_func")
}

// Xcode测试framework
// File -> New -> Target 选择 Command Line Tool
// 在 Target -> Test -> Link Binary With Libraries 中添加framework
