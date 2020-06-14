//
//  Home.swift
//  DarkModeMenu
//
//  Created by алтынпончик on 6/15/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: .leading){
            GeometryReader {_ in
                VStack {
                    Text("DM MENU")
                }
            }
            Menu()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
