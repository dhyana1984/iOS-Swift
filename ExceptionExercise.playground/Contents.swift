enum AchieveError:Error{
    case achiveError
}

func printAchieve(_ marks:Int) throws{
    
    switch marks {
    case 0 ..< 60 :
        print("F")
    case 60 ..< 70:
        print("D")
    case 70 ..< 80:
        print("C")
    case 80 ..< 90:
        print("B")
    case 90 ..< 100:
        print("A")
    case 100:
        print("Excellent")
    default:
        throw AchieveError.achiveError
    }
    
}

func getArchieve(_ marks:Int){
    do{
        try printAchieve(marks)
    }catch AchieveError.achiveError{
        print("Ivalid marks!")
    }catch{
        print("Error happened")
    }
}

getArchieve(100 )
