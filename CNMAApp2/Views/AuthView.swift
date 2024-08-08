//
//  AuthView.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 06.08.2024.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var userViewModel = UserViewModel()
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = true
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("email") private var emailApp: String = ""
    @AppStorage("password") private var passwordApp: String = ""
    @State  var error: Bool = false


    var body: some View {
        VStack(spacing: 10) {
            
            Text(userViewModel.isAuth ? "Авторизация" : "Реєстрація")
                .padding(userViewModel.isAuth ? 16 : 24)
                .padding(.horizontal, 40)
                .font(.title2.bold())
                .background(Color("WhiteAlpha"))
                .cornerRadius(userViewModel.isAuth ? 30 : 40)
                .offset(y: -70)
            
            VStack {
                if error {
                    Text("Невірні  данні")
                        .foregroundStyle(.red)
                    
                }
                TextField("Email", text: $email)
                    .padding()
                    .background(Color("WhiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Пароль", text: $password)
                    .padding()
                    .background(Color("WhiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !userViewModel.isAuth {
                    SecureField("Повторіть пароль", text: $userViewModel.confirmPassword)
                        .padding()
                        .background(Color("WhiteAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if userViewModel.isAuth {
                        if email != emailApp || password != passwordApp {
                            error = true
                        } else {
                            isAppLockEnabled = true
                        }
                    } else {
                        if email.isEmpty || password.isEmpty {
                            error = true
                        } else {
                            emailApp = email
                            passwordApp = password
                            isAppLockEnabled = true
                        }
                    }
                } label: {
                    Text(userViewModel.isAuth ? "Вхід" : "Створити аккаунт")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("BL"), Color("DK")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .foregroundColor(.white)
                }
                
                Button {
                    userViewModel.toggleAuthMode()
                } label: {
                    Text(userViewModel.isAuth ? "Зареєструватися" : "Вже маю аккаунт")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, 20)
            .background(Color.black)
            .cornerRadius(20)
            .padding(userViewModel.isAuth ? 20 : 10)
            .offset(y: -70)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg").resizable().ignoresSafeArea().blur(radius: userViewModel.isAuth ? 0 : 3))
        .animation(Animation.easeInOut(duration: 0.3), value: userViewModel.isAuth)
    }
}

#Preview {
    ContentView()
}
