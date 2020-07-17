//
//  ContentView.swift
//  SwiftUI 2.0 Grids
//
//  Created by Алтын on 7/17/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    var body : some View {
        ScrollView {
            
        }
    }
}

var Languages : [Language] = [
    Language(id: 0, lang: "English"),
    Language(id: 1, lang: "Spanish"),
    Language(id: 2, lang: "German"),
    Language(id: 3, lang: "Japanese"),
    Language(id: 4, lang: "Chinese"),
    Language(id: 5, lang: "Korean"),
    Language(id: 6, lang: "Kazakh"),
]

struct Language : Identifiable {
    var id : Int
    var lang: String
}
