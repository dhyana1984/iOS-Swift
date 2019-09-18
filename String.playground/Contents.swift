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
