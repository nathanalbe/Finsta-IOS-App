//
//  User.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/8/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Steve_W", profileImageUrl: nil, fullname: "Steve Walts", bio: "Programmer", email: "Steve123@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "Bob.J", profileImageUrl: nil, fullname: "Bob Johnson", bio: "Digital Marketer",email: "Bob123@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "TM_Graphics", profileImageUrl: nil, fullname: "Tony Malone", bio: "Graphic Designer",email: "Tony123@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "Icon", profileImageUrl: nil, fullname: "Jaden Smith", bio: "Actor",email: "Jaden123@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "Nate_A", profileImageUrl: nil, fullname: "Nate Albe", bio: "Aspiring Software Engineer",email: "Nate123@gmail.com")
    ]
}
