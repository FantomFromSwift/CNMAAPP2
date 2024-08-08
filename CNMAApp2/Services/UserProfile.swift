//
//  UserProfile.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 06.08.2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: User?

    private let userManager = UserManager()

    init() {
        user = userManager.loadUser()
    }
}
