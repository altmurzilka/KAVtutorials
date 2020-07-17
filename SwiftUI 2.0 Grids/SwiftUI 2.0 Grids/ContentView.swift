//
//  ContentView.swift
//  SwiftUI 2.0 Grids
//
//  Created by Алтын on 7/17/20.
//

/// https://www.youtube.com/watch?v=kF4yFSiOee0

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
    
    @State var Languages : [Language] = [
        Language(id: 0, lang: "English"),
        Language(id: 1, lang: "Spanish"),
        Language(id: 2, lang: "German"),
        Language(id: 3, lang: "Japanese"),
        Language(id: 4, lang: "Chinese"),
        Language(id: 5, lang: "Korean"),
        Language(id: 6, lang: "Kazakh"),
    ]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    
    @Namespace var namespace
    
    @State var selected : [Language] = []
    
    var body : some View {
        
        NavigationView {
            ScrollView {
                
                if !self.Languages.isEmpty {
                    LazyVGrid(columns: columns, spacing: 15) {
                        
                        ForEach(self.Languages) { language in
                            Text(language.lang)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: language.id, in: self.namespace)
                                .onTapGesture {
                                    self.selected.append(language)
                                    
                                    self.Languages.removeAll { (lang) ->
                                        Bool in
                                        
                                        if lang.id == language.id {
                                            return true
                                        } else {
                                            return false
                                        }
                                    }
                                }
                        }
                    }
                    .padding(.all)
                }
                
                HStack {
                    Text("Selected Language")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    
                    ForEach(self.selected) { language in
                        Text(language.lang)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 100)
                            .background(Color.green)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: language.id, in: self.namespace)
                            .onTapGesture {
                                self.Languages.append(language)
                                
                                self.selected.removeAll { (lang) ->
                                    Bool in
                                    
                                    if lang.id == language.id {
                                        return true
                                    } else {
                                        return false
                                    }
                                }
                            }
                    }
                }
                .padding(.all)
            }
            .navigationTitle("Choose Language")
            .navigationBarTitleDisplayMode(.inline)
        }
        .animation(.easeOut)
    }
}


struct Language : Identifiable {
    var id : Int
    var lang: String
}
