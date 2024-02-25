//
//  NavBar.swift
//  GameStorage
//
//  Created by Sebastian Marquez Rojas on 06/11/2023.
//

import SwiftUI
import Firebase
struct NavBar: View {
    var device = UIDevice.current.userInterfaceIdiom
    @Binding var index:String
    @Binding var menu:Bool
    @EnvironmentObject var loginShow : ViewModel
    @ObservedObject var userViewModel = ViewModel()
    var body: some View {
        HStack{
            Text("My games")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .font(.system(size: device == .phone ? 25 : 35))
                
            Spacer()
            if device == .pad{
                //menu ipad
                HStack(spacing:25){
                    ButtonView(index: $index, menu: $menu, title: "Playstation")
                    ButtonView(index: $index, menu: $menu, title: "Nintendo")
                    ButtonView(index: $index, menu: $menu, title: "Xbox")
                    ButtonView(index: $index, menu: $menu, title: "Pc")
                    Text("Conectado como:")
                                if let username = userViewModel.username {
                                    Text(username)
                                        .font(.title)
                                } else {
                                    Text("Nombre de usuario desconocido")
                                }
                    Button(action:{
                        try! Auth.auth().signOut()
                        UserDefaults.standard.removeObject(forKey: "sesion")
                        loginShow.show = false
                    }){
                        Text("Cerrar sesion")
                            .font(.title)
                            .frame(width: 200)
                            .foregroundStyle(.white)
                            .padding(.horizontal,25)
                            .background(Capsule().stroke(.white))
                        
                    }
                }
            }else{
                //menu iphone
                
                Button(action:{
                    withAnimation{
                        menu.toggle()
                    }
                }){
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 26))
                        .foregroundStyle(.white)
                }
                
            }
        }
        .onAppear {
                    userViewModel.fetchUsername()
                }
        .padding(.top,30)
        .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.blue,.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        
    }
    
}
