

//计算阶乘函数
func factorialFunc(par:Int) -> Int{
    var res = par
    var i = par - 1
    while i>0 {
       
       res *= i
        i -= 1
    }
   return res
}

factorialFunc(par: 5)

//判断输入是否为数字字符
func digitalCharCheck(par: Character) -> Bool{
    return par >= "0" && par <= "9"
    
}

digitalCharCheck(par: "a")

//合并两个整数a,b。
//a的十位和个位分别放在c的千位和个位，b的十位和个位分别放在c的百位和十位

func combineInts(p1: Int,p2: Int) -> Int{
    let a1 = (p1 / 10) % 10
    let a2 = p1 % 10
    let b1 = (p2 / 10) % 10
    let b2 = p2 % 10
    
    return a1*1000 + a2 +  b1*100 + b2*10
    
}

combineInts(p1:12345, p2:67890)


//转换字符串大小写
func uperLower(str:String) ->String{
    var res = ""
    for s in str{
        if s>="a" && s<="z" {
            res.append(String(s).uppercased())
        }else if s>="A" && s<="Z"{
            res.append(String(s).lowercased())
        }else{
            res.append(s)
        }
    }
    return res
}

uperLower(str:"aasSDGHDaSDASaDg")

//将一个大于0的数字所有正奇数正偶数的和以元组形式返回
func returnTuple(par:Int) ->(Int,Int){
    guard par>0 else {
        return (0,0)
    }
    var sumOdd = 0
    var sumEvn = 0
    for i in 1...par{
        if i % 2 == 0{
            sumEvn += i
        }else{
            sumOdd += i
        }
    }
    
    return (sumOdd,sumEvn)
}

returnTuple(par: 5)

//输入不定个数一组数值，统计正数和负数的个数

func countNumber(par : Int...) ->(Int,Int){
    var sum1 = 0
    var sum2 = 0
    for i in par{
        if i>0{
            sum1+=1
        }
        else if i<0{
            sum2+=1
        }
    }
    return (sum1,sum2)
}
countNumber(par:1,2,3,4,5,-2)

//计算园的周长和面积
func calculateCircle(r:Double) ->(Double,Double){
    return (2 * Double.pi * r, Double.pi * r * r)
}

calculateCircle(r:4)

//输入不定个数整数，求最大值和最小值返回值

func minAndMax(par:Int...) -> (Int,Int){
    return (par.max()!,par.min()!)
}

minAndMax(par: 1,2,3,4,5)

//使用闭包风格模拟Dictinary数据遍历
let dic:Dictionary = [1:"1",2:"2",3:"3",4:"4",5:"5"]

//通过闭包向函数传递遍历结果
func MyEnumDic(dic:Dictionary<Int,String>,
               closure:(_ key:Int,_ value:String) -> Bool){
    for item in dic{
        //执行闭包
        if closure(item.0, item.1){
            //如果闭包返回值为true则中断遍历
                return
        }
    }
}

MyEnumDic(dic:dic){ (key,value) -> Bool in
    if(key == 3){
        print(value)
        return true
    }
    print(value)
    return false
    
}




