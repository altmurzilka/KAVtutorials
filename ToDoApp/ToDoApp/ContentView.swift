//
//  ContentView.swift
//  ToDoApp
//
//  Created by алтынпончик on 6/27/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var edit = false
    @State var show = false
    @EnvironmentObject var obs : Observer
    @State var selected : type = .init(id: "", title: "", msg: "", time: "", day: "")
    
    var body: some View {
        
        
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.bottom)
            
            VStack{
                
                VStack(spacing : 5){
                    
                    HStack{
                        
                        Text("ToDo").font(.largeTitle).fontWeight(.heavy)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.edit.toggle()
                            
                        }) {
                            
                            Text(self.edit ? "Done" : "Edit")
                        }
                        
                    }.padding([.leading,.trailing], 15)
                        .padding(.top, 10)
                    
                    Button(action: {
                        
                        self.selected = type(id: "", title: "", msg: "", time: "", day: "")
                        self.show.toggle()
                        
                    }) {
                        
                        Image(systemName: "plus").resizable().frame(width: 25, height: 25).padding()
                        
                    }.foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Circle())
                        .padding(.bottom, -15)
                        .offset(y: 15)
                    
                    
                }.background(Rounded().fill(Color.white))
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10){
                        
                        ForEach(self.obs.datas){i in
                            
                            CellView(edit: self.edit, data: i).onTapGesture {
                                
                                self.selected = i
                                self.show.toggle()
                                
                            }.environmentObject(self.obs)
                        }
                        
                    }.padding()
                    
                }.padding(.top, 30)
                
            }.sheet(isPresented: $show) {
                
                SaveView(show: self.$show, data: self.selected).environmentObject(self.obs)
            }
            
        }
    }
}


struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
}


struct multiline : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> multiline.Coordinator {
        
        return multiline.Coordinator(parent1: self)
        
    }
    func makeUIView(context: UIViewRepresentableContext<multiline>) -> UITextView{
        
        let textview = UITextView()
        textview.font = .systemFont(ofSize: 18)
        textview.delegate = context.coordinator
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multiline>) {
        
        uiView.text = txt
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : multiline
        
        init(parent1 : multiline) {
            
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
