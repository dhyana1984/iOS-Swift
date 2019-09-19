import Foundation

let name = "China"
for c in name{
    print(c)
}

var obj1 = ""

if obj1.isEmpty{
    print("empty!")
}
if obj1.count == 0{
    print("empty!")
}

var str = "Hello-Swift"
var startIndex = str.startIndex
var endIndex = str.endIndex
var c1 = str[str.index(after: startIndex)]
var c2 = str[str.index(before: endIndex)]
print(c1,c2)

var c3 = str[startIndex...str.index(startIndex, offsetBy: 4)]
var c4 = str[str.index(endIndex,offsetBy: -5)..<endIndex]

str.replaceSubrange(str.startIndex...str.index(str.startIndex,offsetBy: 4) ,with: "Hi")

var s1 = "China"
var s2 = "MyLove"
var s3 = s1 + s2

for c in s3{
    if c == "L"{
        print("yes")
    }
}

var strRM = "swsvr!vrfe?123321!!你好!世界?"
var p = ""
for c in strRM{
    if c != "!"  && c != "?"{
        p.append(c)
    }
}
print(p)

var strOrder = "abcdefg"
var t = strOrder.sorted(by: >)
print(String(t))


var strInsert = "我爱你中国"
var res = ""
for index in strInsert.indices{
    res.append(strInsert[index])
    if(index < strInsert.index(before: strInsert.endIndex)){
        res.append("*")
    }
}
print(res)


var strReplace = "abc中国abc美国abc英国~德国abc法国abc"
var range = strReplace.range(of:"abc")

while range != nil{
    strReplace.replaceSubrange(range!, with: "Hello")
    range = strReplace.range(of:"abc")
    
}
print(strReplace)

var array:[Int] = []
for index in 0...9{
    array.append(index)
}

print(array)

var o = array.sorted(by:>)

print(o)

var dict=["王晓":98,"邹明":86,"李小伟":93]
for item in dict.sorted(by: { (std1,std2) -> Bool in
        return std1.value < std2.value
}){
    print(item)
}
