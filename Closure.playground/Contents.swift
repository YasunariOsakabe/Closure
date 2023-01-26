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


// Closure-basic2
let value = { (inputValue: Int, inputStr: String) -> String in
  return "\(inputValue)と\(inputStr)が入力されました"
}
// クロージャを実行
value(10, "文字列です") //10と文字列ですが入力されました


//クロージャをパラメータに持つ関数
//1)
func method1(closure1: (String,Int) -> Void ) -> Void{
    closure1("クロージャを実行", 3)
}

let closure1: ((String, Int) -> String) = { (text: String, value: Int) -> String in

    return "\(text)と\(value)が代入されました"
}

closure1("クロージャ", 3) //クロージャと3が代入されました


//以下の実行内容は書き方が違うだけで内容は同一となる
//下に行くにつれて省略された形になる
//1)
func method(closure: ((Int) -> Void)) {
    let v = Int.random(in: 0...100) // 0~100をランダムに返す
    closure(v)
}

//2)
let closure = {(value: Int) -> Void in
    guard value < 50 else {
        print("値が小さすぎます")
        return
    }
    print(value)
}

method(closure: closure)

//3)
method(closure: {(value: Int) -> Void in
    guard value < 50 else {
        print("値が小さすぎます")
        return
    }
    print(value)
})

//4)
method() {(value: Int) -> Void in
    guard value < 50 else {
        print("値が小さすぎます")
        return
    }
    print(value)
}

//5)
method {
    guard $0 < 50 else {
        print("値が小さすぎます")
        return
    }
    print($0)
}

//nilを許容するクロージャ

//1)
// nilを許容していないのでエラーとなる
let value: Int = nil

// nilを許容していないのでエラーとなる
let closure: ((Int) -> Void) = nil


//2)
// nilを許容しているのでエラーとならない
// あとから何か名前のない関数を代入するのでvarで定義
var value: Int? = nil

// nilを許容しているのでエラーとならない
// あとから何か名前のない関数を代入するのでvarで定義
var closureOrNil: ((Int) -> Void)? = nil

//3)
// 変数を定義
var closureOrNil: ((Int) -> Void)? = nil

// 変数を実行 = nilを実行
closureOrNil?(10)
// 出力 --> "何も起きない"


// 名前のない関数を代入
closureOrNil = { (value: Int) in
    print("入力したの\(value)だね")
}

// 変数を実行 = 変数に代入された名前のない関数を実行
closureOrNil?(10)
// 出力 --> 入力したの10だね

// 別の名前のない関数を代入
closureOrNil = { (value: Int) in
    let v = value * value
    print("計算結果は\(v)")
}

// 変数を実行 = 変数に代入された名前のない関数を実行
closureOrNil?(10)
// 出力 --> 計算結果は100
