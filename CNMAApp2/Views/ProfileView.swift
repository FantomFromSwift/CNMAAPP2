//
//  ProfileView.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 06.08.2024.
//

import SwiftUI

struct ProfileView: View {
    
    
    @StateObject private var profileViewModel = ProfileViewModel()
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var userViewModel = UserViewModel()
    @AppStorage("email") private var email: String = ""
    @AppStorage("password") private var password: String = ""

    

    var body: some View {
        VStack {
            if let user = profileViewModel.user {
                Text("Email: \(email)")
                Text("Password: \(password)")
            } else {
                Text("No user data available")
            }

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Назад")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.top, 20)
            }

            Button(action: {
                // Выход из учетной записи
                userViewModel.toggleAuth()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Вийти")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.top, 10)
            }
        }
        .navigationTitle("Profile")
        .padding()
    }
}

#Preview {
    ProfileView()
}
