//
//  BirdyApp.swift
//  Shared
//
//  Created by Saša Marjanović on 12.12.2022..
//

import SwiftUI

let IMAGE_URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/a9/Corvus_corone_-near_Canford_Cliffs%2C_Poole%2C_England-8.jpg")!

@main
struct BirdyApp: App {
    
    @StateObject var tweetData = TweetData()
    @StateObject var userData = UserData()

    
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        Label("Feed", systemImage: "list.bullet.circle")
                    }
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass.circle")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .environmentObject(tweetData)
            .environmentObject(userData)
            .task(tweetData.fetchTweets)
        }
    }
}
