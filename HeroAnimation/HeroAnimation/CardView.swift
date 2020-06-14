//
//  CardView.swift
//  HeroAnimation
//
//  Created by алтынпончик on 6/14/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var data : Card
    @Binding var hero : Bool
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(self.data.image)
                    .resizable()
                    .frame(height: self.data.expand ? 350 : 250)
                    .cornerRadius(self.data.expand ? 0 : 25)
                
                if self.data.expand{
                    HStack{
                        Text(self.data.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text(self.data.details)
                        .padding(.horizontal)
                    
                    HStack{
                        Text("Details")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    HStack(spacing: 0) {
                        Button( action: {
                            
                        }) {
                            Image("mcard1")
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button( action: {
                            
                        }) {
                            Image("mcard2")
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button( action: {
                            
                        }) {
                            Image("mcard3")
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button( action: {
                            
                        }) {
                            Image("mcard4")
                        }
                    }
                    .padding(.horizontal, 25)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        Text("Let's Go")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 15)
                }
            }
            .padding(.horizontal, self.data.expand ? 0 : 20)
            .contentShape(Rectangle())
            
            if self.data.expand {
                
                Button(action: {
                    
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        
                        self.data.expand.toggle()
                        self.hero.toggle()
                    }
                    
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.trailing,10)
            }
        }
    }
}

