//
//  CardView.swift
//  GameStorage
//
//  Created by Sebastian Marquez Rojas on 06/11/2023.
//



import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(spacing:20){
            Image("LostArk")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
            
                
            Text("Lost Ark")
                .font(.title)
                .bold()
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(colors: [.yellow, .black,.yellow,.yellow]), startPoint: .top, endPoint: .bottom)
                )
            
        }
        .padding()
        .background(Color.white)
        .clipped()
        .shadow(radius: 10)
    }
}


