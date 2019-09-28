//子弹类
class Bullet{
    //子弹位置
    var place:Int
    //子弹速度
    static var speed:Int = 30
    //飞行方法
    func fly(){
        self.place += Bullet.speed
    }
    
    init(place:Int) {
        self.place = place
    }
    
    deinit {
        print("Hit target!")
    }
}

//敌人类
class Enemy{
    //敌人位置
    var place:Int
    //敌人速度
    static var speed:Int = 10
    //飞行方法
    func escape(){
        self.place += Enemy.speed
    }
    
    init(place:Int) {
        self.place = place
    }
    
    deinit {
        print("Enemy down!")
    }
    
}
//因为最终需要销毁子弹和敌人，所以要赋值为nil，那么需要定义为Optional类型
var bullet:Bullet? = Bullet(place: 0)
var enemy:Enemy? = Enemy(place: 300)

var i = 0
while enemy!.place > bullet!.place{
    bullet!.fly()
    enemy!.escape()
    i += 1
    print("This is the round \(i)")
}
bullet = nil
enemy = nil
