//
//  User.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 06.08.2024.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
}

class UserManager {
    private let userKey = "savedUser"
    
    func saveUser(_ user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: userKey)
        }
    }
    
    func loadUser() -> User? {
        if let savedUserData = UserDefaults.standard.data(forKey: userKey) {
            if let user = try? JSONDecoder().decode(User.self, from: savedUserData) {
                return user
            }
        }
        return nil
    }
}
