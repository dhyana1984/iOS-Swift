func myFunc(param:Int) ->Int{
    return param * param
}
myFunc(param: 2)

//闭包实现上面函数
let myClosures = {
    (param:Int)  in
        return param * param
}
myClosures(6)
