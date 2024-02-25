//
//  ContentView.swift
//  GameStorage
//
//  Created by Sebastian Marquez Rojas on 06/11/2023.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var loginShow: ViewModel
    var body: some View {
        return Group{
            if loginShow.show{
                Home()
                    .ignoresSafeArea(.all)
                    
            }else{
                LoginView()
            }
        }.onAppear{
            if (UserDefaults.standard.object(forKey: "sesion")) != nil{
                loginShow.show = true
            }
        }
    }
}
