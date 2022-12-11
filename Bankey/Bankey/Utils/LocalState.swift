//
//  LocalState.swift
//  Bankey
//
//  Created by Ali Butt on 11/12/2022.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case haseOnboarded
    }
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.haseOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.haseOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
