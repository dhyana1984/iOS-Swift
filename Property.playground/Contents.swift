class Work {
    var name:String
    init(name:String) {
        self.name=name
        print("Completed Work class construction")
    }
}

class People{
    var age:Int
    //延迟构造work
    lazy var work:Work = Work(name:"teacher")
    init(age:Int){
        self.age=age
    }
}


var people = People(age:24)
people.work


class Teacher{
    var name:String{
        //此属性将要被赋值时会调用的方法
        willSet(myValue){
            //myValue可以自定义成传入的值
            print("name will be set as \(myValue)")
        }
        //此属性已经被复制后会调用的方法
        didSet(beforeValue){
            print("old name is \(beforeValue)")
        }
    }
    var age:Int
    init(name:String,age:Int) {
        self.age = age
        self.name = name
    }
}

//第一次构造时不会打印属性监听器中的信息
var teacher = Teacher(name: "Tom", age: 28)
//修改名字时会触发
teacher.name = "Jim"
