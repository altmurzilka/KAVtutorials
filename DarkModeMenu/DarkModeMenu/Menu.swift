//
//  Menu.swift
//  DarkModeMenu
//
//  Created by алтынпончик on 6/15/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            HStack {
                Button (action: {
                    
                }) {
                    Image(systemName: "delete.left")
                        .resizable()
                        .frame(width: 12, height: 20)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            Image(systemName: "person")
                .resizable()
                .frame(width: 80, height: 80)
            clipShape(Circle())
            
            VStack(spacing: 12) {
                Text("User")
                Text("iOS developer")
                    .font(.caption)
            }
            .padding(.top, 25)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .padding(.horizontal, 20)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
