//
//  Home.swift
//  GameStorage
//
//  Created by Sebastian Marquez Rojas on 06/11/2023.
//


import SwiftUI

struct Home: View {
    @State private var index = "Playstation"
    @State private var menu = false
    @State private var widthMen = UIScreen.main.bounds.width
    var device = UIDevice.current.userInterfaceIdiom
    @Environment(\.horizontalSizeClass) var width
    
    func GetColumns()->Int{
        return (device == .pad ) ? 3 : ((device == .phone && width == .regular) ? 3:1)
    }
    
    var body: some View {
        ZStack{
            VStack{
                NavBar(index: $index, menu: $menu)
                ZStack{
                    switch index{
                    case "Playstation":
                        VStack{
                            Color.blue
                        }
                    case "Xbox":
                        VStack{
                            Color.green
                        }
                    case "Nintendo":
                        VStack{
                            Color.red
                        }
                    case "Pc":
                        ScrollView(.vertical,showsIndicators: false) {
                            LazyVGrid(columns:Array(repeating: GridItem(.flexible(),spacing:20), count: GetColumns()),spacing: 20){
                                ForEach(1...9,id: \.self){ _ in
                                    CardView()
                                        .padding(.all)
                                }
                                
                            }}
                    default:
                        VStack{
                            Text("")
                        }
                    }
                }
            }.shadow(radius: 10)
            // empieza el menu iphone
            
            if menu{
                HStack(){
                 Spacer()
                    VStack{
                        HStack{
                            Spacer()
                            Button(action:{
                                withAnimation{
                                    menu.toggle()
                                }
                            }){
                                Image(systemName: "xmark")
                                    .font(.system(size: 22,weight: .bold))
                                    .foregroundStyle(.white)
                                
                            }
                        }.padding()
                        .padding(.top,50)
                        VStack(alignment:.trailing){
                            ButtonView(index: $index, menu: $menu, title: "Playstation")
                            ButtonView(index: $index, menu: $menu, title: "Nintendo")
                            ButtonView(index: $index, menu: $menu, title: "Xbox")
                            ButtonView(index: $index, menu: $menu, title: "Pc")
                        }
                        Spacer()
                    }.background(Color.purple)
                        .frame(width: widthMen - widthMen/2)
                }
                
            }
            
        }.background(Color.white.opacity(0.9))
        
    }
    
}

