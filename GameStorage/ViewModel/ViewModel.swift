//
//  ViewModel.swift
//  GameStorage
//
//  Created by Sebastian Marquez Rojas on 06/11/2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import Firebase


class ViewModel:ObservableObject{
    @Published var show = false
    @Published var username : String?
    func login(email:String,pass:String, completion:@escaping(_ done:Bool)->Void){
        
        Auth.auth().signIn(withEmail: email, password: pass){(user,error) in
            if user != nil{
                print("LOGUEANDO")
                completion(true)
            }else{
                if let error = error?.localizedDescription{
                   print("error firebase",error)
                }else{
                    print("error en la app")
                }
            }
        }
        
    }
    func fetchUsername() {
            if let user = Auth.auth().currentUser {
                username = user.displayName
            }
        }
    
}

