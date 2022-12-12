//
//  TweetData.swift
//  Birdy (iOS)
//
//  Created by Saša Marjanović on 12.12.2022..
//

import Foundation
import Combine

class TweetData: ObservableObject {
    @Published  var tweets:[TweetModel] = [
        TweetModel(
            content: "Tweet1",
            username: "username",
            date: Date(),
            image: "crow"
        ),
        TweetModel(
            content: "Tweet 2",
            username: "username",
            date: Date(),
            image: "crow"
        ),
        TweetModel(
            content: "Tweet 3",
            username: "username",
            date: Date(),
            image: "crow"
        )
    ]
}
