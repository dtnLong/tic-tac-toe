//
//  StoreData.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 13/08/2022.
//

import Foundation

struct StorageUtil {
    static func getData<T: Decodable>(key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                return nil
            }
        }
        return nil
    }
    
    static func storeData<T: Decodable>(key: String, data: T) -> Void {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                UserDefaults.standard.set(try JSONEncoder().encode(data), forKey: key)
            } catch {
                
            }
        }
    }
}
