//循环引用
class ClassOne{
    //weak可以解决循环引用问题，但是只能对Optional类型有效
    weak var cls: ClassTwo?
    deinit {
        print("ClassOne deinit")
    }
}

class ClassTwo{
    var cls:ClassOne?
    init(cls:ClassOne?){
        self.cls=cls
    }
    deinit {
        print("ClassTwo deinit")
    }
}

var obj:ClassOne? = ClassOne()
var obj2:ClassTwo? = ClassTwo(cls:obj)


obj?.cls=obj2
obj2 = nil
obj = nil


class ClassThree{
    //非Optional类型可以用unowned关键字解决循环引用问题
    unowned var cls:ClassFour
    init(clas:ClassFour) {
        self.cls = clas
    }
    deinit {
        print("ClassFour deinit")
    }
}

class ClassFour{
    var cls:ClassThree?
    deinit {
        print("ClassThree deinit")
    }
}

var obj4:ClassFour? = ClassFour()
var obj3:ClassThree? = ClassThree(clas: obj4!)
obj4?.cls=obj3!

obj4 = nil
obj3 = nil

//闭包循环引用
class MyClassSix{
    var name :String = "HS"
    lazy var closure:() ->Void = {
        //使用捕获列表对闭包中使用到的self进行无主引用的转换
        [unowned self]() -> Void in
        print(self.name)
    }
    deinit {
        print("Class6 deinit")
    }
}

var obj6:MyClassSix? = MyClassSix()
obj6?.closure
obj6 = nil
