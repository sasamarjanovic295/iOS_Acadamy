//
//  UserData.swift
//  Birdy (iOS)
//
//  Created by Saša Marjanović on 12.12.2022..
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var username: String = "username"
    @Published var image: String = "crow"
    @Published var favoriteTweets: Set<String> = []
}
