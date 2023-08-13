//
//  Post.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/8/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    var liked: [String]?
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "cool",
              likes: 123,
              imageUrl: "1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]
             ),
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Test Caption",
              likes: 13,
              imageUrl: "2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[1]
             ),
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Graphics",
              likes: 24,
              imageUrl: "3",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[2]
             ),
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Chrome extension",
              likes: 52,
              imageUrl: "icon",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[3]
             ),
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "me",
              likes: 5,
              imageUrl: "profile-pic",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4]
             )
    ]
}
