//
//  ContentView.swift
//  Shared
//
//  Created by Saša Marjanović on 12.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginViewPresented = false
    
    @State var content: String = ""
    
    @EnvironmentObject var tweetData: TweetData
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        VStack {
            HStack {
                Text(userData.username.isEmpty ? "Birdy" : userData.username)
                    .font(.title)
                Spacer()
                Button(action: {
                    isLoginViewPresented = true
                } ) {
                    Text("Login!")
                }
            }
            Spacer()
            List($tweetData.tweets){
                tweet in Tweet(tweet: tweet)
            }
            .listStyle(.plain)
            Spacer()
            HStack{
                
                TextField("Content", text: $content)
                
                Button(action: {
                    tweetData.tweets.append(TweetModel(
                        content: content,
                        username: userData.username,
                        date: Date(),
                        image: "crow"))
                    content=""
                }){
                    Text("New Tweet")
                }
                .disabled(content.isEmpty)
            }
        }
        .padding()
        .sheet(isPresented: $isLoginViewPresented, content: {
            LoginView(username: $userData.username, isPresented: $isLoginViewPresented)})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TweetData())
            .environmentObject(UserData())
    }
}
