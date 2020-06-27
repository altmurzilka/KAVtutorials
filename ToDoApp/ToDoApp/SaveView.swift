//
//  SaveView.swift
//  ToDoApp
//
//  Created by алтынпончик on 6/28/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct SaveView: View {
    
    @State var msg = ""
    @State var title = ""
    @Binding var show : Bool
    @EnvironmentObject var obs : Observer
    var data : type
    
    var body : some View{
        
        VStack(spacing : 12){
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    if self.data.id != ""{
                        
                        self.obs.update(id: self.data.id, msg: self.msg, title: self.title)
                    }
                    else{
                        
                        self.obs.add(title: self.title, msg: self.msg, date: Date())
                    }
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Save")
                }
            }
            
            TextField("Title", text: $title)
            
            Divider()
            
            multiline(txt: $msg)
            
        }.padding()
            .onAppear {
                
                self.msg = self.data.msg
                self.title = self.data.title
                
        }
    }
}

