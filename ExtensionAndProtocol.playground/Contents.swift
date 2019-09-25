import Foundation

class MyClass{
    var name:String
    var age:Int
    init() {
        name = "HS"
        age = 24
    }
}
//为MyClass扩展一个属性
extension MyClass{
    var nameAndAge:String{
        return "\(name)"+"\(age)"
    }
}

var obj = MyClass()
obj.nameAndAge


extension Int{
    //如果对值类型写扩展，必需用mutating修改自身实例
    mutating func sq(){
        self *= self
    }
}

var i = 3
i.sq()

@objc protocol ClassProtocol:class{
    //此协议方法可选实现，即遵守协议的类可以实现也可以不实现
    @objc optional func log()

}

extension ClassProtocol{
    func log(){
        print("log")
    }
}

class classE: ClassProtocol{
    
}

var clsE = classE()

clsE.log()



