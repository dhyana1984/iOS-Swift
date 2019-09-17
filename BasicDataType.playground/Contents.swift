//8位无符号整型数的最大值255
var a1 = UInt8.max
//16位无符号整型数的最大值 65535
var a2 = UInt16.max
//32位无符号整型数最大值4294967295
var a3 = UInt32.max
//64位无符号整型数的最大值
var a4 = UInt64.max
//默认就是64位
var a = UInt.max
//获取数据类型所占位数，在64位机器上UInt占8字节64位
var a5 = MemoryLayout<UInt>.size
var pen:(name:String, price:Int) = ("pen",2)
var name = pen.name
var price = pen.price

var car:(String,Int) = ("Benz",200000)
var carName = car.0
var carPrice = car.1
var (theName, thePrice) = car
print(theName, thePrice)
var (theCarName,_) = car
print(theCarName)


var obj:String?
if obj == nil{
    
}

var objc:String?  = "HS"

print(objc!)
//拆包
objc!


var object : String? = "HS"
//if-left绑定
if let temp = object{
    print(temp)
}else{
    object="HS"
    print(obj!)
}

var bundle:(pencil:Int,eraser:Int,pencilCase:Int) = (2,1,15)
print(bundle)
bundle.pencil


var sample:Int? = nil
if let tempSample:Int = sample, tempSample>30{
    print("合格")
}else{
    print("不合格")
}
