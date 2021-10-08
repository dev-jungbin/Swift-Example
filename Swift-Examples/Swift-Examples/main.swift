//
//  main.swift
//  Swift-Examples
//
//  Created by 1v1 on 2021/10/07.
//

import Foundation

//MARK: 클래스 정의
class Coffee {
    let shot: Int
    
    init(shot: Int) {
        self.shot = shot
    }
}

class Latte: Coffee {
    var flavor: String
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
let vanillaLatte: Latte = Latte(flavor: "vanilla", shot: 2)
let icedAmericano: Americano = Americano(shot: 3, iced: true)

/// 데이터 타입 확인
print("coffee is Coffee ->", coffee is Coffee) // true
print("coffee is Americano ->", coffee is Americano) // false
print("coffee is Latte ->", coffee is Latte) // false

print("vanillaLatte is Coffee ->", vanillaLatte is Coffee) // true
print("vanillaLatte is Americano ->", vanillaLatte is Americano) // false
print("vanillaLatte is Latte ->", vanillaLatte is Latte) // true

print("icedAmericano is Coffee ->", icedAmericano is Coffee) // true
print("icedAmericano is Americano ->", icedAmericano is Americano) // true
print("icedAmericano is Latte ->", icedAmericano is Latte)// false

print(type(of: coffee)) // Coffee
print(type(of: vanillaLatte)) // Latte
print(type(of: icedAmericano)) // Americano

if let a: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print("FAIL")
}

if let a: Latte = coffee as? Latte {
    print("This is Latte")
} else {
    print("FAIL")
}

if let a: Coffee = coffee as? Coffee {
    print("This is Coffee")
} else {
    print("FAIL")
}

if let b: Americano = icedAmericano as? Americano {
    print("This is Americano")
} else{
    print("FAIL")
}

if let b: Latte = icedAmericano as? Latte {
    print("This is Latte")
} else {
    print("FAIL")
}

if let b: Coffee  = icedAmericano as? Coffee {
    print("This is Coffee")
} else {
    print("FAIL")
}

let castedCoffee: Coffee = vanillaLatte as! Coffee // 항상 성공하는 다운캐스팅
let castedOKCoffee: Coffee = vanillaLatte as Coffee

// let castedAmericano: Americano = coffee as? Americano ?? <#default value#> // 강제 다운캐스팅 실패..


