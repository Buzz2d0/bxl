//
//  main.swift
//  Test
//
//  Created by whoami on 2022/3/20.
//

import Foundation
import frameworkdemo

// 测试调用 frameworkdemo

print("add(a: 1, b: 2) =", add(a: 1, b: 2))

var testC = TestClass()

testC.foo()
print(testC.bar)

// Xcode 运行测试
// Product -> Scheme 选择 "target" 'Test'
