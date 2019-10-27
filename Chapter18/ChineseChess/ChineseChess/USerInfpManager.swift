//保存用户设置

import UIKit

class USerInfpManager: NSObject {
    //获取用户音频b设置状态
    class func getAudioState() -> Bool{
        let isOn = UserDefaults.standard.string(forKey: "audioKey")
        if let on = isOn {
            return on == "on"
        }
        return true
    }
    
    //进行用户音频设置状态的存储
    class func setAudioSate(isOn:Bool){
        let state = isOn ? "on" : "off"
        UserDefaults.standard.set(state, forKey: "audioKey")
        UserDefaults.standard.synchronize()
    }

}
