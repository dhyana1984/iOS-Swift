enum Sex{
    case Male
    case Female
}

class Student{
    let sex:Sex
    let name:String
    let age:Int
    init(sex:Sex, name:String, age:Int) {
        self.sex=sex
        self.name=name
        self.age=age
    }
    
    func Study(){
        print("\(self.name) is Studying...")
    }
}

let monitor = Student(sex:Sex.Male,name:"Tom",age:22)

monitor.Study()

class ClassRoom{
    let className: String
    var studentNumber:Int
    let monitor:Student
    init(_ className:String,_ studentNumber:Int,_ monitor:Student) {
        self.className=className
        self.studentNumber=studentNumber
        self.monitor=monitor
    }
    func addStudent(){
        studentNumber += 1
        print("Now the student number is \(studentNumber)")
    }
    func deleteStudent() {
        studentNumber -= 1
        print("Now the student number is \(studentNumber)")
    }
}

var cls = ClassRoom("Class",25,monitor)
cls.addStudent()

enum Subject{
        case Maths
        case English
        case Chinese
}

class Teacher{
    let subject: Subject
    let name: String
    var studentList: Array<Student>
    
    init(_ subject:Subject, _ name:String,_ studentList: Array<Student>) {
        self.subject = subject
        self.name = name
        self.studentList = studentList
    }
    
    func teach(){
        for item in self.studentList{
            item.Study()
        }
    }
}

let student1 = Student(sex:Sex.Male,name:"Andy",age:22)
let student2 = Student(sex:Sex.Male,name:"Jack",age:22)
let student3 = Student(sex:Sex.Male,name:"Tim",age:22)

let studentList = Array<Student>(arrayLiteral: student1,student2,student3)

let teacher = Teacher(Subject.Maths,"Marray",studentList)
teacher.teach()




