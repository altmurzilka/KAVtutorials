//
//  Home.swift
//  HeroAnimation
//
//  Created by алтынпончик on 6/4/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var data = [
        
        Card(id: 0, image: "p2", title: "USA", details: "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean. Major Atlantic Coast cities are New York, a global finance and culture center, and capital Washington, DC. Midwestern metropolis Chicago is known for influential architecture and on the west coast, Los Angeles' Hollywood is famed for filmmaking.", expand: false),
        Card(id: 1, image: "p3", title: "Canada", details: "Canada is a country in the northern part of North America. Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country by total area.", expand: false),
        Card(id: 2, image: "p4", title: "Australia", details: "Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands. It is the largest country in Oceania and the world's sixth-largest country by total area.", expand: false),
        Card(id: 3, image: "p5", title: "Germany", details: "Germany is a Western European country with a landscape of forests, rivers, mountain ranges and North Sea beaches. It has over 2 millennia of history. Berlin, its capital, is home to art and nightlife scenes, the Brandenburg Gate and many sites relating to WWII. Munich is known for its Oktoberfest and beer halls, including the 16th-century Hofbräuhaus. Frankfurt, with its skyscrapers, houses the European Central Bank.", expand: false),
        Card(id: 4, image: "p6", title: "Dubai", details: "Dubai is a city and emirate in the United Arab Emirates known for luxury shopping, ultramodern architecture and a lively nightlife scene. Burj Khalifa, an 830m-tall tower, dominates the skyscraper-filled skyline. At its foot lies Dubai Fountain, with jets and lights choreographed to music. On artificial islands just offshore is Atlantis, The Palm, a resort with water and marine-animal parks.", expand: false),
        
        Card(id: 5, image: "p1", title: "London", details: "London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.", expand: false)
    ]
    
    @State var hero = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Sunday, June 2020")
                            Text("Today")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        
                        Image("pic")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Capsule())
                    }
                    .padding()
                    
                    VStack(spacing: 15) {
                        
                        ForEach(0..<self.data.count) { i in
                            GeometryReader{g in
                                CardView(data: self.$data[i], hero: self.$hero)
                                    .offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0)
                                    .opacity(self.hero ? (self.data[i].expand ? 1 : 0) : 1)
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                            
                                            if !self.data[i].expand {
                                                
                                                self.hero.toggle()
                                                self.data[i].expand.toggle()
                                            }
                                        }
                                }
                            }
                            .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : 250)
                            .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 500).onChanged({ (_) in
                                
                                print("dragging")
                            }))
                        }
                    }
                }
            }
        }
    }
}
