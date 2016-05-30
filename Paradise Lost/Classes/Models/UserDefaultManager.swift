//
//  UserDefaultManager.swift
//  Paradise Lost
//
//  Created by Jason Chen on 5/26/16.
//  Copyright © 2016 Jason Chen. All rights reserved.
//

import Foundation

class UserDefaultManager {
    
    enum UserKey {
        case TZFEHighScore      // Int
        case TZFEScoreRecord    // Int
        case TZFETilesRecord    // [Int]
        
        var value: String {
            switch self {
            case .TZFEHighScore:
                return "TZFEHighScore"
            case .TZFEScoreRecord:
                return "TZFEScoreRecord"
            case .TZFETilesRecord:
                return "TZFETilesRecord"
            }
        }
    }
    
    class func registerDefaultsFromSettingsBundle() {
        guard let settingsBundle = NSBundle.mainBundle().pathForResource("Settings", ofType: "bundle") else {
            return
        }
        guard let settings = NSDictionary(contentsOfFile: settingsBundle.stringByAppendingString("/Root.plist")) else {
            return
        }
        guard let preferences = settings.objectForKey("PreferenceSpecifiers") as? Array<NSDictionary> else {
            return
        }
        // get the key and value
        var defaultsToRegister = [String : AnyObject].init(minimumCapacity: preferences.count)
        for prefSpec in preferences {
            guard let key = (prefSpec as NSDictionary).objectForKey("Key") as? String else {
                continue
            }
            guard let value = (prefSpec as NSDictionary).objectForKey("DefaultValue") as? String else {
                continue
            }
            defaultsToRegister.updateValue(value, forKey: key)
        }
        NSUserDefaults.standardUserDefaults().registerDefaults(defaultsToRegister)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    // should be private
    class func valueFromKeyString(key: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(key)
    }
    
    class func valueFromKeyEnum(key: UserKey) -> AnyObject? {
        return valueFromKeyString(key.value)
    }
    
    // should be private
    class func setValue(value: AnyObject?, forKeyString key: String) {
        let defaults = NSUserDefaults()
        defaults.setObject(value, forKey: key)
        defaults.synchronize()
    }
    
    class func setValue(value:AnyObject?, forKeyEnum key: UserKey) {
        setValue(value, forKeyString: key.value)
    }
}
