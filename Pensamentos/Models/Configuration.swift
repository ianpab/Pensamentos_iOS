//
//  Configuration.swift
//  Pensamentos
//
//  Created by Ian Pablo on 01/09/20.
//  Copyright © 2020 pensamentos. All rights reserved.
//

import Foundation

enum UserDefaultKeys: String{
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autoRefresh = "autoRefresh"
}

class Configuration {
     
    
    let defaults = UserDefaults.standard
    
    static var shared: Configuration = Configuration()
    
    
    var timeInterval: Double{
        get{
            return defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int{
        get{
            return defaults.integer(forKey: UserDefaultKeys.colorScheme.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultKeys.colorScheme.rawValue)
        }
    }

    
    var autoRefresh: Bool {
        get{
            return defaults.bool(forKey: UserDefaultKeys.autoRefresh.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultKeys.autoRefresh.rawValue)
        }
    }
    
    init() {
        if defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue) == 0{
            defaults.set(8.0, forKey: UserDefaultKeys.timeInterval.rawValue)
        }
    }

}
