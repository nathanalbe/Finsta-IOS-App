//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/12/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
    @MainActor
    func toggleLike(postId: String, uid: String) async throws {
        try await PostService.toggleLike(postId: postId, uid: uid)
        let likedPostIndex = posts.firstIndex { post in
                post.id == postId
        }

        if let index = likedPostIndex {
            if posts[index].liked!.contains(uid) {
                posts[index].likes -= 1
                posts[index].liked!.removeAll(where: { $0 == uid })
            } else {
                posts[index].likes += 1
                posts[index].liked!.append(uid)
            }
        }
    }
}
