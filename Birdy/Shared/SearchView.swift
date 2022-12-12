//
//  SearchView.swift
//  Birdy (iOS)
//
//  Created by Saša Marjanović on 12.12.2022..
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var tweetData :TweetData
    
    @State var query: String = ""
    
    var foundTweets: [TweetModel]{
        return tweetData.tweets.filter{ tweet in
            return tweet.content.lowercased()
                .contains(query.lowercased())
        }
    }
    
    var body: some View {
        VStack{
            TextField("Query", text: $query)
                .textFieldStyle(.roundedBorder)
            
            List(foundTweets){tweetModel in
                Tweet(tweet: Binding.constant(tweetModel))
            }
            .listStyle(.plain)
            Spacer()
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(TweetData())
    }
}
