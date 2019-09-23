class Math{
    func add(param1:Double,param2:Double) -> Double {
        return param1 + param2
    }
}

var obj = Math()

obj.add(param1:1.10, param2:2.20)

struct Point{
    var x: Double
    var y: Double
    //在值类型中，需要mutaing关键字修饰才能对属性进行修改
    mutating func move(x:Double,y:Double)  {
        self.x+=x
        self.y+=y
    }
    
    static let name = "Point"
    static func printName(){
        //使用self调用静态属性
        print(self.name)
    }
}

var point = Point(x:3,y:5)
point.move(x: 1, y: 1)

Point.printName()

