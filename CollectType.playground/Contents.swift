var array1:[Int]
var array2:Array<Int>
//重复创建
var array3 = [String](repeating: "Hello", count: 10)
var array = [1,2,3,4,5,6,7,8,9]
array.count
var subArray = array[0...3]
array.first
array.contains(1)

let arrayLet2 = [(1,2),(2,3),(3,4)]
for item in array{
    print(item)
}

for index in arrayLet2.indices{
    print(arrayLet2[index])
}
array = array.sorted(by: >)

var set1 = Set(arrayLiteral: 1,2,3)
var set2 :Set<Int> = [1,2,3,4]
var set3:Set<Int> = [1,2,3,4]
var set4:Set<Int> = [1,2,5,6]

var setInter = set3.intersection(set4)

set1.isSubset(of: set3)


var dic1:[Int:String]
var dic2:Dictionary<Int,String>
dic1 = [1:"1",2:"2",3:"3"]
dic2 = Dictionary(dictionaryLiteral: (1,"1"),(2,"2"),(3,"3"))


dic1.updateValue("5", forKey: 1)
if let oldValue = dic1.updateValue("8", forKey: 2){
    print("Old value is \(oldValue)")
}

print(dic1)

