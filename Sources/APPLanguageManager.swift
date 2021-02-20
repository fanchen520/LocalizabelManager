//
//  APPLanguageManager.swift
//  Runner
//
//  Created by 王太炬 on 2021/1/26.
//

#if !os(macOS)
import UIKit

let APPUserLanguageKey:String = "CLUserLanguageKey"
class APPLanguageManager: NSObject {
    class func setUserLanguage(userLaguage:String){
        NotificationCenter.default.post(name: NSNotification.Name("AppLanguage"), object: nil, userInfo: ["laungage" : userLaguage])
        if (userLaguage.isEmpty) {
            resetSystemLanguage()
            return
        }
        UserDefaults.standard.setValue(userLaguage, forKey: APPUserLanguageKey);
        UserDefaults.standard.setValue([userLaguage], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
    class func getUserLanguage()->String{
        return (UserDefaults.standard.value(forKey: APPUserLanguageKey) as? String) ?? getAppDefaultLanguage()
    }
    
    //获取APP默认语言
    static func getAppDefaultLanguage()->String{
        return Locale.preferredLanguages.first!;
    }
    
    static func resetSystemLanguage(){
        UserDefaults.standard.removeObject(forKey: APPUserLanguageKey)
        UserDefaults.standard.removeObject(forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
}
#endif
