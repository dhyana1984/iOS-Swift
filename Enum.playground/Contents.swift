
//自定义前缀运算符
prefix operator ++
//进行自定义运算符实现
prefix func ++(param:Int) ->Int{
    return param+1
}

var t = 6
++6
enum Expression{
    case num(param:Int)
    //indirect表示可递归
    indirect case add (param1:Expression,param2:Expression)
    indirect case sub (param1:Expression,param2:Expression)
    indirect case mul (param1:Expression,param2:Expression)
    indirect case div (param1:Expression,param2:Expression)
}

//表达((5 + 5) * 2 - 8) / 2

//创建单值5
var num5 = Expression.num(param:5)
//表达5+5
var exp1 = Expression.add(param1: num5, param2: num5)
//创建单值2
var num2 = Expression.num(param: 2)
//表达(5+5)*2
var exp2 = Expression.mul(param1: exp1, param2: num2)
//创建单值8
var num8 = Expression.num(param: 8)
//进行表达式(5+5)*2-8
var exp3 = Expression.sub(param1: exp2, param2: num8)
//进行表达式((5+5)*2-8)/2
var expFinal = Expression.div(param1: exp3, param2: num2)

//这个函数将Expression的表达式进行运算
func expressionFunc(param: Expression) -> Int{
    switch param {
        //单值直接返回
        //捕获参数
    case let .num(param):
        return param
    //返回加法运算，下面雷同
    case let .add(param1, param2):
        return expressionFunc(param: param1) + expressionFunc(param: param2)
    case let .sub(param1, param2):
        return expressionFunc(param: param1) - expressionFunc(param: param2)
    case let .mul(param1, param2):
        return expressionFunc(param: param1) * expressionFunc(param: param2)
    case let .div(param1, param2):
        return expressionFunc(param: param1) / expressionFunc(param: param2)
    
    }
}

//进行((5+5)*2-8)/2运算
expressionFunc(param: expFinal)
