import UIKit

var greeting = "Hello, playground"
//クロージャとは - 「名前のない関数」を「変数/定数」に代入する機能

//part1
//関数
func add(value1: Int, value2: Int) -> Int {
    return value1 + value2
}

// 関数からクロージャに
let add = { (value1: Int, value2: Int) -> Int in
    return value1 + value2
}

add(3, 5)  //8

//part2
// 関数
func method(inputValue: Int, inputStr: String) -> String {
  return "\(inputValue)と\(inputStr)が入力されました"
}
// 関数を実行
method(inputValue: 10, inputStr: "文字列です") //10と文字列ですが入力されました

// クロージャ
//let value = { (inputValue: Int, inputStr: String) -> String in
//  return "\(inputValue)と\(inputStr)が入力されました"
//}
// クロージャを実行
//value(10, "文字列です")





