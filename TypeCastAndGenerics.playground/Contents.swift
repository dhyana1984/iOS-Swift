var str = "HS"

if str is String{
    print("str is string")
}


class BaseClass{
    
}
class MyClass: BaseClass{
    var name: String?
}
class SubClass1: MyClass{
    var count: Int?
}
class SubClass2:MyClass{
    var isBiger:Bool?
}
var obj1=MyClass()
obj1.name="HS"
var obj2=SubClass1()
obj2.count = 100
var obj3=SubClass2()
obj3.isBiger=true
var array:[BaseClass] = [obj1,obj2,obj3]
for var i in 0..<array.count{
    var obj = array[i]
    if obj is SubClass1{
        print((obj as! SubClass1).count)
    }
    if obj is SubClass2{
        print((obj as! SubClass2).isBiger)
    }
    if obj is MyClass {
        print((obj as! MyClass).name)
    }
}

protocol    MyProtocol{
    //实现协议时才指定类型
    associatedtype ItemType
    //协议中约定一个ItemType类型的计算属性param
    var param:ItemType {get set}
    //协议中约定一个方法
    func printParam(param:ItemType) -> Void
}

//实现协议
class MyClassP : MyProtocol{
    //进行param计算属性的实现
    //由于Swift可以自动识别类型，这时MyProtocal中的ItemType为Int
    var param: Int{
        get{
            return 0
        }
        set{
            
        }
    }
    
    //对方法实现，此时方法中的参数类型会被识别为Int
    func printParam(param: Int) {
        print(param)
    }
    
}

