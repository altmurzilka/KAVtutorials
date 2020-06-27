//
//  CellView.swift
//  ToDoApp
//
//  Created by алтынпончик on 6/28/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct CellView: View {
    
    var edit : Bool
    var data : type
    @EnvironmentObject var obs : Observer
    
    var body : some View{
        
        HStack{
            
            if edit{
                
                Button(action: {
                    
                    if self.data.id != ""{
                        
                        self.obs.delete(id: self.data.id)
                    }
                    
                }) {
                    
                    Image(systemName: "minus.circle").font(.title)
                    
                }.foregroundColor(.red)
            }
            
            Text(data.title).lineLimit(1)
            
            Spacer()
            
            VStack(alignment: .leading,spacing : 5){
                
                Text(data.day)
                Text(data.time)
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
            .animation(.spring())
        
    }
}
