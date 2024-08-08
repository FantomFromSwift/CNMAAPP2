//
//  UserAuth.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 06.08.2024.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isAuth: Bool = true // true для входа, false для регистрации
    @Published var isLoggedIn: Bool = false // Обновленное состояние авторизации
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false



    private let userDefaults = UserDefaults.standard

    func logIn() -> Bool {
        if email.isEmpty || password.isEmpty {
            return false
        }
        let savedPassword = userDefaults.string(forKey: email)
        if savedPassword == password {
            isLoggedIn = true
            isAppLockEnabled = true
            return true
        }
        return false
    }

    func signUp() -> Bool {
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            return false
        }
        if password != confirmPassword {
            return false
        }
        userDefaults.set(password, forKey: email)
        isLoggedIn = true
        return true
    }

    func toggleAuthMode() {
        isAuth.toggle()
    }
    func toggleAuth() {
        isAppLockEnabled = false
    }
}
