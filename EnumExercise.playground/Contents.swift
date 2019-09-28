prefix operator ++  //前缀++运算符
postfix operator ++ //后缀++运算符
prefix operator -- //前缀--运算符
postfix operator -- //后缀--运算符

//实现

prefix func ++(param:inout Int) -> Int{
    param+=1
    return param 
}

postfix func ++(param:inout Int) -> Int{
    param+=1
    return param - 1
}

prefix func --(param:inout Int) ->Int{
    param-=1
    return param
}

postfix func --(param:inout Int) ->Int{
    param-=1
    return param+1
}

//追加区间范围相加操作
func +(param1:ClosedRange<Int>,param2:Int) -> ClosedRange<Int>{
    return param1.lowerBound...param1.upperBound+param2
}

var newRange = 0...5+5

postfix operator *!

postfix func *!(_ param:Int) ->Int{
    guard param>0 else {
        return 0
    }
    var res = 1

    for i in 1...param {
        res *= i
    }
    return res
    
}

print(-2)


enum Transport{
    case car(practise:Int,speed:Float)
    case boat(practise:Int,speed:Float)
    case airport(practise:Int,speed:Float)
}

//创建一个交通工具，价钱为2，速度为80
var car = Transport.car(practise: 20, speed: 80`)
