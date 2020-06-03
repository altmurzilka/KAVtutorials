//
//  ContentView.swift
//  HeroAnimation
//
//  Created by алтынпончик on 6/2/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

// sample Data..
 
 struct Card : Identifiable {
     
     var id : Int
     var image : String
     var title : String
     var details : String
     var expand : Bool
 }
