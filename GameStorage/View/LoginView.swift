//
//  LoginView.swift
//  GameStorage
//
//  Created by Sebastian Marquez Rojas on 06/11/2023.
//


import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var login = ViewModel()
    @EnvironmentObject var loginShow:ViewModel
    var device = UIDevice.current.userInterfaceIdiom
    var body: some View {
        ZStack{
            (LinearGradient(gradient: Gradient(colors: [.blue,.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            ).ignoresSafeArea(.all)
            ZStack{
                (LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                ).ignoresSafeArea(.all)
                VStack(alignment: .center, spacing: 20)
                {

                    Text("Gamer Storage").font(.largeTitle).foregroundStyle(.white).bold().frame(alignment: .leading)
                    Spacer()
                    VStack{
                        TextField("Email", text: $email)
                            .border(Color.white)
                            .foregroundStyle(Color.black)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .frame(width: device == .pad ? 400 : nil)
                        
                        SecureField("Password", text: $pass)
                            .border(Color.white)
                            .foregroundStyle(Color.black)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: device == .pad ? 400 : nil)
                            .padding(.bottom,20)
                        
                        Button(action:{
                            login.login(email: email, pass: pass){(done) in
                                if done{
                                    UserDefaults.standard.set(true, forKey: "sesion")
                                    loginShow.show.toggle()
                                }
                            }
                        }){
                            Text("Entrar")
                                .font(.title)
                                .frame(width: 200)
                                .foregroundStyle(.white)
                                .padding(.vertical,10)
                                
                        }.background(Capsule().stroke(Color.white))
                            
                    }.padding(.all)
                    
                    
                Spacer()
                }
            }
            
        }
       
    }
}

