func isMoreThanTen(count:Int) -> Bool{
    return count>10
}

isMoreThanTen(count:9)
isMoreThanTen(count: 12)

//使用返回optional与if-let类型来标识函数是否执行成功
func myFunc(param:Int) -> Int?{
    guard param>100 else {
        return nil
    }
    return param - 100
}

if let temp = myFunc(param: 103){
    print(temp)
}


//传入不定参数
func myFunc10(param:Int...){
    var sum = 0
    for t in param{
        sum+=t
    }
    print(sum)
}
myFunc10(param:1,2,3)
myFunc10(param:1,2,3,4,5)


func test( a:inout Int,b:Int) -> Int
{
    a = b + 1;
    return a;
}
var t = 1
test(a: &t  ,b: 2)
