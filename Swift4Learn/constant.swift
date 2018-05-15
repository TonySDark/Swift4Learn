//
//  constant.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/14.
//  Copyright © 2018年 tony. All rights reserved.
//

/*
 * 你可能会问我为啥没有引用，因为swift默认在当前包内调用，不需要import.哇，好方便 >0<,当然一定是swift帮我们做了这件事，毕竟没了h文件。如果你想问它怎么知道：选中当前项目，targets->build phases-->第二项compile source：😯在这里！！！
     对比OC 你发现少了 h和m 的导入
 */


import Foundation
import UIKit


//OC宏定义的swift的写法：由于swift没有宏定义，该怎么办？？？
//需要定义全局常量/方法   呦嚯嚯～呦嚯嚯～

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth =  UIScreen.main.bounds.size.width

//OC中带参数的宏定义的swift中的写法
    //你一定会问我系列套餐
    //? 和 ! 其实分别是Swift语言中对一种可选类型（ Optional) 操作的语法。一个没赋值 一个 赋值了

    //after，你一定又会问我 x:类型！ 这是啥  ---》直观上检查数据类型，必须有值（于是就会经常遇上2种错误：编译错误和runtime错误，you'll find it!）
    //After that， 后你一定还会问我 x:类型？ 这是啥  ---》直观上检查数据类型之可以为nil
    //After that，你一定更会问我 self as! UIScrollViewDelegate？ 这是啥  ---》  直观就是说 谁要作为代理人 代理方法必须有 设置代理你可以设置nil
    //因为swift是强类型语言，类型检查的强大！！
func RGBCOLOR(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

// 用法： RGBCOLOR(1, 2, 3)

/*
 here，你一定会问我 _ x:类型 这是啥  ---》函数参数标签和参数名称(Function Argument Labels and Parameter Names) 每个方法的参数都会有参数标签和参数名称。默认情况下，参数标签就是参数名称，并且每个参数名字都必须是独一无二的。

可以在参数名称前指定参数标签，用空格隔开：
func RGBCOLOR(_ r:CGFloat,_ g:CGFloat,from b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
 用法： RGBCOLOR(1, 2, from:b)
 **省略参数标签(Omitting Argument Labels)当不需要参数标签的时候可以用下划线『_』代替：
 **可变参数(Variadic Parameters)

 ***一个参数可以接受一个或者多个指定类型的值。在参数的类型名之后用三个点来表示『...』
一个方法最多只有一个可变参数
 func showSomething(things:String ...) -> String
 {
     var showStr = ""
     for str:String in things {
        showStr += str
     }
     return showStr
 }
 ** void返回值
严格来说这个函数还是有返回值的，只不过返回值是void，在Swift中就是一个空的元组。
返回值是可以忽略的
func showSomething1() -> void
{   //
}
所以可以写成
func showSomething1()
{
}
 **In-Out参数(In-Out Parameters)
总结起来就是，给函数传递进去的参数是没法改变外部传进来的值的，这种情况下可以在变量右侧，类型前面用『inout』修饰，在调用函数的时候，如果表明该参数可被函数改变的时候，需要在参数前面加『&』:
 function swapNum(_ a: inout Int, _ b: inout Int)
    a = a + b
    b = a - b
    a = a - b
 }
 var aNum = 1
 var anotherNum = 2
 swapNum(&aNum,&anotherNum) //交换了数据
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
