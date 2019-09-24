//自定义异常类型
enum MyError:Error{
    //定义3种程度异常
    case DesToryError
    case NormalError
    case SimpleError
}

//print("should error")
//抛出异常
//throw MyError.DesToryError
//print("finish")

func MyFunc(param:Bool) throws -> Void{
    if param{
        print("success")
    }else{
        throw MyError.NormalError
    }
}

//使用do-catch进行异常捕获
do{
    //将可能异常的代码写在do中
    try MyFunc(param: false)
//进行异常类型匹配
}catch MyError.SimpleError{
    print("SimpleError")
}catch MyError.NormalError{
    print("NormalError")
}catch MyError.DesToryError{
    print("DesToryError")
}catch{
    print("otherError")
}

var temp = try? MyFunc(param: false)
//通过检查函数返回值是否nil判断有无错误发生，如果成功，返回void而不是nil
if temp == nil{
    print("执行失败")
}else{
    print("执行成功")
}

//使用匿名标识符来接受返回值
if let _ = try? MyFunc(param: false){
    print("success")
}else{
    print("failed")
}
