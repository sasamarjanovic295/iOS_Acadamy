//
//  ContentView.swift
//  Shared
//
//  Created by Saša Marjanović on 12.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State var username = ""
    
    @State var isLoginViewPresented = false
    
    @State var content: String = ""
    
    @State var tweets: [TweetModel] = [
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
                Text(username.isEmpty ? "Birdy" : username)
                    .font(.title)
                Spacer()
                Button(action: {
                    isLoginViewPresented = true
                } ) {
                    Text("Login!")
                }
            }
            Spacer()
            List($tweets){
                tweet in Tweet(tweet: tweet)
            }
            .listStyle(.plain)
            Spacer()
            HStack{
                
                TextField("Content", text: $content)
                
                Button(action: {
                    tweets.append(TweetModel(
                        content: content,
                        username: username.isEmpty ? "username" : username,
                        date: Date(),
                        image: "crow",
                        isFavorite: false))
                    content=""
                }){
                    Text("New Tweet")
                }
                .disabled(content.isEmpty)
            }
        }
        .padding()
        .sheet(isPresented: $isLoginViewPresented, content: {
            LoginView(username: $username, isPresented: $isLoginViewPresented)})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
