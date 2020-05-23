//
//  ContentView.swift
//  Movie Ratings
//
//  Created by алтынпончик on 5/21/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

// API key 3d19363f85ab4a409c9fb1d53e5b61e3

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var obs = observer()
    var body: some View {
        NavigationView {
            List(obs.moviesList){i in
                NavigationLink(destination: MovieDetails(movie: i)){
                    ListRow(url: i.poster_path, name: i.original_title, rating: i.vote_average, overview: i.overview)
                }
            }
            .navigationBarTitle("Movie Ratings")
        }
    }
}


class observer : ObservableObject {
    
    @Published var moviesList = [Movie]()
    
    init() {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=3d19363f85ab4a409c9fb1d53e5b61e3&language=en-US&page=1"
        let sess = URLSession(configuration: .default)
        
        sess.dataTask(with: URL(string: url)!) {(data, _, _) in
            do{
                let fetch = try JSONDecoder().decode(dataType.self, from: data!)
                
                DispatchQueue.main.async {
                    self.moviesList = fetch.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


struct dataType: Decodable {
    var results : [Movie]
}

struct ListRow : View {
    
    var url = ""
    var name = ""
    var rating : CGFloat = 0
    var overview = ""
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(url)")).resizable().clipShape(RoundedRectangle(cornerRadius: 25.0)).frame(width: 150, height: 150)
            
            VStack {
                Text(name).fontWeight(.heavy)
                Text("Rating = \(rating)")
                Text(overview).lineLimit(2)
            }
        }
    }
}

struct MovieDetails : View {
    
    var movie: Movie
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
            HStack {
                Text("Description").foregroundColor(.gray)
                Spacer()
            }
            Text(movie.overview).lineLimit(nil)
            Spacer()
        }.navigationBarTitle(Text(movie.original_title), displayMode: .inline)
            .padding()
    }
}
