import  Foundation

struct Line{
    init(_ firstPoint:(Double,Double),_ secondPoint:(Double,Double)) {
        self.firstPoint = firstPoint
        self.secondPoint = secondPoint
        xShape  = secondPoint.0 - firstPoint.0
        yShape =  secondPoint.1 - firstPoint.1
    }
    var firstPoint:(Double,Double)
    var secondPoint:(Double,Double)
    //中心点
    var centerPoint:(Double,Double){
        get{
            return ((firstPoint.0+secondPoint.0)/2,(firstPoint.1+secondPoint.1)/2)
        }
    }
    
    var k: Double{
        return (firstPoint.1-secondPoint.1 )/(firstPoint.0-secondPoint.0)
    }
    
    var width : Double{
        return sqrt(xShape*xShape+yShape*yShape)
    }
    
   private var xShape : Double
   private var yShape : Double
}

var line = Line((1,2),(3,4))

line.centerPoint
line.k
line.width
