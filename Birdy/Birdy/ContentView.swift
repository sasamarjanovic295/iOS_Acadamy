//
//  ContentView.swift
//  Birdy
//
//  Created by student on 06.12.2022..
//

import SwiftUI

struct Bird {
    
    var greeting: String {
        return "Chirp!  "
    }
    func greet(){
        print("Tweet!")
    }
    
    func test(){
        
        let bird = Bird()
        bird.greet()
        
    }
}

struct ContentView: View {
    
    
    let tweets: [TweetModel] = [
        TweetModel(
            content: "Tweet1",
            username: "username",
            date: Date(),
            image: "crow",
            isFavorite: true
        ),
        TweetModel(
            content: "Tweet 2",
            username: "username",
            date: Date(),
            image: "crow",
            isFavorite: false
        ),
        TweetModel(
            content: "Tweet 3",
            username: "username",
            date: Date(),
            image: "crow",
            isFavorite: true
        )
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Title").font(.title).bold()
                Spacer()
                Button(action: {} ) {
                    Text("Login!")
                }
            }
            Spacer()
            List(tweets){
                tweet in Tweet(tweet: tweet)
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
