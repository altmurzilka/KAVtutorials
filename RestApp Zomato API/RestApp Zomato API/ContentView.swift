//
//  ContentView.swift
//  RestApp Zomato API
//
//  Created by Алтын on 7/23/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var obs = observer()
    
    var body: some View {
        
        NavigationView {
            List(obs.datas) {i in
                Card(image: i.image, name: i.name, weburl: i.webUrl, rating: i.rating)
                
            }
            .navigationBarTitle("Near By Restaurants")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class observer : ObservableObject {
    @Published var datas = [datatype]()
    
    init() {
        let url1 = "https://developers.zomato.com/api/v2.1/geocode?lat=13.0368&lon=80.2676"
        let api = "97bf5894b6b1058d320525344b534a2e"
        
        let url = URL(string: url1)
        var request = URLRequest(url: url!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(api, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        let sess = URLSession(configuration: .default)
        sess.dataTask(with: request ) {
            (data , _, _ ) in
            do {
                let fetch = try JSONDecoder().decode(Type.self, from: data!)
                print(fetch)
                
                for i in fetch.nearby_restaurants {
                    
                    DispatchQueue.main.async {
                        self.datas.append(datatype(id: i.restaurant.id, name: i.restaurant.name, image: i.restaurant.thumb, rating: i.restaurant.user_rating.aggregate_rating, webUrl: i.restaurant.url))
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
