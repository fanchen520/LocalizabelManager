//
//  APPBundle.swift
//  Runner
//
//  Created by 王太炬 on 2021/1/26.
//

#if !os(macOS)
import UIKit

public class APPBundle: Bundle {
    //使用需要在AppDelegate的 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions 方法中调用
    public class func resetBundle(){
        object_setClass(Foundation.Bundle.main, APPBundle.self)
    }
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if !APPBundle.currentLanguage().isEmpty {
            var path = Bundle.main.path(forResource: APPBundle.currentLanguage(), ofType: "lproj")
            if APPBundle.isChineseLanguage() {
                path = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")
            }
            if path != nil && !path!.isEmpty {
                return Bundle.init(path: path!)?.localizedString(forKey: key, value: value, table: tableName) ?? super.localizedString(forKey: key, value: value, table: tableName)
            }
        }
        return super.localizedString(forKey: key, value: value, table: tableName)
    }    
}

extension Bundle{
    class func isChineseLanguage()->Bool{
        if (currentLanguage().hasPrefix("zh-Hans")) {
            return true
        }
        return false
    }
    
    class func currentLanguage() ->String{
        return APPLanguageManager.getUserLanguage()
    }
    
}
#endif

