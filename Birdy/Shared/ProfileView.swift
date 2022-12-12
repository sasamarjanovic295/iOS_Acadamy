//
//  ProfileView.swift
//  Birdy (iOS)
//
//  Created by Saša Marjanović on 12.12.2022..
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var tweetData: TweetData
    @EnvironmentObject var userData: UserData
    
    var userTweets: [TweetModel]{
        return tweetData.tweets.filter{tweet in
            return tweet.username == userData.username
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Image(userData.image)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                Text(userData.username)
                    .font(.title)
                    .bold()
                Spacer()
            }
            List(userTweets){tweet in
                Tweet(tweet: Binding.constant(tweet))
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(TweetData())
            .environmentObject(UserData())
    }
}
