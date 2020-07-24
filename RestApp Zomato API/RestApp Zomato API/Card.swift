//
//  Card.swift
//  RestApp Zomato API
//
//  Created by Алтын on 7/25/20.
//

import SwiftUI
import SDWebImageSwiftUI
import WebKit

struct Card: View {
    var image = ""
    var name = ""
    var weburl = ""
    var rating = ""
    
    var body : some View{
        
        NavigationLink(destination: register(url: weburl, name: name)) {
            
            HStack{
                
                AnimatedImage(url: URL(string: image)!).resizable().frame(width: 100, height: 100).cornerRadius(10)
                
                VStack(alignment: .leading) {
                    
                    Text(name).fontWeight(.heavy)
                    Text(rating)
                }.padding(.vertical, 10)
                
            }
        }
    }
}


struct register : View {
    
    var url = ""
    var name = ""
    
    var body : some View{
        
        WebView(url: url).navigationBarTitle(name)
    }
}


struct WebView : UIViewRepresentable {
    
    var url = ""
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        let web = WKWebView()
        web.load(URLRequest(url: URL(string: url)!))
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
